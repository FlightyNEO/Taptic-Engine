//
//  ViewController.swift
//  FedBack (Vibro)
//
//  Created by Arkadiy Grigoryanc on 27.02.17.
//  Copyright © 2017 Arkadiy Grigoryanc. All rights reserved.
//


// More info https://developer.apple.com/reference/uikit/uifeedbackgenerator


import UIKit

class ViewController: UITableViewController {
    
    fileprivate var names: [[String]]!
    fileprivate var keys: [(title: String, overview: String)]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        keys = [(title: "Impact", overview: "Use impact feedback generators to indicate that an impact has occurred. For example, you might trigger impact feedback when a user interface object collides with something or snaps into place."),
                (title: "Notification", overview: "Use notification feedback generators to indicate successes, failures, and warnings."),
                (title: "Selection", overview: "Use selection feedback generators to indicate a change in selection.")]
        
        names = [["Heavy", "Medium", "Light"],
                 ["Error", "Success", "Warning"],
                 ["Selection"]]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private methods
    
    fileprivate func vibrateWithImpactFeedbackGenerator(style: UIImpactFeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
        
    }
    
    fileprivate func vibrateWithNotificationFeedbackGenerator(type: UINotificationFeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    fileprivate func vibrateWithSelectionFeedbackGenerator() {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }
    
    // MARK: - Table view methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = names[indexPath.section][indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section].title
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return keys[section].overview
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0: vibrateWithImpactFeedbackGenerator(style: .heavy)
            case 1: vibrateWithImpactFeedbackGenerator(style: .medium)
            case 2: vibrateWithImpactFeedbackGenerator(style: .light)
            default: break
            }
        case 1:
            switch indexPath.row {
            case 0: vibrateWithNotificationFeedbackGenerator(type: .error)
            case 1: vibrateWithNotificationFeedbackGenerator(type: .success)
            case 2: vibrateWithNotificationFeedbackGenerator(type: .warning)
            default: break
                }
        case 2:
            vibrateWithSelectionFeedbackGenerator()
        default: break
        }
        
    }
    
    // MARK: - Actions
    
    @IBAction func actionMore(_ sender: Any) {
        let url = URL(string: "https://developer.apple.com/reference/uikit/uifeedbackgenerator")
        UIApplication.shared.open(url!, options: [ : ], completionHandler: nil)
    }
    


}

