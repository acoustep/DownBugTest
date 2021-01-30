//
//  ViewController.swift
//  DownTest
//
//  Created by Mitch Stanley on 30/01/2021.
//

import Cocoa
import Down

class TestViewController: NSViewController {

    @IBOutlet weak var customView: NSView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        renderDownInWebView()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

private extension TestViewController {
    
    func renderDownInWebView() {
        let readMeURL = Bundle.main.url(forResource: nil, withExtension: "md")!
        let readMeContents = try! String(contentsOf: readMeURL)
        debugPrint(readMeContents)
        do {
            let downView = try DownView(frame: view.bounds, markdownString: readMeContents, didLoadSuccessfully: {
                print("Markdown was rendered.")
            })
            downView.autoresizingMask = [.width, .height]
            view.addSubview(downView, positioned: .below, relativeTo: nil)
        } catch {
            NSApp.presentError(error)
        }
    }
}
