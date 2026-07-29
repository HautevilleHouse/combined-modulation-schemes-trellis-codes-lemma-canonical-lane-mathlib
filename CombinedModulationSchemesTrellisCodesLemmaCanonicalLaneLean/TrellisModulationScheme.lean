import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean

structure TrellisModulationScheme where
  stateSpace : Type u
  inputAlphabet : Type v
  outputAlphabet : Type w
  transitionFunction : stateSpace → inputAlphabet → stateSpace × outputAlphabet
  trellisDepth : ℕ
  encodingRate : ℕ × ℕ
  spectralEfficiency : ℝ

structure TrellisModulationEvidence (S : TrellisModulationScheme) where
  transitionFunctionTotal : ∀ s i, (S.transitionFunction s i).1 = S.transitionFunction s i
  trellisDepthPositive : S.trellisDepth > 0
  encodingRateComponentsPositive : S.encodingRate.1 > 0 ∧ S.encodingRate.2 > 0
  spectralEfficiencyPositive : S.spectralEfficiency > 0

def TrellisModulationClosed (S : TrellisModulationScheme) : Prop :=
  transitionFunctionTotal S ∧ trellisDepthPositive S ∧
  encodingRateComponentsPositive S ∧ spectralEfficiencyPositive S

lemma trellis_modulation_closed_from_evidence (S : TrellisModulationScheme)
  (E : TrellisModulationEvidence S) : TrellisModulationClosed S := by
  exact And.intro E.transitionFunctionTotal
    (And.intro E.trellisDepthPositive
      (And.intro E.encodingRateComponentsPositive E.spectralEfficiencyPositive))

end CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean
end HautevilleHouse