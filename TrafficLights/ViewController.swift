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
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.setTitle("START", for: .normal)
        redView.alpha = TURN_OFF_THE_LIGHT
        redView.layer.cornerRadius = RADIUS_OF_TRAFFIC_LIGHT
        yellowView.alpha = TURN_OFF_THE_LIGHT
        yellowView.layer.cornerRadius = RADIUS_OF_TRAFFIC_LIGHT
        greenView.alpha = TURN_OFF_THE_LIGHT
        greenView.layer.cornerRadius = RADIUS_OF_TRAFFIC_LIGHT
    }

    //MARK: - IB Actions
    @IBAction func tappedNextButton(_ sender: UIButton) {
        if nextButton.titleLabel?.text == "START" {
            nextButton.setTitle("NEXT", for: .normal)
            redView.alpha = 1
        } else {
            if redView.alpha == 1 {
                yellowView.alpha = 1
                redView.alpha = TURN_OFF_THE_LIGHT
            } else {
                if yellowView.alpha == 1 {
                    greenView.alpha = 1
                    yellowView.alpha = TURN_OFF_THE_LIGHT
                } else {
                    if greenView.alpha == 1 {
                        redView.alpha = 1
                        greenView.alpha = TURN_OFF_THE_LIGHT
                    }
                }
                
                
            }
            
            
        }
        
    }
    
}

