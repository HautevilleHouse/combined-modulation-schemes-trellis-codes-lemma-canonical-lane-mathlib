import canonicalLaneMathlib.AdmissibleClass
import CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean.CombinedTCMCodebook

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean

structure RotationallyInvariantCodePackage {S : TrellisModulationScheme}
  (C : CombinedTCMCodebook S) where
  rotationGroup : Type u
  invarianceUnderRotation : Prop
  differentialEncoding : Prop
  rotationalInvarianceGain : ℝ
  invarianceUnderRotationClosed : invarianceUnderRotation
  differentialEncodingClosed : differentialEncoding
  rotationalInvarianceGainPositive : rotationalInvarianceGain > 0

structure RotationallyInvariantCodeEvidence {S : TrellisModulationScheme}
  {C : CombinedTCMCodebook S} (R : RotationallyInvariantCodePackage C) where
  invarianceUnderRotationClosed : R.invarianceUnderRotation
  differentialEncodingClosed : R.differentialEncoding
  rotationalInvarianceGainPositive : R.rotationalInvarianceGain > 0

def RotationallyInvariantCodeClosed {S : TrellisModulationScheme}
  {C : CombinedTCMCodebook S} (R : RotationallyInvariantCodePackage C) : Prop :=
  R.invarianceUnderRotation ∧ R.differentialEncoding ∧ R.rotationalInvarianceGain > 0

theorem rotationally_invariant_code_closed_from_evidence {S : TrellisModulationScheme}
  {C : CombinedTCMCodebook S} (R : RotationallyInvariantCodePackage C)
  (E : RotationallyInvariantCodeEvidence R) : RotationallyInvariantCodeClosed R := by
  exact And.intro E.invarianceUnderRotationClosed
    (And.intro E.differentialEncodingClosed E.rotationalInvarianceGainPositive)

end CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean
end HautevilleHouse