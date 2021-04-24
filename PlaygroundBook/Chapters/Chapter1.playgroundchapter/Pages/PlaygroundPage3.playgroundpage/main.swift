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
let scene = ImageScene(fileNamed: "ImageScene.sks")!
sceneView.presentScene(scene)
scene.scaleMode = .aspectFill

func setColor(note: Note, color: UIColor) {
    scene.changeColor(note: note, color: color)
}

PlaygroundPage.current.liveView = sceneView
PlaygroundPage.current.needsIndefiniteExecution = true
//#-end-hidden-code

/*: Playground for WWDC 21
 
 ## Reveal Van Gogh
 
 Thank you for playing.
 
 Your task now is to reveal Van Gogh's self portrait while playing the piano, if you're lucky you'll be able to do it.
 Meanwhile, feel free to invite your friends to share this experience together.
 
 ---
 
 #### Credits
 
 - The music "No.7 Alone With My Thoughts" played on the first page belongs to Esther Abrami and can be found on YouTube Studio
 - The paintings "Starry Night", "Irises", and "Self-Portrait" from Van Gogh can be found at www.vangoghgallery.com
 - The speech ballons belongs to studiogstock and can be found on Freepik
 
*/

setColor(note: .Do, color: /*#-editable-code*/#colorLiteral(red: 1, green: 0.8628836274, blue: 0.01882403344, alpha: 1)/*#-end-editable-code*/)
setColor(note: .Re, color: /*#-editable-code*/#colorLiteral(red: 0.9091686606, green: 0.200002104, blue: 0.008982954547, alpha: 1)/*#-end-editable-code*/)
setColor(note: .Mi, color: /*#-editable-code*/#colorLiteral(red: 0.001863505691, green: 0.193105787, blue: 0.3238745332, alpha: 1)/*#-end-editable-code*/)
setColor(note: .Fa, color: /*#-editable-code*/#colorLiteral(red: 0.315513432, green: 0.7816289663, blue: 0.4729833007, alpha: 1)/*#-end-editable-code*/)
setColor(note: .Sol, color: /*#-editable-code*/#colorLiteral(red: 0.700242579, green: 0.4547227621, blue: 0.0744465664, alpha: 1)/*#-end-editable-code*/)
setColor(note: .La, color: /*#-editable-code*/#colorLiteral(red: 0.5706360936, green: 0.2082035244, blue: 0.1833514869, alpha: 1)/*#-end-editable-code*/)
setColor(note: .Si, color: /*#-editable-code*/#colorLiteral(red: 0.03231159225, green: 0.2210976183, blue: 0.6725968122, alpha: 1)/*#-end-editable-code*/)
