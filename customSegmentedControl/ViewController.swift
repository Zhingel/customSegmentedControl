//
//  ViewController.swift
//  customSegmentedControl
//
//  Created by Стас Жингель on 24.08.2021.
//

import UIKit

class ViewController: UIViewController, MyCustomSegmentControlDelegate {
    var myDayArray = ["1","2","3","4","5"]
    @IBOutlet weak var wharDayTitle: UILabel!
    let mydayCharacterArray = ["👻","🎃","😀","✈️","🚁"]
    func segmentValueChanged(to index: Int) {
        self.wharDayTitle.text = myDayArray[index] + mydayCharacterArray[index]
    }
    

    override func loadView() {
        super.loadView()
        let myCustomSegmentControl = MyCustomSegmentControl(frame: CGRect(x: 0, y: 0, width: 200, height: 200), buttonTitles: myDayArray)
        myCustomSegmentControl.mySegment = self
        self.view.addSubview(myCustomSegmentControl)
        
        myCustomSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        myCustomSegmentControl.widthAnchor.constraint(equalToConstant: 400).isActive = true
        myCustomSegmentControl.heightAnchor.constraint(equalToConstant: 100).isActive = true
        myCustomSegmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        myCustomSegmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      //  myCustomSegmentControl.backgroundColor = .red
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

