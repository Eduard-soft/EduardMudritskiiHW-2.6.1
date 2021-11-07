//
//  EnterViewController.swift
//  EduardMudritskiiHW 2.6
//
//  Created by Эдуард on 05.11.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewValue(_ viewColor: UIColor)
}

class EnterViewController: UIViewController {
    
    @IBOutlet weak var viewEnterViewController: UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        viewEnterViewController.backgroundColor = UIColor.lightGray
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let goToSettingsViewController = segue.destination as? SettingsViewController else { return }
        goToSettingsViewController.delegate = self
    }
}

// MARK: - SettingsViewControllerDelegate
extension EnterViewController: SettingsViewControllerDelegate {
    func setNewValue(_ viewColor: UIColor) {
        viewEnterViewController.backgroundColor = viewColor
    }
}

