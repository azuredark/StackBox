//
//  TableViewController.swift
//  PopStackView
//
//  Created by Hugues Blocher on 31/05/2017.
//  Copyright © 2017 Hugues Blocher. All rights reserved.
//

import UIKit

extension Array {
    @discardableResult mutating func shuffle() -> Array {
        for _ in 0..<((count>0) ? (count-1) : 0) {
            sort { (_,_) in arc4random() < arc4random() }
        }
        return self
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: CGFloat(arc4random()) / CGFloat(UInt32.max),
                       green: CGFloat(arc4random()) / CGFloat(UInt32.max),
                       blue: CGFloat(arc4random()) / CGFloat(UInt32.max),
                       alpha: 1.0)
    }
}

class TableViewController: UITableViewController {
    
    var options = ["Vertical Classic", "Vertical Random", "Vertical SnapKit",
                   "Horizontal Classic", "Horizontal Random", "Horizontal SnapKit",
                   "Horizontal Paginated Classic", "Horizontal Paginated Random", "Horizontal Paginated SnapKit",
                   "Profile Screen", "Specific Index"]

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "UITableViewCell")
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(VerticalClassicController(), animated: true)
        case 1:
            self.navigationController?.pushViewController(VerticalRandomController(), animated: true)
        case 2:
            self.navigationController?.pushViewController(VerticalSnapController(), animated: true)
        case 3:
            self.navigationController?.pushViewController(HorizontalClassicController(), animated: true)
        case 4:
            self.navigationController?.pushViewController(HorizontalRandomController(), animated: true)
        case 5:
            self.navigationController?.pushViewController(HorizontalSnapController(), animated: true)
        case 6:
            let vc = HorizontalClassicController()
            vc.stack.isPagingEnabled = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 7:
            let vc = HorizontalRandomController()
            vc.stack.isPagingEnabled = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 8:
            let vc = HorizontalSnapController()
            vc.stack.isPagingEnabled = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 9:
            self.navigationController?.pushViewController(ProfileController(), animated: true)
        case 10:
            self.navigationController?.pushViewController(VerticalSpecificIndexController(), animated: true)
        default:
            break
        }
    }
}
