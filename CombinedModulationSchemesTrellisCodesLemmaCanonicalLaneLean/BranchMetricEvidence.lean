import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean

structure BranchMetricEvidence where
  branchMetric : Type u
  metricComputation : Type v
  additivityProperty : Prop
  maximalRatioCombining : Prop
  pathMetricAccumulation : Prop

def BranchMetricEvidenceClosed (B : BranchMetricEvidence) : Prop :=
  B.additivityProperty ∧ B.maximalRatioCombining ∧ B.pathMetricAccumulation

structure BranchMetricEvidenceCert (B : BranchMetricEvidence) where
  additivityClosed : B.additivityProperty
  maximalRatioCombiningClosed : B.maximalRatioCombining
  pathMetricAccumulationClosed : B.pathMetricAccumulation

theorem branch_metric_evidence_closed_from_evidence (B : BranchMetricEvidence) (C : BranchMetricEvidenceCert B) :
    BranchMetricEvidenceClosed B := by
  exact And.intro C.additivityClosed (And.intro C.maximalRatioCombiningClosed C.pathMetricAccumulationClosed)

end CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean
end HautevilleHouse