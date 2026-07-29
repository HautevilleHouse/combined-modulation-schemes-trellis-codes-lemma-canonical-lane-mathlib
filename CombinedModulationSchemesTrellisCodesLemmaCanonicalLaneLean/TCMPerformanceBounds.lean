import canonicalLaneMathlib.AdmissibleClass
import CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean.TrellisModulationScheme
import CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean.CombinedTCMCodebook

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean

structure TCMPerformanceBoundsPackage {S : TrellisModulationScheme}
  (C : CombinedTCMCodebook S) where
  errorProbabilityBound : ℝ
  codingGainBound : ℝ
  asymptoticEfficiency : ℝ
  errorExponent : ℝ
  unionBoundComputed : Prop
  errorProbabilityUpperBound : errorProbabilityBound ≤ 1
  codingGainLowerBound : codingGainBound ≥ 0
  asymptoticEfficiencyPositive : asymptoticEfficiency > 0

structure TCMPerformanceBoundsEvidence {S : TrellisModulationScheme}
  {C : CombinedTCMCodebook S} (T : TCMPerformanceBoundsPackage C) where
  unionBoundComputedClosed : T.unionBoundComputed
  errorProbabilityUpperBoundClosed : T.errorProbabilityBound ≤ 1
  codingGainLowerBoundClosed : T.codingGainBound ≥ 0
  asymptoticEfficiencyPositiveClosed : T.asymptoticEfficiency > 0

def TCMPerformanceBoundsClosed {S : TrellisModulationScheme}
  {C : CombinedTCMCodebook S} (T : TCMPerformanceBoundsPackage C) : Prop :=
  T.unionBoundComputed ∧ T.errorProbabilityBound ≤ 1 ∧
  T.codingGainBound ≥ 0 ∧ T.asymptoticEfficiency > 0

theorem tcm_performance_bounds_closed_from_evidence {S : TrellisModulationScheme}
  {C : CombinedTCMCodebook S} (T : TCMPerformanceBoundsPackage C)
  (E : TCMPerformanceBoundsEvidence T) : TCMPerformanceBoundsClosed T := by
  exact And.intro E.unionBoundComputedClosed
    (And.intro E.errorProbabilityUpperBoundClosed
      (And.intro E.codingGainLowerBoundClosed E.asymptoticEfficiencyPositiveClosed))

end CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean
end HautevilleHouse