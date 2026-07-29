import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean.CombinedModulationTrellisFramework
import HautevilleHouse.CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean.TrellisCodeConstruction

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean

structure CombinedModulationLemma where
  modulationFramework : ModulationFramework
  trellisCode : TrellisCodeConstruction
  combinedSymbolRate : Prop
  diversityOrder : Prop
  codingGain : Prop

structure CombinedModulationLemmaEvidence (L : CombinedModulationLemma) where
  combinedSymbolRateClosed : L.combinedSymbolRate
  diversityOrderClosed : L.diversityOrder
  codingGainClosed : L.codingGain

def CombinedModulationLemmaClosed (L : CombinedModulationLemma) : Prop :=
  L.combinedSymbolRate ∧ L.diversityOrder ∧ L.codingGain

theorem combined_modulation_lemma_closed_from_evidence (L : CombinedModulationLemma) (E : CombinedModulationLemmaEvidence L) :
    CombinedModulationLemmaClosed L := by
  exact And.intro E.combinedSymbolRateClosed (And.intro E.diversityOrderClosed E.codingGainClosed)

end CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean
end HautevilleHouse