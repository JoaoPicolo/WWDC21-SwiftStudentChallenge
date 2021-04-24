import SpriteKit
import AVFoundation
import PlaygroundSupport


public class PianoScene: SKScene {
    let backgroundPiano = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 464, height: 184))
    let startPoint = CGPoint(x: 1, y: 1)
    let endPoint = CGPoint(x: 0, y: 0)
    var gradientNode: SKSpriteNode?
    
    let defaultColor = UIColor(red: 0.91, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
    var gradientColors: [CGColor] = []
    
    // Notes
    var noteDo = SceneNote()
    var noteRe = SceneNote()
    var noteMi = SceneNote()
    var noteFa = SceneNote()
    var noteSol = SceneNote()
    var noteLa = SceneNote()
    var noteSi = SceneNote()
    
    // Sharp Notes
    var noteDoSharp = SceneNote()
    var noteReSharp = SceneNote()
    var noteFaSharp = SceneNote()
    var noteSolSharp = SceneNote()
    var noteLaSharp = SceneNote()
    
    // Tappable Infos
    var tappedNode: SceneNote?
    var tappableNodes: [(node: SceneNote, action: (SceneNote) -> ())] = []
    
    // Balloons
    let balloon1 = SKSpriteNode(imageNamed: "pianoBalloon1")
    let balloon2 = SKSpriteNode(imageNamed: "pianoBalloon2")
    let balloon3 = SKSpriteNode(imageNamed: "pianoBalloon3")
    var clickedNumber = 1

    // Function to be run when app starts
    override public func didMove(to view: SKView) {
        self.backgroundColor  = .white
        // Scene
        gradientColors = [defaultColor, defaultColor]
        let image: UIImage = UIImage.gradientImage(withBounds: self.frame, startPoint: startPoint, endPoint: endPoint,
                                                   colors: gradientColors)
        let gradientTexture = SKTexture(image: image)
        gradientNode = SKSpriteNode(texture: gradientTexture)
        gradientNode!.zPosition = -1
        self.addChild(gradientNode!)

        backgroundPiano.position.x = self.frame.midX - 230
        backgroundPiano.position.y = self.frame.midY - 380
        backgroundPiano.fillColor = .black
        backgroundPiano.strokeColor = .black
        addChild(backgroundPiano)

        // Sounds
        do {
            // Notes sounds
            var path = Bundle.main.path(forResource: "Do.mp3", ofType: nil)
            noteDo.soundNode = (0...5).map { _ in try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!)) }


            path = Bundle.main.path(forResource: "Re.mp3", ofType: nil)
            noteRe.soundNode = (0...5).map { _ in try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!)) }

            path = Bundle.main.path(forResource: "Mi.mp3", ofType: nil)
            noteMi.soundNode = (0...5).map { _ in try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!)) }

            path = Bundle.main.path(forResource: "Fa.mp3", ofType: nil)
            noteFa.soundNode = (0...5).map { _ in try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!)) }

            path = Bundle.main.path(forResource: "Sol.mp3", ofType: nil)
            noteSol.soundNode = (0...5).map { _ in try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!)) }

            path = Bundle.main.path(forResource: "La.mp3", ofType: nil)
            noteLa.soundNode = (0...5).map { _ in try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!)) }

            path = Bundle.main.path(forResource: "Si.mp3", ofType: nil)
            noteSi.soundNode = (0...5).map { _ in try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!)) }

            // Sharp notes sounds
            path = Bundle.main.path(forResource: "DoSharp.mp3", ofType: nil)
            noteDoSharp.soundNode = (0...5).map { _ in try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!)) }

            path = Bundle.main.path(forResource: "ReSharp.mp3", ofType: nil)
            noteReSharp.soundNode = (0...5).map { _ in try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!)) }

            path = Bundle.main.path(forResource: "FaSharp.mp3", ofType: nil)
            noteFaSharp.soundNode = (0...5).map { _ in try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!)) }

            path = Bundle.main.path(forResource: "SolSharp.mp3", ofType: nil)
            noteSolSharp.soundNode = (0...5).map { _ in try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!)) }

            path = Bundle.main.path(forResource: "LaSharp.mp3", ofType: nil)
            noteLaSharp.soundNode = (0...5).map { _ in try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!)) }
        } catch {}

        // Notes rects
        noteDo.buttonNode = SKSpriteNode(imageNamed: "pianoLargeKey")
        noteRe.buttonNode = SKSpriteNode(imageNamed: "pianoLargeKey")
        noteMi.buttonNode = SKSpriteNode(imageNamed: "pianoLargeKey")
        noteFa.buttonNode = SKSpriteNode(imageNamed: "pianoLargeKey")
        noteSol.buttonNode = SKSpriteNode(imageNamed: "pianoLargeKey")
        noteLa.buttonNode = SKSpriteNode(imageNamed: "pianoLargeKey")
        noteSi.buttonNode = SKSpriteNode(imageNamed: "pianoLargeKey")

        // Sharp notes rects
        noteDoSharp.buttonNode = SKSpriteNode(imageNamed: "pianoSmallKey")
        noteReSharp.buttonNode = SKSpriteNode(imageNamed: "pianoSmallKey")
        noteFaSharp.buttonNode = SKSpriteNode(imageNamed: "pianoSmallKey")
        noteSolSharp.buttonNode = SKSpriteNode(imageNamed: "pianoSmallKey")
        noteLaSharp.buttonNode = SKSpriteNode(imageNamed: "pianoSmallKey")

        // Final setup
        setNote(note: noteDo, x: self.frame.midX - 196, y: self.frame.midY - 285, color: .white)
        setNote(note: noteRe, x: self.frame.midX - 130, y: self.frame.midY - 285,color: .white)
        setNote(note: noteMi, x: self.frame.midX - 64, y: self.frame.midY - 285,color: .white)
        setNote(note: noteFa, x: self.frame.midX + 2, y: self.frame.midY - 285,color: .white)
        setNote(note: noteSol, x: self.frame.midX + 68, y: self.frame.midY - 285, color: .white)
        setNote(note: noteLa, x: self.frame.midX + 134, y: self.frame.midY - 285, color: .white)
        setNote(note: noteSi, x: self.frame.midX + 200, y: self.frame.midY - 285, color: .white)

        setNote(note: noteDoSharp, x: self.frame.midX - 163, y: self.frame.midY - 260, color: .black)
        setNote(note: noteReSharp, x: self.frame.midX - 97, y: self.frame.midY - 260, color: .black)
        setNote(note: noteFaSharp, x: self.frame.midX + 35, y: self.frame.midY - 260, color: .black)
        setNote(note: noteSolSharp, x: self.frame.midX + 101, y: self.frame.midY - 260, color: .black)
        setNote(note: noteLaSharp, x: self.frame.midX + 167, y: self.frame.midY - 260, color: .black)
        addChildren(tappableNodes.map({ $0.node.buttonNode! }))
    }
    
    func setNote(note: SceneNote, x: CGFloat, y: CGFloat, color: UIColor) {
        note.buttonNode!.color = color
        note.buttonNode!.colorBlendFactor = 1
        note.buttonNode!.position.x = x
        note.buttonNode!.position.y = y
        
        note.keyColor = color
        tappableNodes.append((note, { node in
            self.newGradient(color: note.color!)
            note.soundNode.first(where: { !$0.isPlaying })?.play()
        }))
    }
    
    func newGradient(color: UIColor) {
        gradientColors.removeFirst()
        gradientColors.append(color.cgColor)
        let image: UIImage = UIImage.gradientImage(withBounds: self.frame, startPoint: self.startPoint, endPoint: self.endPoint,
                                                   colors: self.gradientColors)
        let gradientTexture = SKTexture(image: image)
        gradientNode = SKSpriteNode(texture: gradientTexture)
        gradientNode!.zPosition = -1
        
        self.addChild(gradientNode!)
    }

    
    public func changeColor(note: Note, color: UIColor) {
        switch note {
        case .Do:
            noteDo.color = color
            noteDoSharp.color = color.darker(by: 10)
        case .Re:
            noteRe.color = color
            noteReSharp.color = color.darker(by: 10)
        case .Mi:
            noteMi.color = color
        case .Fa:
            noteFa.color = color
            noteFaSharp.color = color.darker(by: 10)
        case .Sol:
            noteSol.color = color
            noteSolSharp.color = color.darker(by: 10)
        case .La:
            noteLa.color = color
            noteLaSharp.color = color.darker(by: 10)
        case .Si:
            noteSi.color = color
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        guard let node = tappableNodes.last(where: { $0.node.buttonNode!.contains(pos)} )?.node else {
            return
        }

        node.buttonNode!.color = node.color!
        tappedNode = node
    }

    func touchUp(atPoint pos : CGPoint) {
        tappedNode?.buttonNode?.color = tappedNode?.keyColor ?? .white
        
        guard let tuple = tappableNodes.last(where: { $0.node.buttonNode!.contains(pos)} ) else {
            return
        }
        
        clickedNumber += 1
        if clickedNumber == 3 {
            balloon1.alpha = 0
            balloon1.position = CGPoint(x: self.frame.midX + 180, y: self.frame.midY + 30)
            self.addChild(balloon1)
            balloon1.run(SKAction.sequence([SKAction.fadeAlpha(by: 1, duration: 0.5), SKAction.wait(forDuration: 1.5), SKAction.fadeOut(withDuration: 1.5)]))
        }
        else if clickedNumber == 9 {
            balloon2.alpha = 0
            balloon2.position = CGPoint(x: -200, y: self.frame.midY + 120)
            self.addChild(balloon2)
            balloon2.run(SKAction.sequence([SKAction.fadeAlpha(by: 1, duration: 0.5), SKAction.wait(forDuration: 1.5), SKAction.fadeOut(withDuration: 1.5)]))
        }
        else if clickedNumber == 15 {
            balloon3.alpha = 0
            balloon3.position = CGPoint(x: self.frame.midX + 150, y: self.frame.midY + 30)
            self.addChild(balloon3)
            balloon3.run(SKAction.sequence([SKAction.fadeAlpha(by: 1, duration: 0.5), SKAction.wait(forDuration: 2.2), SKAction.fadeOut(withDuration: 1.5)]))
        }
        else if clickedNumber == 20 {
            PlaygroundPage.current.assessmentStatus = .pass(message: "When you're ready, you can go to the [next page](@next).")
        }
        
        if tuple.node.buttonNode == tappedNode?.buttonNode {
            // Key returns to original key
            tuple.action(tuple.node)
            tappedNode = nil
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

public enum Note {
    case Do
    case Re
    case Mi
    case Fa
    case Sol
    case La
    case Si
}

extension SKScene {
    func addChildren(_ children: [SKNode]) {
        children.forEach({ addChild($0) })
    }
}

extension UIColor {
    func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }

    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }

    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}

extension UIImage {
    static func gradientImage(withBounds: CGRect, startPoint: CGPoint, endPoint: CGPoint , colors: [CGColor]) -> UIImage {
        
        // Configure the gradient layer based on input
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = withBounds
        gradientLayer.colors = colors
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        // Render the image using the gradient layer
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}

class SceneNote {
    var buttonNode: SKSpriteNode? = nil
    var soundNode: [AVAudioPlayer] = []
    var keyColor: UIColor? = nil
    var color: UIColor? = nil
}
