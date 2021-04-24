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
let scene = GameScene(fileNamed: "GameScene.sks")!
sceneView.presentScene(scene)
scene.scaleMode = .aspectFill

PlaygroundPage.current.liveView = sceneView
PlaygroundPage.current.needsIndefiniteExecution = true
//#-end-hidden-code

/*: Playground for WWDC 21
 
 # The man who heard colors
 
 - Note:
 Please use your playground on Fullscreen for a better experience.
 
 Vincent Van Gogh is a well-known dutch post-impressionist painter.
 He's responsible for some of the most brilliant and beautiful masterpieces in
 history of art.
 
 
![Vang Gogh self portrait](selfPortrait.png "Van Gogh's self portrait")
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Photo available at vangoghgallery.com
 
 
 ## Van Gogh and Chromesthesia
 
 Have you ever got surprised when someone asked you the color of a sound?
 
 Some people naturally associates a color to a sound or vice versa, these people have a
 neurological condition called **chromesthesia**.
 
 ---
 
 It's believed that Van Gogh had chromesthesia. In 1888 he wrote to his brother Theo: "But I’m again the way I was in Nuenen, when I made a vain attempt to learn music - even then - so strongly did I feel the connections there are between our colour and Wagner’s music."
 
 This letter was written after Van Gogh attempt to study piano, in 1885. During his piano classes
 he declared to his teacher that **the experience of playing was overwhelming because each note evoked a color**.
 
 Hein van der Zanden, Van Gogh's teacher, got scared with this declaration and started to see the painter
 as a insane person, dismissing him from the classes.
 
*/

