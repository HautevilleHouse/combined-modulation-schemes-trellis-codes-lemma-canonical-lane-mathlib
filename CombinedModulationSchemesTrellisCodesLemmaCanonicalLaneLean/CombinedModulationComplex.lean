import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean

/-!
# Combined Modulation Complex

This module defines the combined modulation scheme structure used in trellis codes.
-/

structure CombinedModulationPackage where
  signalConstellation : Type u
  trellisStructure : Type v
  modulationOrder : Nat
  codeRate : Rat
  constellationPoints : Nat
  modulationClosed : Prop

structure CombinedModulationEvidence (C : CombinedModulationPackage) where
  modulationOrderClosed : C.modulationOrder = 2 ^ C.codeRate.den
  constellationPointsClosed : C.constellationPoints = 2 ^ C.modulationOrder
  modulationClosedClosed : C.modulationClosed

def CombinedModulationClosed (C : CombinedModulationPackage) : Prop :=
  C.modulationOrder = 2 ^ C.codeRate.den ∧ C.constellationPoints = 2 ^ C.modulationOrder ∧ C.modulationClosed

theorem combined_modulation_closed_from_evidence (C : CombinedModulationPackage) (E : CombinedModulationEvidence C) : CombinedModulationClosed C := by
  exact And.intro E.modulationOrderClosed (And.intro E.constellationPointsClosed E.modulationClosedClosed)

end CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean
end HautevilleHouse