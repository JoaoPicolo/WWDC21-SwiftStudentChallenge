import SpriteKit
import AVFoundation


public class ImageScene: SKScene {
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
    
    // CropNode Definitions
    let cropNode = SKCropNode()
    let masksParent = SKSpriteNode()
    let image = SKSpriteNode(imageNamed: "selfPortrait")
    var revealed = false

    // Function to be run when app starts
    override public func didMove(to view: SKView) {
        self.backgroundColor = .white
        
        image.scale(to: CGSize(width: 400.0, height: 500.0))
        image.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 150)
        cropNode.addChild(image)
        cropNode.maskNode = masksParent
        self.addChild(cropNode)

        backgroundPiano.position.x = self.frame.midX - 230
        backgroundPiano.position.y = self.frame.midY - 350
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
        setNote(note: noteDo, x: self.frame.midX - 196, y: self.frame.midY - 255, color: .white)
        setNote(note: noteRe, x: self.frame.midX - 130, y: self.frame.midY - 255,color: .white)
        setNote(note: noteMi, x: self.frame.midX - 64, y: self.frame.midY - 255,color: .white)
        setNote(note: noteFa, x: self.frame.midX + 2, y: self.frame.midY - 255,color: .white)
        setNote(note: noteSol, x: self.frame.midX + 68, y: self.frame.midY - 255, color: .white)
        setNote(note: noteLa, x: self.frame.midX + 134, y: self.frame.midY - 255, color: .white)
        setNote(note: noteSi, x: self.frame.midX + 200, y: self.frame.midY - 255, color: .white)

        setNote(note: noteDoSharp, x: self.frame.midX - 163, y: self.frame.midY - 230, color: .black)
        setNote(note: noteReSharp, x: self.frame.midX - 97, y: self.frame.midY - 230, color: .black)
        setNote(note: noteFaSharp, x: self.frame.midX + 35, y: self.frame.midY - 230, color: .black)
        setNote(note: noteSolSharp, x: self.frame.midX + 101, y: self.frame.midY - 230, color: .black)
        setNote(note: noteLaSharp, x: self.frame.midX + 167, y: self.frame.midY - 230, color: .black)
        addChildren(tappableNodes.map({ $0.node.buttonNode! }))
    }
    
    func setNote(note: SceneNote, x: CGFloat, y: CGFloat, color: UIColor) {
        note.buttonNode!.color = color
        note.buttonNode!.colorBlendFactor = 1
        note.buttonNode!.position.x = x
        note.buttonNode!.position.y = y
        
        note.keyColor = color
        tappableNodes.append((note, { node in
            self.revealImage()
            note.soundNode.first(where: { !$0.isPlaying })?.play()
        }))
    }
    
    func revealImage() {
        let randX = CGFloat.random(in: -100...300)
        let randY = CGFloat.random(in: -100...300)
        let mask = SKShapeNode(rectOf: CGSize(width: 200, height: 200))
        mask.position = CGPoint(x: self.frame.midX + randX, y: self.frame.midY + randY)
        mask.fillColor = .white
        mask.alpha = 0
        
        mask.run(SKAction.fadeAlpha(by: 1, duration: 0.5))
        masksParent.addChild(mask)
        cropNode.maskNode = masksParent
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
