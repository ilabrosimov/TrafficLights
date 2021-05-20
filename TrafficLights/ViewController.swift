//
//  ViewController.swift
//  TrafficLights
//
//  Created by ilabrosimov on 18.05.2021.
//

import UIKit
enum CurrentLight {
    case red, yellow, green
}
class ViewController: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    
    //MARK: - Constants
    private var currentLight: CurrentLight = .red
    private let lightIsOff :CGFloat = 0.3
    private let lightIsOn : CGFloat = 1
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.setTitle("START", for: .normal)
        turnOffTrafficLights()
        makeRoundTheLights()
    }

    
    //MARK: - IB Actions
    @IBAction func tappedNextButton(_ sender: UIButton) {
        if nextButton.titleLabel?.text == "START" {
            nextButton.setTitle("NEXT", for: .normal)
            redView.alpha = lightIsOn
        } else {
            turnNextTrafficLight(redAlpha: redView.alpha, yellowAlpha: yellowView.alpha, greenAlpha: greenView.alpha)
            
        }
        
        
        
    }
    //MARK: - Methods

    func turnNextTrafficLight(redAlpha:CGFloat, yellowAlpha:CGFloat, greenAlpha:CGFloat)  {
        switch currentLight  {
        case .red:
            redView.alpha = lightIsOff
            yellowView.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            yellowView.alpha = lightIsOff
            greenView.alpha = lightIsOn
            currentLight = .green
        case .green:
            greenView.alpha = lightIsOff
            redView.alpha = lightIsOn
            currentLight = .red
        }
    }
    
    func turnOffTrafficLights() {
        redView.alpha = lightIsOff
        yellowView.alpha = lightIsOff
        greenView.alpha = lightIsOff
    }
    
    func makeRoundTheLights() {
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = redView.frame.width / 2
        greenView.layer.cornerRadius = redView.frame.width / 2
    }
}

