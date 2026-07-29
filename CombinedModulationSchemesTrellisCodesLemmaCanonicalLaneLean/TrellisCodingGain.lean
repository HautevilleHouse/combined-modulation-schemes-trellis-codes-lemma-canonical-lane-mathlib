import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean

/-!
# Trellis Coding Gain Package

This module captures the coding gain achieved by trellis codes over combined modulation schemes.
-/

structure TrellisCodingGainPackage where
  uncodedGain : ℝ
  codedGain : ℝ
  asymptoticCodingGain : ℝ
  errorEventProbability : Prop
  freeDistance : ℕ

def CodingGain (P : TrellisCodingGainPackage) : ℝ :=
  P.codedGain - P.uncodedGain

structure TrellisCodingGainEvidence (P : TrellisCodingGainPackage) where
  asymptoticCodingGainClosed : P.asymptoticCodingGain = CodingGain P
  freeDistanceClosed : P.freeDistance > 0
  errorEventProbabilityClosed : P.errorEventProbability

def TrellisCodingGainClosed (P : TrellisCodingGainPackage) : Prop :=
  P.asymptoticCodingGain = CodingGain P ∧ P.freeDistance > 0 ∧ P.errorEventProbability

theorem trellis_coding_gain_closed_from_evidence (P : TrellisCodingGainPackage) (E : TrellisCodingGainEvidence P) : TrellisCodingGainClosed P := by
  exact And.intro E.asymptoticCodingGainClosed (And.intro E.freeDistanceClosed E.errorEventProbabilityClosed)

end CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean
end HautevilleHouse