import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean

structure CombinedModulationScheme (M : ModulationScheme) (T : TrellisCode (stateSet M.signalSet) M.signalSet) where
  baseScheme : M
  trellis : T
  combinedSignalSet : Type v
  mappingFunction : combinedSignalSet → M.signalSet
  mappingInjective : Prop
  encodingLatency : Prop
  spectralEfficiency : Prop

structure CombinedModulationEvidence (M : ModulationScheme) (T : TrellisCode (stateSet M.signalSet) M.signalSet)
    (C : CombinedModulationScheme M T) where
  mappingInjectiveClosed : C.mappingInjective
  encodingLatencyClosed : C.encodingLatency
  spectralEfficiencyClosed : C.spectralEfficiency

def CombinedModulationClosed (M : ModulationScheme) (T : TrellisCode (stateSet M.signalSet) M.signalSet)
    (C : CombinedModulationScheme M T) : Prop :=
  C.mappingInjective ∧ C.encodingLatency ∧ C.spectralEfficiency

theorem combined_modulation_closed_from_evidence (M : ModulationScheme) (T : TrellisCode (stateSet M.signalSet) M.signalSet)
    (C : CombinedModulationScheme M T) (Ev : CombinedModulationEvidence M T C) :
    CombinedModulationClosed M T C := by
  exact And.intro Ev.mappingInjectiveClosed (And.intro Ev.encodingLatencyClosed Ev.spectralEfficiencyClosed)

end CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean
end HautevilleHouse