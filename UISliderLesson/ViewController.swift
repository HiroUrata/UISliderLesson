//
//  ViewController.swift
//  UISliderLesson
//
//  Created by UrataHiroki on 2021/07/17.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var moveImage: UIImageView!
    @IBOutlet weak var onMovingImageView: UIView!
    @IBOutlet weak var xPointSliderItem: UISlider!
    @IBOutlet weak var yPointSliderItem: UISlider!
    @IBOutlet weak var xPointLabel: UILabel!
    @IBOutlet weak var yPointLabel: UILabel!
    @IBOutlet weak var viewHiddenSwitch: UISwitch!
    
    
    var xSliderValue = Float()
    var ySliderValue = Float()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        onMovingImageView.frame = CGRect(x:UIScreen.main.bounds.minX + 20, y: UIScreen.main.bounds.minY + 44, width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 1.6)
        
        moveImage.frame = CGRect(x: onMovingImageView.bounds.minX, y: onMovingImageView.bounds.minY, width: onMovingImageView.frame.size.width / 5, height: onMovingImageView.frame.size.height / 10)
        
        xPointSliderItem.minimumValue = Float(onMovingImageView.bounds.minX)
        xPointSliderItem.maximumValue = Float(onMovingImageView.bounds.maxX) - Float(moveImage.frame.size.width)
        yPointSliderItem.minimumValue = Float(onMovingImageView.bounds.minY)
        yPointSliderItem.maximumValue = Float(onMovingImageView.bounds.maxY) - Float(moveImage.frame.size.height)
        
    }
    
    

    @IBAction func xPointSlider(_ sender: UISlider) {
        
        moveImage.frame = CGRect(x: CGFloat(sender.value), y: CGFloat(ySliderValue), width: onMovingImageView.frame.size.width / 5, height: onMovingImageView.frame.size.height / 10)
        
        xSliderValue = sender.value
        xPointLabel.text = String(floor(sender.value * 10) / 10)
        
    }
    
    @IBAction func yPointSlider(_ sender: UISlider) {
        
        moveImage.frame = CGRect(x: CGFloat(xSliderValue) , y: CGFloat(sender.value), width: onMovingImageView.frame.size.width / 5, height: onMovingImageView.frame.size.height / 10)
        
        ySliderValue = sender.value
        yPointLabel.text = String(floor(sender.value * 10) / 10)
        
    }
    
    @IBAction func viewHidden(_ sender: UISwitch) {
        
        if sender.isOn == false{
            
            onMovingImageView.isHidden = true
            
        }else if sender.isOn == true{
            
            onMovingImageView.isHidden = false
            
        }
    }
}

