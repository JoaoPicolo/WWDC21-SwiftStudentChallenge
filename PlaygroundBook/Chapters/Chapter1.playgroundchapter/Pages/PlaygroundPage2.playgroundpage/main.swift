//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
import PlaygroundSupport
import SpriteKit
import UIKit
import BookCore

let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 1366, height: 1024))
let scene = PianoScene(fileNamed: "PianoScene.sks")!
sceneView.presentScene(scene)
scene.scaleMode = .aspectFill

func setColor(note: Note, color: UIColor) {
    scene.changeColor(note: note, color: color)
}

PlaygroundPage.current.liveView = sceneView
PlaygroundPage.current.needsIndefiniteExecution = true
//#-end-hidden-code

/*: Playground for WWDC 21
 
 ## A Synesthete's World
 
 Each person has its own experiences, memories and sensations.
 Therefore each one of us has its own way to see, feel and experience the world.
 
 ---
 
 Because of this unique view, there are things that some of us can never imagine to exist.
**Synesthesia** is one of these things: it happens when two distinct body senses get mixed
 and produce a unique perception in the life of the **synesthetes**.
 
 **Chromesthesia** is a type of synesthesia. It happens when a person naturally sees a color while listening
 to a sound, this sound can simply be the tick of a clock or even the Four Seasons Concerti by Antonio Vivaldi.
 
 Even people with this type of synesthesia experience the world on its own way, the same sound can have different
 colors that vary from person to person.
 
 ---
 
 If you're a synesthete, this playground invites you to show the world how you perceive sounds.
 If you're not, then you can walk on the shoes of a synesthete for a moment in order to experience
 their unique way to see the world.
 
 ---
 
 ## How it works
 
 Below you're given the opportunity to assign a color to the seven main musical
 notes of chromatic scale. These modifications affect directly how the playground works
 creating different experiences according to the sounds you play on the piano.
 
 - Note:
 The default colors are the colors most used by Vincent Van Gogh in his paintings, although
 we can't know precisely which color he saw while listening to a sound this is an attempt to represent
 how he could perceive the world in his own way.
*/

setColor(note: .Do, color: /*#-editable-code*/#colorLiteral(red: 1, green: 0.8628836274, blue: 0.01882403344, alpha: 1)/*#-end-editable-code*/)
setColor(note: .Re, color: /*#-editable-code*/#colorLiteral(red: 0.9091686606, green: 0.200002104, blue: 0.008982954547, alpha: 1)/*#-end-editable-code*/)
setColor(note: .Mi, color: /*#-editable-code*/#colorLiteral(red: 0.5706360936, green: 0.2082035244, blue: 0.1833514869, alpha: 1)/*#-end-editable-code*/)
setColor(note: .Fa, color: /*#-editable-code*/#colorLiteral(red: 0.03231159225, green: 0.2210976183, blue: 0.6725968122, alpha: 1)/*#-end-editable-code*/)
setColor(note: .Sol, color: /*#-editable-code*/#colorLiteral(red: 0.700242579, green: 0.4547227621, blue: 0.0744465664, alpha: 1)/*#-end-editable-code*/)
setColor(note: .La, color: /*#-editable-code*/#colorLiteral(red: 0.001863505691, green: 0.193105787, blue: 0.3238745332, alpha: 1)/*#-end-editable-code*/)
setColor(note: .Si, color: /*#-editable-code*/#colorLiteral(red: 0.315513432, green: 0.7816289663, blue: 0.4729833007, alpha: 1)/*#-end-editable-code*/)
