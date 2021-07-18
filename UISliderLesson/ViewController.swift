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
    @IBOutlet weak var resetSwitch: UISwitch!
    
    
    var xSliderValue = Float()
    var ySliderValue = Float()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        onMovingImageView.layer.cornerRadius = 15.0
        onMovingImageView.frame = CGRect(x:UIScreen.main.bounds.minX + 20, y: UIScreen.main.bounds.minY + 44, width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 1.6)
        
        moveImage.frame = CGRect(x: onMovingImageView.bounds.minX, y: onMovingImageView.bounds.minY, width: onMovingImageView.frame.size.width / 5, height: onMovingImageView.frame.size.height / 10)
        moveImage.layer.cornerRadius = 15.0
        moveImage.layer.shadowOffset = CGSize(width: 7, height: 7)
        moveImage.layer.shadowOpacity = 0.5
        moveImage.layer.shadowRadius = 7
        moveImage.layer.masksToBounds = false
                
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
    
    @IBAction func xPointYPointReset(_ sender: Any) {
        
        if resetSwitch.isOn == false{
            
            moveImage.frame = CGRect(x: onMovingImageView.bounds.minX, y: onMovingImageView.bounds.minY, width: onMovingImageView.frame.size.width / 5, height: onMovingImageView.frame.size.height / 10)
            
            xPointSliderItem.value = Float(onMovingImageView.bounds.minX)
            yPointSliderItem.value = Float(onMovingImageView.bounds.minY)
            
            xPointLabel.text = String(Float(onMovingImageView.bounds.minX))
            yPointLabel.text = String(Float(onMovingImageView.bounds.minY))
            
            xSliderValue = Float(onMovingImageView.bounds.minX)
            ySliderValue = Float(onMovingImageView.bounds.minY)
        }
        
    }
    
}
