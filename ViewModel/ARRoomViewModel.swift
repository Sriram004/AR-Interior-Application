import Foundation
import Combine
import RealityKit
import ARKit

class ARRoomViewModel: ObservableObject {
    @Published var selectedModel: FurnitureModel?
    @Published var placedModels: [ModelEntity] = []

    var subscriptions = Set<AnyCancellable>()

    func placeSelectedModel(on anchorEntity: AnchorEntity, in arView: ARView) {
        guard let model = selectedModel, let modelEntity = model.modelEntity else { return }

        modelEntity.generateCollisionShapes(recursive: true)
        modelEntity.physicsBody = PhysicsBodyComponent(massProperties: .default,
                                                        material: .default,
                                                        mode: .static)

        anchorEntity.addChild(modelEntity)
        arView.scene.addAnchor(anchorEntity)

        placedModels.append(modelEntity)
        selectedModel = nil
    }

    func clearPlacedModels(from arView: ARView) {
        for model in placedModels {
            model.removeFromParent()
        }
        placedModels.removeAll()
    }
}
