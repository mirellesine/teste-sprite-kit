//
//  GameScene.swift
//  teste3
//
//  Created by Mirelle Sine on 06/07/23.
//

import SpriteKit
import GameplayKit

struct MascaraBit {
    static let Laser: UInt32 = 2
}

class GameScene: SKScene {
    
    var circle = SKShapeNode()
    var laser = SKNode()
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        addLaser()
        addCircle()
    }
    
    func addCircle(){
        circle = SKShapeNode(circleOfRadius: 70)
        circle.fillColor = .yellow
        circle.position = CGPoint(x: size.width/2, y: size.height + 70)
        circle.name = "Circle"
        circle.physicsBody?.isDynamic = true
        circle.physicsBody = SKPhysicsBody(circleOfRadius: 70)
        circle.physicsBody?.contactTestBitMask = MascaraBit.Laser
        circle.physicsBody?.collisionBitMask = 0
        addChild(circle)
    }
    
    func addLaser(){
        laser.position = CGPoint(x: self.size.width , y: 0)
        laser.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width, height: 1))
        laser.physicsBody?.isDynamic = false
        laser.physicsBody?.categoryBitMask = MascaraBit.Laser
        laser.physicsBody?.collisionBitMask = 0
        laser.name = "Laser"
        addChild(laser)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            addCircle()
            
            circle.physicsBody = SKPhysicsBody(circleOfRadius: 70)
        }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let firstTouch = touches.first
//        let location = firstTouch?.location(in: self)
//
//        quadrado.position = location ?? .zero
//    }
}

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "Laser" || contact.bodyB.node?.name == "Laser"{
            print("Teve contato aqui!")
        }
    }
}


