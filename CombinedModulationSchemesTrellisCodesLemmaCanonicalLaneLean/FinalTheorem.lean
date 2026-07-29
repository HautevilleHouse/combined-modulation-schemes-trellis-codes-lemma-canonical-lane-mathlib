import CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean

def ConstrainedCombinedModulationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_combined_modulation_endgame (A : AdmissibleClass) :
    ConstrainedCombinedModulationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean
end HautevilleHouse