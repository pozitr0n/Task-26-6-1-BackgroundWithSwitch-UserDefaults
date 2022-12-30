//
//  ViewController.swift
//  Task_26_6_1_BackgroundWithSwitch
//
//  Created by Raman Kozar on 30/12/2022.
//

import UIKit

class ViewController: UIViewController {

    // Creating image view by code
    //
    let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    }()
    
    // Creating switch by code
    //
    lazy var switchFlag: UISwitch = {
        
        let switchFlag = UISwitch()
        
        switchFlag.transform = CGAffineTransformMakeScale(1.3, 1.3);
        
        switchFlag.tintColor = .white
        switchFlag.onTintColor = .brown
        switchFlag.thumbTintColor = .white
        
        switchFlag.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
        switchFlag.translatesAutoresizingMaskIntoConstraints = false
    
        return switchFlag
        
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        // Getting values from UserDefaults
        let imageForShowing = UserDefaults.standard.string(forKey: "ImageName")
        let colorForShowing = UserDefaults.standard.string(forKey: "BackgroundColor")
        let switchPositionForShowing = UserDefaults.standard.bool(forKey: "SwitchPosition")
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        // Setting values from UserDefaults
        imageView.image = UIImage(named: imageForShowing ?? "djFirst")
        view.backgroundColor = UIColor(named: colorForShowing ?? "ColorFirst")
        switchFlag.setOn(switchPositionForShowing, animated: true)
         
        view.addSubview(imageView)
        view.addSubview(switchFlag)
        
        setUpAutoLayout()
    
    }
    
    // Setting the constraints
    //
    func setUpAutoLayout() {
        
        NSLayoutConstraint.activate([imageView.widthAnchor.constraint(equalToConstant: 400),
                                     imageView.heightAnchor.constraint(equalToConstant: 650),
                                     imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([switchFlag.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     switchFlag.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20)])
        
    }
    
    // Clicking function (using switch on-off)
    //
    @objc func switchValueDidChange(_ sender: UISwitch) {
        
        if (sender.isOn) {
            
            sender.setOn(true, animated: true)
            
            view.backgroundColor = UIColor(named: "ColorSecond")
            imageView.image = UIImage(named: "djSecond")
            setUserDataByUserDefaults(imageName: "djSecond", colorName: "ColorSecond", switchPosition: true)
            
        } else {
            
            sender.setOn(false, animated: true)
            
            view.backgroundColor = UIColor(named: "ColorFirst")
            imageView.image = UIImage(named: "djFirst")
            setUserDataByUserDefaults(imageName: "djFirst", colorName: "ColorFirst", switchPosition: false)
            
        }
        
    }
    
    // Saving data into user defaults
    //
    func setUserDataByUserDefaults(imageName: String, colorName: String, switchPosition: Bool) {

        let defaultValue = UserDefaults.standard
        
        defaultValue.set(imageName, forKey: "ImageName")
        defaultValue.set(colorName, forKey: "BackgroundColor")
        defaultValue.set(switchPosition, forKey: "SwitchPosition")
        
    }

}
