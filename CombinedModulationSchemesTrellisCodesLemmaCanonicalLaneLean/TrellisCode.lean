import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean

structure TrellisCodeState where
  stateSet : Type u
  transitionRelation : stateSet → stateSet → Prop
  initialStates : Set stateSet
  finalStates : Set stateSet

def TrellisCodeEdgeLabel (E : Type v) : Type (max u v) :=
  stateSet × E × stateSet

structure TrellisCode (S : Type u) (E : Type v) where
  states : S → Prop
  labels : E → Prop
  transitions : Set (TrellisCodeEdgeLabel E)
  deterministic : Prop
  finiteMemory : Prop
  encoderDefined : Prop

structure TrellisCodeEvidence (S : Type u) (E : Type v) (T : TrellisCode S E) where
  deterministicClosed : T.deterministic
  finiteMemoryClosed : T.finiteMemory
  encoderDefinedClosed : T.encoderDefined

def TrellisCodeClosed (S : Type u) (E : Type v) (T : TrellisCode S E) : Prop :=
  T.deterministic ∧ T.finiteMemory ∧ T.encoderDefined

theorem trellis_code_closed_from_evidence (S : Type u) (E : Type v) (T : TrellisCode S E)
    (Ev : TrellisCodeEvidence S E T) : TrellisCodeClosed S E T := by
  exact And.intro Ev.deterministicClosed (And.intro Ev.finiteMemoryClosed Ev.encoderDefinedClosed)

end CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean
end HautevilleHouse