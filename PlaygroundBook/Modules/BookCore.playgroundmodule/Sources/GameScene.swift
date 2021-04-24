import SpriteKit
import AVFoundation
import PlaygroundSupport

public class GameScene: SKScene {
    let path = Bundle.main.path(forResource: "background.mp3", ofType: nil)
    var audioPlayer: AVAudioPlayer?
    
    let background1 = SKSpriteNode(imageNamed: "firstScene")
    let balloon1 = SKSpriteNode(imageNamed: "balloon1")
    let balloon2 = SKSpriteNode(imageNamed: "balloon2")
    let balloon3 = SKSpriteNode(imageNamed: "balloon3")

    
    let background2 = SKSpriteNode(imageNamed: "secondScene")
    let balloon4 = SKSpriteNode(imageNamed: "balloon4")
    let balloon5 = SKSpriteNode(imageNamed: "balloon5")
    let balloon6 = SKSpriteNode(imageNamed: "balloon6")
    
    let play = SKSpriteNode(imageNamed: "playButton")

    // Function to be run when app starts
    override public func didMove(to view: SKView) {
        self.backgroundColor  = .white
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.play()
        } catch {}
        
        // First Scene
        self.addChild(background1)
        
        balloon1.position.x = -100
        balloon1.position.y = self.frame.midY - 180
        balloon1.alpha = 0
        self.addChild(balloon1)
        balloon1.run(SKAction.sequence([SKAction.wait(forDuration: 2.0), SKAction.fadeAlpha(to: 1, duration: 0.5), SKAction.wait(forDuration: 2.0), SKAction.fadeOut(withDuration: 1.0)]))

        balloon2.position.x = -100
        balloon2.position.y = self.frame.midY - 180
        balloon2.alpha = 0
        self.addChild(balloon2)
        balloon2.run(SKAction.sequence([SKAction.wait(forDuration: 6.0), SKAction.fadeAlpha(to: 1, duration: 0.5), SKAction.wait(forDuration: 4.0), SKAction.fadeOut(withDuration: 1.0)]))
        
        balloon3.position.x = -90
        balloon3.position.y = self.frame.midY - 180
        balloon3.alpha = 0
        self.addChild(balloon3)
        balloon3.run(SKAction.sequence([SKAction.wait(forDuration: 12.0), SKAction.fadeAlpha(to: 1, duration: 0.5), SKAction.wait(forDuration: 5.0), SKAction.fadeOut(withDuration: 1.0)]))

        background1.run(SKAction.sequence([SKAction.wait(forDuration: 18.0), SKAction.fadeOut(withDuration: 1.0)]))

        // Second Scene
        background2.alpha = 0
        self.addChild(background2)
        background2.run(SKAction.sequence([SKAction.wait(forDuration: 18.0), SKAction.fadeAlpha(to: 1, duration: 0.5)]))

        balloon4.position.x = -60
        balloon4.position.y = self.frame.midY - 180
        balloon4.alpha = 0
        self.addChild(balloon4)
        balloon4.run(SKAction.sequence([SKAction.wait(forDuration: 19.5), SKAction.fadeAlpha(to: 1, duration: 0.5), SKAction.wait(forDuration: 7.0), SKAction.fadeOut(withDuration: 1.0)]))

        balloon5.position.x = -50
        balloon5.position.y = self.frame.midY - 180
        balloon5.alpha = 0
        self.addChild(balloon5)
        balloon5.run(SKAction.sequence([SKAction.wait(forDuration: 28.0), SKAction.fadeAlpha(to: 1, duration: 0.5), SKAction.wait(forDuration: 7.0), SKAction.fadeOut(withDuration: 1.0)]))

        balloon6.position.x = -100
        balloon6.position.y = self.frame.midY - 180
        balloon6.alpha = 0
        self.addChild(balloon6)
        balloon6.run(SKAction.sequence([SKAction.wait(forDuration: 37.0), SKAction.fadeAlpha(to: 1, duration: 0.5), SKAction.wait(forDuration: 6.0), SKAction.fadeOut(withDuration: 1.0)]))
        
        play.alpha = 0
        play.position.x = self.frame.midX - 20
        play.position.y = self.frame.midY - 400
        self.addChild(play)
        play.run(SKAction.sequence([SKAction.wait(forDuration: 44.0), SKAction.fadeAlpha(to: 1, duration: 0.5)]))
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if play.contains(pos) {
            play.color = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
            play.colorBlendFactor = 1
        }
    }

    func touchUp(atPoint pos : CGPoint) {
        if play.contains(pos) {
            play.color = .white
            PlaygroundPage.current.assessmentStatus = .pass(message: "Great, let's do it!")
            PlaygroundPage.current.navigateTo(page: .next)
        }
    }

    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
    }

    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }

    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
}
