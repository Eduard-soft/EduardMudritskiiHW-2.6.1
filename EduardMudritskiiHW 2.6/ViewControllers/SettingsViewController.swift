//
//  SettingsViewController.swift
//  EduardMudritskiiHW 2.6
//
//  Created by Эдуард on 05.11.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider! {
        didSet{
            redSlider.tintColor = UIColor.red
        }
    }
   
    @IBOutlet weak var greenSlider: UISlider! {
        didSet{
            greenSlider.tintColor = UIColor.green
        }
    }
    
    @IBOutlet weak var blueSlider: UISlider! {
        didSet{
            blueSlider.tintColor = UIColor.blue
        }
    }
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToViewController() {
    delegate.setNewValue(colorView.backgroundColor ?? UIColor.red)
        dismiss(animated: false) {
        }
        
    }
    private func changeTextField() {
    redTextField.text = String(format: "%.2f", redSlider.value)
    greenTextField.text = String(format: "%.2f", greenSlider.value)
    blueTextField.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func changeTextLabel() {
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func changeColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }

    @IBAction func rgbSliderChanged(_ sender: Any) {
        changeTextField()
        changeTextLabel()
        changeColor()
    }
}

extension SettingsViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        }
        alert.addAction(okAction)
        present(alert, animated: true)
        
    }
}

extension SettingsViewController: UITextFieldDelegate {
    private func textFieldShouldReturn(_ textField: UITextField) {
        guard let textField = textField.text else { return }
        if let currentValue = Float(textField) {
            if currentValue >= 0.00 && currentValue <= 1.00 {
                redSlider.value = Float(textField) ?? 1.00
                greenSlider.value = Float(textField) ?? 1.00
                blueSlider.value = Float(textField) ?? 1.00
            } else {
            showAlert(title: "Oops!", message: "Enter data")
            }
        }
    }
}
