//
//  ViewController.swift
//  classwork
//
//  Created by Andrew on 20/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    var labelMain = UILabel()
    var buttonPlus = UIButton()
    let slider = UISlider()
    let pickerAmount = UIPickerView()
    let pickerColor = UIPickerView()
    let colorArray = ["red", "white", "green", "yellow"]
    let switchMain = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        buttonPlus.setImage(UIImage(systemName: "sos"), for: .disabled)
    
        var tabBarItems = UITabBarItem()
        tabBarItems = UITabBarItem(title: "Дом", image: UIImage(systemName: "homekit"), tag: 0)
        self.tabBarItem = tabBarItems
        navigationItem.title = "Первый экран"
        var navItem = UINavigationItem()
        navItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: nil, action: .none)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(alertTarget ))
        
        createSlider()
        createPikerAmount()
        createSwitch()
    }
    
    @objc func alertTarget () {
        let alert = UIAlertController(title: "Введите текст", message: nil, preferredStyle: .alert)
        alert.addTextField()
        let action = UIAlertAction(title: "Send", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else { return }
            self.labelMain.text = text
        }
        alert.addAction(action)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
        createLabel()
    }
    
    func createLabel () {
        labelMain.frame = CGRect(x: 0, y: 100, width: 300, height: 300)
        labelMain.center.x = view.center.x
        labelMain.numberOfLines = 0
        view.addSubview(labelMain)
    }
    
    func createSlider () {
        slider.minimumValue = 2
        slider.maximumValue = 28
        labelMain.font = .boldSystemFont(ofSize: CGFloat(slider.value))
        slider.frame = CGRect(x: 0, y: 400, width: 200, height: 50)
        slider.center.x = view.center.x
        view.addSubview(slider)
        slider.addTarget(self, action: #selector(changeSizeTextFromSlider ), for: .valueChanged)
    }
    
    @objc func changeSizeTextFromSlider() {
        labelMain.font = .boldSystemFont(ofSize: CGFloat(slider.value))
    }
    
    func createPikerAmount(){
        pickerAmount.frame = CGRect(x: 20, y: 450, width: 150, height: 150 )
        view.addSubview(pickerAmount)
        pickerAmount.dataSource = self
        pickerAmount.delegate = self
        pickerAmount.tag = 0
        
        pickerColor.frame = CGRect(x: 230, y: 450, width: 150, height: 150)
        view.addSubview(pickerColor)
        pickerColor.delegate = self
        pickerColor.dataSource = self
        pickerColor.tag = 1
    }
    
    func createSwitch() {
        switchMain.isOn = false
        switchMain.frame = CGRect(x: 0, y: 600, width: 0, height: 0)
        switchMain.center.x = view.center.x
        view.addSubview(switchMain)
        switchMain.addTarget(self, action: #selector(changeSwitch ), for: .valueChanged)
    }
    @objc func changeSwitch() {
        if switchMain.isOn {
            labelMain.shadowColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
            labelMain.shadowOffset = CGSize(width: 3, height: 3)
        } else {
            labelMain.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { 4 }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            labelMain.numberOfLines = row
        } else {
            labelMain.textColor = UIColor(named: "\(colorArray[row])")
            print (colorArray[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            switch row {
            case 0: return "1"
            case 1: return "2"
            case 2: return "3"
            case 3: return "0"
            default: return "0"
            }
            
        } else {
           return colorArray[row]
        }
    }
}









//        labelMain.frame = CGRect(x: 0, y: 0, width: 120, height: 150)
//
//        labelMain.text = "Hello world& Im Andrew"
//        labelMain.font = UIFont.boldSystemFont(ofSize: 16)
//        labelMain.adjustsFontSizeToFitWidth = true
//        labelMain.textColor = UIColor.white
//
//        labelMain.numberOfLines = 3
//        labelMain.sizeToFit()
//        labelMain.center = self.view.center
//        view.addSubview(labelMain)
