import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean

structure ModulationScheme where
  carrier : Type u
  signalSet : Type v
  dimension : Nat
  powerConstraint : Prop
  signalSetFinite : Prop

structure ModulationSchemeEvidence (M : ModulationScheme) where
  powerConstraintClosed : M.powerConstraint
  signalSetFiniteClosed : M.signalSetFinite

def ModulationSchemeClosed (M : ModulationScheme) : Prop :=
  M.powerConstraint ∧ M.signalSetFinite

theorem modulation_scheme_closed_from_evidence (M : ModulationScheme) (E : ModulationSchemeEvidence M) :
    ModulationSchemeClosed M := by
  exact And.intro E.powerConstraintClosed E.signalSetFiniteClosed

end CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean
end HautevilleHouse