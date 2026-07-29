import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean

/-!
# Viterbi Algorithm Complexity Package

This module defines the complexity bounds for the Viterbi algorithm decoding trellis codes.
-/

structure ViterbiComplexityPackage where
  trellisStates : ℕ
  trellisBranches : ℕ
  tracebackLength : ℕ
  decodingComplexity : ℕ → ℕ

structure ViterbiComplexityEvidence (V : ViterbiComplexityPackage) where
  stateComplexityClosed : V.decodingComplexity V.trellisStates = V.trellisStates * V.trellisBranches
  tracebackComplexityClosed : V.decodingComplexity V.tracebackLength = V.tracebackLength
  complexityMonotone : ∀ n m, n ≤ m → V.decodingComplexity n ≤ V.decodingComplexity m

def ViterbiComplexityClosed (V : ViterbiComplexityPackage) : Prop :=
  V.decodingComplexity V.trellisStates = V.trellisStates * V.trellisBranches ∧
  V.decodingComplexity V.tracebackLength = V.tracebackLength ∧
  ∀ n m, n ≤ m → V.decodingComplexity n ≤ V.decodingComplexity m

theorem viterbi_complexity_closed_from_evidence (V : ViterbiComplexityPackage) (E : ViterbiComplexityEvidence V) : ViterbiComplexityClosed V := by
  exact And.intro E.stateComplexityClosed (And.intro E.tracebackComplexityClosed E.complexityMonotone)

end CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean
end HautevilleHouse