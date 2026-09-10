"""Independent arbitrary-precision verifier and exact change-of-basis certificate.

Only Python's standard library is required.  The source generators are rebuilt
from their geometric definitions rather than trusted from the JSON file.
"""
import itertools
import json
from collections import defaultdict, Counter
from fractions import Fraction
from pathlib import Path

ROOT=Path(__file__).resolve().parent
source=json.loads((ROOT/'closure_certificate.json').read_text())
S=(1,1,1,-1,1,-1)
PAIRS=list(itertools.combinations(range(6),2))
POS={p:i for i,p in enumerate(PAIRS)}
D=15

def zero(n):return [[0]*n for _ in range(n)]
def mul(a,b):
    # Python integers are arbitrary precision.
    n=len(a)
    out=zero(n)
    for i in range(n):
        for k in range(n):
            if a[i][k]:
                for j in range(n):
                    if b[k][j]:out[i][j]+=a[i][k]*b[k][j]
    return out

def bracket(a,b):
    ab,ba=mul(a,b),mul(b,a)
    return [[x-y for x,y in zip(r,s)] for r,s in zip(ab,ba)]

def scale(c,a):return [[c*x for x in row] for row in a]
def transpose(a):return list(map(list,zip(*a)))
def add(a,b):return [[x+y for x,y in zip(r,s)] for r,s in zip(a,b)]

def ambient_generators():
    out=[]
    for a,b in PAIRS:
        m=zero(6);m[a][b]=S[b];m[b][a]=-S[a]
        out.append(m)
    return out

def coordinates(m,ambient):
    c=[m[a][b]*S[b] for a,b in PAIRS]
    rec=zero(6)
    for z,a in zip(c,ambient):rec=add(rec,scale(z,a))
    assert rec==m, 'Matrix lies outside asserted orthogonal basis.'
    return c

def build_generators():
    ambient=ambient_generators()
    eta=zero(6)
    for i,s in enumerate(S):eta[i][i]=s
    for m in ambient:assert add(mul(transpose(m),eta),mul(eta,m))==zero(6)
    adj=[transpose([coordinates(bracket(a,b),ambient) for b in ambient]) for a in ambient]
    h=zero(D)
    for a,b in itertools.combinations(range(4),2):
        c,d=[i for i in range(4) if i not in (a,b)]
        perm=(a,b,c,d)
        sign=(-1)**sum(perm[i]>perm[j] for i in range(4) for j in range(i+1,4))
        h[POS[c,d]][POS[a,b]]=S[a]*S[b]*sign
    projector=zero(D)
    for a,b in itertools.combinations(range(4),2):
        projector[POS[a,b]][POS[a,b]]=1
        assert bracket(adj[POS[a,b]],h)==zero(D)
    assert mul(h,h)==scale(-1,projector)
    q=zero(D)
    for i,(a,b) in enumerate(PAIRS):q[i][i]=S[a]*S[b]
    assert all(add(mul(transpose(a),q),mul(q,a))==zero(D) for a in adj)
    assert mul(transpose(h),q)==mul(q,h)
    return [*adj,h]

GENERATORS=build_generators()
assert source['generators']==GENERATORS
WORDS=[]
for n,recipe in enumerate(source['recipes']):
    if recipe[0]=='generator':
        assert 0<=recipe[1]<len(GENERATORS)
        w=GENERATORS[recipe[1]]
    else:
        assert recipe[0]=='bracket'
        assert 0<=recipe[1]<len(GENERATORS) and 0<=recipe[2]<n
        w=bracket(GENERATORS[recipe[1]],WORDS[recipe[2]])
    assert sum(w[i][i] for i in range(D))==0
    WORDS.append(w)
assert len(WORDS)==224

# Every word is homogeneous for the Z_2^6 grading.  Matrix unit E_ij has
# degree pair(i) symmetric_difference pair(j).  This splits the determinant
# into one 14x14, fifteen 8x8, and fifteen 6x6 blocks after deleting E_14,14.
def degree(i,j):return tuple(sorted(set(PAIRS[i])^set(PAIRS[j])))
word_blocks=defaultdict(list)
for n,w in enumerate(WORDS):
    support={degree(i,j) for i in range(D) for j in range(D) if w[i][j]}
    assert len(support)==1
    word_blocks[next(iter(support))].append(n)
coord_blocks=defaultdict(list)
for i in range(D):
    for j in range(D):
        if (i,j)!=(14,14):coord_blocks[degree(i,j)].append((i,j))
assert word_blocks.keys()==coord_blocks.keys()

def inverse_and_determinant(m):
    n=len(m)
    a=[[Fraction(x) for x in row]+[Fraction(int(i==j)) for j in range(n)] for i,row in enumerate(m)]
    det=Fraction(1)
    for c in range(n):
        pivot=next(i for i in range(c,n) if a[i][c])
        if pivot!=c:a[pivot],a[c]=a[c],a[pivot];det=-det
        v=a[c][c];det*=v
        a[c]=[x/v for x in a[c]]
        for i in range(n):
            if i!=c and a[i][c]:
                v=a[i][c];a[i]=[x-v*y for x,y in zip(a[i],a[c])]
    assert [r[:n] for r in a]==[[Fraction(int(i==j)) for j in range(n)] for i in range(n)]
    return [r[n:] for r in a],det

combinations=[]
blocks=[]
for deg in sorted(coord_blocks):
    coords=coord_blocks[deg]
    indices=word_blocks[deg]
    assert len(coords)==len(indices)
    matrix=[[WORDS[k][i][j] for k in indices] for i,j in coords]
    inverse,det=inverse_and_determinant(matrix)
    assert det.denominator==1 and det!=0
    blocks.append({'degree':list(deg),'word_indices':indices,'coordinates':[list(ij) for ij in coords], 'determinant':int(det)})
    for c,(i,j) in enumerate(coords):
        coeff=[inverse[k][c] for k in range(len(indices))]
        result=zero(D)
        for z,k in zip(coeff,indices):
            if z: result=add(result,scale(z,WORDS[k]))
        target=zero(D);target[i][j]=1
        if i==j:target[14][14]=-1
        assert result==target, f'Failed exact matrix-unit certificate for {i},{j}'
        combinations.append({'target':[i,j], 'terms':[[k,z.numerator,z.denominator] for k,z in zip(indices,coeff) if z]})
assert len(combinations)==224

det_product=1
for b in blocks:det_product*=b['determinant']
print('PASS: 224 independent exact integer Lie words; all 224 trace-free matrix units reconstructed.')
print('Block dimensions:',dict(Counter(len(b['word_indices']) for b in blocks)))
print('Block determinants:',dict(Counter(b['determinant'] for b in blocks)))
print('Absolute full determinant:',abs(det_product))
print('Coefficient denominators:',dict(Counter(t[2] for row in combinations for t in row['terms'])))
print('Largest combination length:',max(len(row['terms']) for row in combinations))
print('Largest integer matrix entry:',max(abs(x) for m in WORDS for row in m for x in row))
output={'definitions':{'metric_diagonal':S,'basis_pairs':PAIRS}, 'recipes':source['recipes'], 'blocks':blocks,'matrix_unit_combinations':combinations}
(ROOT/'exact_matrix_unit_certificate.json').write_text(json.dumps(output,indent=2)+'\n')
print('Wrote exact_matrix_unit_certificate.json')
