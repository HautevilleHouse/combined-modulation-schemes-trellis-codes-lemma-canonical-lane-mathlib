import canonicalLaneMathlib.AdmissibleClass
import CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean.TrellisModulationScheme

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean

structure CombinedTCMCodebook (S : TrellisModulationScheme) where
  codeSequences : ℕ → Set (List (S.outputAlphabet))
  pathMetric : (List (S.outputAlphabet) × List (S.outputAlphabet)) → ℝ
  minimumDistance : ℝ
  asymptoticCodingGain : ℝ
  rotationalInvariance : Prop
  constellationShaping : Prop

structure CombinedTCMCodebookEvidence {S : TrellisModulationScheme}
  (C : CombinedTCMCodebook S) where
  codeSequencesNonempty : C.codeSequences 0 ≠ ∅
  pathMetricNonnegative : ∀ x y, C.pathMetric (x, y) ≥ 0
  minimumDistancePositive : C.minimumDistance > 0
  asymptoticCodingGainPositive : C.asymptoticCodingGain > 0
  rotationalInvarianceClosed : C.rotationalInvariance
  constellationShapingClosed : C.constellationShaping

def CombinedTCMCodebookClosed {S : TrellisModulationScheme}
  (C : CombinedTCMCodebook S) : Prop :=
  C.codeSequences 0 ≠ ∅ ∧ (∀ x y, C.pathMetric (x, y) ≥ 0) ∧ C.minimumDistance > 0 ∧
  C.asymptoticCodingGain > 0 ∧ C.rotationalInvariance ∧ C.constellationShaping

def CombinedTCMCodebookClosed' {S : TrellisModulationScheme}
  (C : CombinedTCMCodebook S) : Prop :=
  codeSequencesNonempty C ∧ pathMetricNonnegative C ∧ minimumDistancePositive C ∧
  asymptoticCodingGainPositive C ∧ rotationalInvarianceClosed C ∧ constellationShapingClosed C

theorem combined_tcm_codebook_closed_from_evidence {S : TrellisModulationScheme}
  (C : CombinedTCMCodebook S) (E : CombinedTCMCodebookEvidence C) :
  CombinedTCMCodebookClosed C := by
  exact And.intro E.codeSequencesNonempty
    (And.intro E.pathMetricNonnegative
      (And.intro E.minimumDistancePositive
        (And.intro E.asymptoticCodingGainPositive
          (And.intro E.rotationalInvarianceClosed E.constellationShapingClosed))))

end CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean
end HautevilleHouse