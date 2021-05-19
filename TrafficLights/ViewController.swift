//
//  ViewController.swift
//  TrafficLights
//
//  Created by ilabrosimov on 18.05.2021.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    
    //MARK: - Constants
    let RADIUS_OF_TRAFFIC_LIGHT :CGFloat = 40
    let TURN_OFF_THE_LIGHT :CGFloat = 0.3
    let TURN_ON_THE_LIGHT : CGFloat = 1
    
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
            redView.alpha = TURN_ON_THE_LIGHT
        } else {
            turnNextTrafficLight(redAlpha: redView.alpha, yellowAlpha: yellowView.alpha, greenAlpha: greenView.alpha)
            
        }
        
        
        
    }
    //MARK: - Methods

    func turnNextTrafficLight(redAlpha:CGFloat, yellowAlpha:CGFloat, greenAlpha:CGFloat)  {
        switch TURN_ON_THE_LIGHT  {
        case redAlpha: do {
            redView.alpha = TURN_OFF_THE_LIGHT
            yellowView.alpha = TURN_ON_THE_LIGHT
        }
        case yellowAlpha: do {
            yellowView.alpha = TURN_OFF_THE_LIGHT
            greenView.alpha = TURN_ON_THE_LIGHT
        }
        case greenAlpha:  do {
            greenView.alpha = TURN_OFF_THE_LIGHT
            redView.alpha = TURN_ON_THE_LIGHT
        }
            
        default:
            print("Что-то случилось")
        }
    }
    
    func turnOffTrafficLights() {
        redView.alpha = TURN_OFF_THE_LIGHT
        yellowView.alpha = TURN_OFF_THE_LIGHT
        greenView.alpha = TURN_OFF_THE_LIGHT
    }
    
    func makeRoundTheLights() {
        redView.layer.cornerRadius = RADIUS_OF_TRAFFIC_LIGHT
        yellowView.layer.cornerRadius = RADIUS_OF_TRAFFIC_LIGHT
        greenView.layer.cornerRadius = RADIUS_OF_TRAFFIC_LIGHT
    }
}

