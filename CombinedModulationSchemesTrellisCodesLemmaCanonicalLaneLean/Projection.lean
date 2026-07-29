import CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean

open CanonicalLaneMathlibCore

def trellisProjection : Projection TrellisEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem trellis_projection_idempotent (x : TrellisEndgameState) :
    trellisProjection.toFun (trellisProjection.toFun x) = trellisProjection.toFun x := by
  exact trellisProjection.idempotent x

end CombinedModulationSchemesTrellisCodesLemmaCanonicalLaneLean
end HautevilleHouse