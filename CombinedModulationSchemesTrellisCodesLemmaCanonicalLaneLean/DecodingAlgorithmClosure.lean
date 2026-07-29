import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean.CombinedModulationLemma

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean

structure DecodingAlgorithmClosure where
  algorithm : Type u
  complexity : Prop
  errorProbability : Prop
  maximumLikelihood : Prop

def DecodingAlgorithmClosureClosed (D : DecodingAlgorithmClosure) : Prop :=
  D.complexity ∧ D.errorProbability ∧ D.maximumLikelihood

structure DecodingAlgorithmEvidence (D : DecodingAlgorithmClosure) where
  complexityClosed : D.complexity
  errorProbabilityClosed : D.errorProbability
  maximumLikelihoodClosed : D.maximumLikelihood

theorem decoding_algorithm_closure_closed_from_evidence (D : DecodingAlgorithmClosure) (E : DecodingAlgorithmEvidence D) :
    DecodingAlgorithmClosureClosed D := by
  exact And.intro E.complexityClosed (And.intro E.errorProbabilityClosed E.maximumLikelihoodClosed)

end CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean
end HautevilleHouse