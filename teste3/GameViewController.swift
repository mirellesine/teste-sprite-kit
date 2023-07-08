//
//  GameViewController.swift
//  teste3
//
//  Created by Mirelle Sine on 06/07/23.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            let scene = GameScene(size: view.bounds.size)
            scene.scaleMode = .aspectFill

            view.presentScene(scene)

            // Otimizar o desenho na cena.
            view.ignoresSiblingOrder = false

            // Ignorar (apenas para mostrar elementos de FPS e quantidade de nós na cena).
            view.showsFPS = false
            view.showsNodeCount = false
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
