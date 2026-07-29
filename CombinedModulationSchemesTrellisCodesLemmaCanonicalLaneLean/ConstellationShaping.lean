import canonicalLaneMathlib.AdmissibleClass
import CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean.CombinedTCMCodebook

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean

structure ConstellationShapingPackage {S : TrellisModulationScheme}
  (C : CombinedTCMCodebook S) where
  voronoiRegion : Type u
  shapingGain : ℝ
  peakToAveragePowerRatio : ℝ
  constellationExpanded : Prop
  shapingCodingCombined : Prop
  voronoiPathMetricCompatible : Prop

structure ConstellationShapingEvidence {S : TrellisModulationScheme}
  {C : CombinedTCMCodebook S} (P : ConstellationShapingPackage C) where
  shapingGainPositive : P.shapingGain > 0
  peakToAveragePowerRatioBounded : P.peakToAveragePowerRatio < ∞
  constellationExpandedClosed : P.constellationExpanded
  shapingCodingCombinedClosed : P.shapingCodingCombined
  voronoiPathMetricCompatibleClosed : P.voronoiPathMetricCompatible

def ConstellationShapingClosed {S : TrellisModulationScheme}
  {C : CombinedTCMCodebook S} (P : ConstellationShapingPackage C) : Prop :=
  P.shapingGain > 0 ∧ P.peakToAveragePowerRatio < ∞ ∧ P.constellationExpanded ∧
  P.shapingCodingCombined ∧ P.voronoiPathMetricCompatible

theorem constellation_shaping_closed_from_evidence {S : TrellisModulationScheme}
  {C : CombinedTCMCodebook S} (P : ConstellationShapingPackage C)
  (E : ConstellationShapingEvidence P) : ConstellationShapingClosed P := by
  exact And.intro E.shapingGainPositive
    (And.intro E.peakToAveragePowerRatioBounded
      (And.intro E.constellationExpandedClosed
        (And.intro E.shapingCodingCombinedClosed E.voronoiPathMetricCompatibleClosed)))

end CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean
end HautevilleHouse