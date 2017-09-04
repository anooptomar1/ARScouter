//
//  Scene.swift
//  ARScouter
//
//  Created by Marla Na on 04.09.17.
//  Copyright © 2017 Marla Na. All rights reserved.
//

import SpriteKit
import ARKit

class Scene: SKScene {
    
    let ageLabel = SKLabelNode(text: "Age: ")
    let ageNumberLabel = SKLabelNode(text: "...")
    var agePrediction = 0 {
        didSet{
            //self.ageNumberLabel.text = "\(agePrediction)"
        }
    }
    
    override func didMove(to view: SKView) {
        ageLabel.fontSize = 20
        ageLabel.fontName = "Helvetica"
        ageLabel.color = .white
        ageLabel.position = CGPoint(x: 40, y: 10)
        addChild(ageLabel)
        
        ageNumberLabel.fontSize = 20
        ageNumberLabel.fontName = "Helvetica"
        ageNumberLabel.color = .white
        ageNumberLabel.position = CGPoint(x: 80, y: 10)
        addChild(ageNumberLabel)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        print(agePrediction)
        (agePrediction != 1) ? createAgeAnchor() : nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        
  
    }
    
    func createAgeAnchor(){
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        // Create anchor using the camera's current position
        if let currentFrame = sceneView.session.currentFrame {
            
            // Create a transform with a translation of 0.2 meters in front of the camera
            var translation = matrix_identity_float4x4
            translation.columns.3.z = -0.4
            let transform = simd_mul(currentFrame.camera.transform, translation)
            
            // Add a new anchor to the session
            let anchor = ARAnchor(transform: transform)
            sceneView.session.add(anchor: anchor)
        }
        agePrediction = 1
    }
}

