# Physical response: established structure and remaining implications

## What the generation theorem establishes

The fixed orthogonal adjoint actions and local Hodge operation generate
`sl(15)`. Consequently their least commutator-closed linear response space
has dimension 224. The generators, chosen four-plane and closure requirement
are explicit premises when this result is applied to a physical response.
For an arbitrary physical response algebra, inclusion of these generators
and closure under commutators imply containment of `sl15`. Equality and
dimension 224 additionally require the minimal generated algebra, or a
trace-free upper bound. The larger algebra `gl15` also contains the generators
and is closed under commutators. The theorem does not select a state, a
scalar response magnitude, an entropy density, or a gravitational coupling.

## An exact condition for extending the divide

The existing `HodgeBulkScreen.lean` uses a complex two-dimensional Hodge pair.
Its two chiral projectors give a divide/flip product `(rho Q) I` on that pair.
The separate `scalarResponseMatrix` definition in `UnifiedCouplingGrammar.lean`
assumes a scalar matrix on an arbitrary response space; the structural
exponent file specializes its dimension to 224. These are different spaces
and the earlier proofs do not transport one operator into the other.

The new theorem `two_sided_preserves_trace_zero_iff` supplies a precise test.
For matrices over any commutative ring with a finite nonempty index set,

```text
(for every trace-free T, D T E is trace free)
    iff (there exists r such that E D = r I).
```

The proof uses trace cyclicity, off-diagonal matrix units and diagonal
differences. A verified witness shows that unequal diagonal entries of `ED`
produce a nonzero output trace from a trace-free diagonal difference.

For the local Hodge generator, `H^2=-P`, with `P` the rank-six local
projector. Thus

```text
(a I+b H)(a I-b H) = a^2 I+b^2 P.
```

For real nonzero `b`, the two-sided map with these factors fails the new
trace-preservation test. The six local directions and nine complementary
directions carry unequal product weights.

The original complex chirality is `C=-iH`. Under zero extension, `C^2=P`.
With `a=(rho+Q)/2`, `b=(rho-Q)/2`, the divide and flip instead give

```text
(a I+b C)(a I-b C) = (rho Q) P+a^2 (I-P).
```

This also fails the trace-preservation test for real unequal `rho,Q`.
A complex involution can be assigned on the complement to repair the
algebraic product, but its choice and physical meaning would be additional
input. Over the reals there is no full fifteen-dimensional complex structure:
`J^2=-I` would imply `(det J)^2=-1`.

There is a broader sufficient construction. For invertible factors with
`DE=rI`, the two-sided map is `T ↦ r D T D^-1`. Over characteristic zero,
conjugation has determinant one on `sl15`, so this map has determinant
`r^224` without being a scalar map itself. This determinant argument is
ordinary mathematical reasoning in this note; the selected Lean theorem
checks the trace-preservation criterion. A physical construction of the
factors and a derivation of `r=rho Q` remain necessary.

## Existing action and Gaussian results

The supporting source already contains a doubled quadratic action, exact
first variations, completed-square positivity, partner elimination for an
arbitrary linear operator, and time-dependent TT mode kinetic forms.
`DoubledTTGaussian.lean` relates the action to the Frobenius pairing of the
two TT polarizations and evaluates a real four-dimensional Gaussian. For
the defined quartic response it gives `pi^2/screening`; multiplying by the
defined projective boundary volume gives `pi^4/screening`.

These are concrete variational and integration results. They do not yet
calculate the curvature term of a metric-dependent quantum effective action.
The final displayed coupling identity still divides by the independently
defined `(rho Q)^224` bulk factor. A fixed-mode Gaussian normalization is not
automatically an absolute physical entropy coefficient or Newton coupling.

## A literature route with explicit requirements

The Adler–Zee framework relates an induced Newton coefficient to a regulated
stress-trace correlation function. Casini, Mazzitelli and Testé identify a
direct connection between that correlator term and the area term in
entanglement entropy, while keeping improvement, contact and modular boundary
terms explicit. [Area terms in entanglement entropy](https://arxiv.org/abs/1412.6522).
Donoghue and Menezes carry out an induced-coupling calculation for a
specified QCD-like model using correlation data, perturbation theory and
lattice input. [Inducing the Einstein action in QCD-like theories](https://arxiv.org/abs/1712.04468).

Applying this route to the present action would require a metric-dependent
completion, its physical stress tensor, the full covariant mode spectrum or
stress correlations, and a regulator and renormalization prescription.
Curvature couplings matter: flat-space data alone need not determine them.
The integer 224 counts algebra directions; identifying these with physical
field species or independent horizon states needs a further representation
and constraint analysis. Heat-kernel formulas explicitly depend on such
field content, curvature couplings and ultraviolet scales.
[Newton constant, contact terms and entropy](https://arxiv.org/abs/1502.03758).

Once a physical area-entropy density `eta` is established, Jacobson's
equilibrium argument relates it to `G=1/(4 hbar eta)` in the stated natural
units. It does not determine the microscopic density itself.
[Thermodynamics of Spacetime](https://arxiv.org/abs/gr-qc/9504004).

These sources identify a concrete calculation to undertake. They do not
prove the specific PDT coupling formula, and this bounded search does not
establish that a dynamical completion is impossible.

## Optical repair and energy interpretation

The repaired coordinate family is

```text
X(u,y) = (u, [y dot S y+u |S y|^2]/2, (I+uS)y).
```

For symmetric `S`, its verified label derivatives are orthogonal to the
verified null tangent. Nonsingularity of `I+uS` gives a positive induced
screen pairing. The Perron specialization preserves the earlier transverse
map and satisfies the actual induced-metric evolution `q'=2qB`.

The general finite-cut charge and density are

```text
C(u)=A(u)-u A(u) theta(u),
C'(u)=u A(u)[sigma^2(u)+Ric(k,k)(u)-theta(u)^2/2].
```

For the nonsingular trace-free affine two-screen model, the evolving
shear-minus-expansion density is constant after multiplication by area:
`A(sigma^2-theta^2/2)=2 ell^2`. Its boost integral from zero to `L` is
`ell^2 L^2`, with endpoint expansion retained. The shear-only integral is
different; its logarithmic value is not part of the selected Lean statement.

The nonlinear density and boundary charge match the conventions of
[Faulkner and Speranza, equations 3.27 and 3.31](https://arxiv.org/html/2405.00847v2#S3.SS2).
Their future area/modular relation requires additional gravitational
constraints and future stationarity. The repaired flat family supplies
neither a global event horizon nor a quantum state with that modular
Hamiltonian. Optical shear in flat spacetime is not evidence of gravitational
radiation. The local Clausius premise remains independent of these
coordinate and real-analysis results.
