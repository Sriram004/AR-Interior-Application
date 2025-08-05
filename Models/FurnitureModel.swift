import Foundation
import RealityKit

struct FurnitureModel: Identifiable {
    let id = UUID()
    let name: String
    let modelName: String // corresponds to .usdz file name

    var modelEntity: ModelEntity? {
        let filename = modelName + ".usdz"
        do {
            let entity = try ModelEntity.loadModel(named: filename)
            return entity
        } catch {
            print("[FurnitureModel] Failed to load \(filename): \(error)")
            return nil
        }
    }

    static let catalog: [FurnitureModel] = [
        FurnitureModel(name: "Chair", modelName: "chair"),
        FurnitureModel(name: "Table", modelName: "table"),
        FurnitureModel(name: "Sofa", modelName: "sofa"),
        FurnitureModel(name: "Lamp", modelName: "lamp")
    ]
}
