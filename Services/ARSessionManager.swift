import Foundation
import ARKit

class ARSessionManager: NSObject, ObservableObject, ARSessionDelegate {
    let session = ARSession()
    @Published var meshAnchors: [ARMeshAnchor] = []

    func configureSession() {
        let config = ARWorldTrackingConfiguration()
        config.sceneReconstruction = .meshWithClassification
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic

        session.delegate = self
        session.run(config, options: [.resetTracking, .removeExistingAnchors])
    }

    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        let updatedMeshAnchors = anchors.compactMap { $0 as? ARMeshAnchor }
        DispatchQueue.main.async {
            self.meshAnchors = updatedMeshAnchors
        }
    }

    func resetSession() {
        session.pause()
        configureSession()
    }
}
