//
//  ViewController.swift
//  Lesson 2.4 AD
//
//  Created by Andrei Deshin on 16.01.25.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    
    // MARK: - View Lify Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        setupSlider()
        setupMainLabel()
    }
    
    // MARK: - IB Actions
    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .yellow
        default:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .green
        }
        
    }
    
    @IBAction func sliderAction() {
        mainLabel.text = slider.value.formatted()
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(slider.value))
        //view.alpha = CGFloat(slider.value)
    }
    
    @IBAction func doneButtonAction() {
        guard let inputText = textField.text, !inputText.isEmpty else {
            showAlert(withTitle: "Text field is empty", andMessage: "please enter your name")
            return
        }
        
        //        if let _ = Double(inputText) {
        //            showAlert(withTitle: "Wrong format", andMessage: "enter your name please")
        //            return
        //        }
        
        let usernamePattern = "^[a-zA-Z ]{3,20}$"
        let isUsernameValid = NSPredicate(format: "SELF MATCHES %@", usernamePattern)
            .evaluate(with: inputText)
        
        if !isUsernameValid {
            showAlert(withTitle: "Wrong format", andMessage: "Please enter your name")
            return
        }
        
        mainLabel.text = inputText
        textField.text = ""
    }
    
    // MARK: - Private Methods
    private func showAlert(withTitle: String, andMessage message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}
// MARK: - Setup UI
extension ViewController {
    private func setupMainLabel() {
        //mainLabel.text = "Main Label"
        mainLabel.text = slider.value.formatted()
        mainLabel.font = UIFont.systemFont(ofSize: 35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
    }
    
    private func setupSlider() {
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.maximumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .green
    }
    
}

