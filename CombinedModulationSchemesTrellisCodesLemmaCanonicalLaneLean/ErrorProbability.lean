import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean

structure ErrorProbabilityBound (M : ModulationScheme) (T : TrellisCode (stateSet M.signalSet) M.signalSet) (C : CombinedModulationScheme M T) where
  pairwiseErrorProbability : Prop
  unionBoundDerived : Prop
  viterbiBound : Prop
  codingGainComputed : Prop

def ErrorProbabilityBoundClosed (M : ModulationScheme) (T : TrellisCode (stateSet M.signalSet) M.signalSet) (C : CombinedModulationScheme M T) (E : ErrorProbabilityBound M T C) : Prop :=
  E.pairwiseErrorProbability ∧ E.unionBoundDerived ∧ E.viterbiBound ∧ E.codingGainComputed

structure ErrorProbabilityEvidence (M : ModulationScheme) (T : TrellisCode (stateSet M.signalSet) M.signalSet) (C : CombinedModulationScheme M T) (E : ErrorProbabilityBound M T C) where
  pairwiseErrorProbabilityClosed : E.pairwiseErrorProbability
  unionBoundDerivedClosed : E.unionBoundDerived
  viterbiBoundClosed : E.viterbiBound
  codingGainComputedClosed : E.codingGainComputed

theorem error_probability_closed_from_evidence (M : ModulationScheme) (T : TrellisCode (stateSet M.signalSet) M.signalSet) (C : CombinedModulationScheme M T) (E : ErrorProbabilityBound M T C) (Ev : ErrorProbabilityEvidence M T C E) :
    ErrorProbabilityBoundClosed M T C E := by
  exact And.intro Ev.pairwiseErrorProbabilityClosed
    (And.intro Ev.unionBoundDerivedClosed
      (And.intro Ev.viterbiBoundClosed Ev.codingGainComputedClosed))

end CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean
end HautevilleHouse