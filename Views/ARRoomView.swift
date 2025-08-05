import SwiftUI
import RealityKit
import ARKit

struct ARRoomView: UIViewRepresentable {
    @ObservedObject var viewModel: ARRoomViewModel

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        config.environmentTexturing = .automatic
        config.sceneReconstruction = .meshWithClassification

        arView.session.run(config, options: [.resetTracking, .removeExistingAnchors])

        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:)))
        arView.addGestureRecognizer(tapGesture)

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}

    class Coordinator: NSObject {
        var parent: ARRoomView

        init(_ parent: ARRoomView) {
            self.parent = parent
        }

        @objc func handleTap(_ sender: UITapGestureRecognizer) {
            guard let arView = sender.view as? ARView else { return }
            let location = sender.location(in: arView)

            if let result = arView.raycast(from: location, allowing: .estimatedPlane, alignment: .horizontal).first {
                let anchor = AnchorEntity(world: result.worldTransform.translation)
                parent.viewModel.placeSelectedModel(on: anchor, in: arView)
            }
        }
    }
}

private extension simd_float4x4 {
    var translation: SIMD3<Float> {
        let translation = self.columns.3
        return [translation.x, translation.y, translation.z]
    }
}
