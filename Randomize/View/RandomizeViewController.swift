//
//  RandomizeViewController.swift
//  Randomize
//
//  Created by Rodrigo Sagebin on 3/2/18.
//  Copyright © 2018 Rodrigo Sagebin. All rights reserved.
//

import UIKit

class RandomizeViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func shuffleButtonTapped(_ sender: Any) {
        let GroupCell = TitleTextField.text
             else { return }
        
        if let entry = self.entry {
            RandomizeController.shared.update(entry: entry, with: <#String#>)
        } else {
            RandomizeController.shared.addEntryWith(name: name, with: String)
        }
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func newEntry(_ sender: Any) {
    }
    
    private func updateViews() {
        
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
    
    var entry: Entry? {
        didSet {
            if isViewLoaded { updateViews() }
        }
    }
}
