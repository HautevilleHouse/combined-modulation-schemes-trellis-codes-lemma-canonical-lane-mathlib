import CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean

open CanonicalLaneMathlibCore

structure TrellisSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure TrellisAdmittedObject where
  space : TrellisSpace
  finiteStateMachine : Prop
  decodingComplexity : Prop
  codingGainModel : Type
  modulationCompatibility : TopologicalSpace codingGainModel
  codeOptimality : Prop
  conclusion : codeOptimality

structure TrellisEndgameState where
  object : TrellisAdmittedObject

def TrellisWitnessClosed (O : TrellisAdmittedObject) : Prop :=
  O.codeOptimality

end CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean
end HautevilleHouse