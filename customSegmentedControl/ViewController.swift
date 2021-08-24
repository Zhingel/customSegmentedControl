//
//  ViewController.swift
//  customSegmentedControl
//
//  Created by Стас Жингель on 24.08.2021.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        super.loadView()
        let myCustomSegmentControl = MyCustomSegmentControl(frame: CGRect(x: 0, y: 0, width: 200, height: 200), buttonTitles: ["button1", "button2", "button3", "button4", "button5"])
        self.view.addSubview(myCustomSegmentControl)
        
        myCustomSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        myCustomSegmentControl.widthAnchor.constraint(equalToConstant: 400).isActive = true
        myCustomSegmentControl.heightAnchor.constraint(equalToConstant: 100).isActive = true
        myCustomSegmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        myCustomSegmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myCustomSegmentControl.backgroundColor = .red
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

