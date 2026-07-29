import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean

structure TrellisCodeConstruction where
  trellisDepth : Nat
  stateCount : Nat
  branchLabels : Type u
  trellisGraph : Type v
  pathSelection : Type w
  convolutionalConstraint : Prop

def TrellisCodeConstructionClosed (T : TrellisCodeConstruction) : Prop :=
  T.trellisDepth > 0 ∧ T.stateCount > 0 ∧ T.convolutionalConstraint

structure TrellisCodeEvidence (T : TrellisCodeConstruction) where
  depthPositiveClosed : T.trellisDepth > 0
  statePositiveClosed : T.stateCount > 0
  convolutionalConstraintClosed : T.convolutionalConstraint

theorem trellis_code_construction_closed_from_evidence (T : TrellisCodeConstruction) (E : TrellisCodeEvidence T) :
    TrellisCodeConstructionClosed T := by
  exact And.intro E.depthPositiveClosed (And.intro E.statePositiveClosed E.convolutionalConstraintClosed)

end CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean
end HautevilleHouse