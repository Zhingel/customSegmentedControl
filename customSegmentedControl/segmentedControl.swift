//
//  segmentedControl.swift
//  customSegmentedControl
//
//  Created by Стас Жингель on 24.08.2021.
//

import UIKit

protocol MyCustomSegmentControlDelegate:AnyObject {
    func   segmentValueChanged(to index: Int)
}

class MyCustomSegmentControl: UIView {
    private var buttonTitles: [String]!
    private var buttons: [UIButton]!
    var selectedColor : UIColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    var textColor: UIColor = .black
   public private(set) var selectedIndex: Int = 0
    weak var mySegment : MyCustomSegmentControlDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, buttonTitles: [String]) {
        self.init(frame: frame)
        print("My cus")
        self.buttonTitles = buttonTitles
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print("My custom")
        updateView()
    }
    fileprivate func updateView() {
        createBtn()
        configStackView()
    }
    fileprivate func createBtn() {
        self.buttons = [UIButton]()
        self.buttons.removeAll()
        self.subviews.forEach({$0.removeFromSuperview()})
        for buttonTitleItem in buttonTitles {
            let button  = UIButton(type: .system)
            button.backgroundColor = .white
            button.titleLabel?.textColor = .black
            button.layer.borderWidth = 1
            button.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            button.backgroundColor = .white
            button.layer.cornerRadius = 20
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.titleLabel?.minimumScaleFactor = 0.5
            button.setTitle(buttonTitleItem, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(MyCustomSegmentControl.buttonAction(_:) ), for: .touchUpInside)
            self.buttons.append(button)
        }
        buttons[0].setTitleColor(.white , for: .normal)
        buttons[0].backgroundColor = selectedColor
    }
    fileprivate func configStackView() {
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        
    }
    @objc func buttonAction(_  sender: UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
                self.selectedIndex = buttonIndex
                mySegment?.segmentValueChanged(to:  self.selectedIndex)
                btn.backgroundColor = selectedColor
                btn.setTitleColor(.white, for: .normal)
            } else {
                btn.backgroundColor = .white
                btn.setTitleColor(textColor, for: .normal)
            }
        }
        print("\(selectedIndex)")
    }
}
