//
//  SelectTermViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/09/06.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class SelectTermViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var selectTermDelegate: SelectTermDelegate?
    
    let viewModel = SelectTermViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .singleLine
        viewModel.readAllBudget{
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedBG(_ sender: Any){
        self.dismiss(animated: false, completion: nil)
    }

}

extension SelectTermViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.budget.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectTermCell") as? SelectTermCell else{
            return UITableViewCell()
        }
        let date = "\(Converter.shared.convertDate( viewModel.budget[indexPath.row].startDate)) ~ \(Converter.shared.convertDate(viewModel.budget[indexPath.row].endDate))"
        let flag = viewModel.nowBudget == viewModel.budget[indexPath.row] ? true : false
        cell.updateUI(date: date, onOff: flag)
        
        return cell
    }
}

extension SelectTermViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectBudget = viewModel.budget[indexPath.row]
        selectTermDelegate?.selectBudget(budget: selectBudget)
        self.dismiss(animated: true)
    }
}


class SelectTermCell: UITableViewCell{
    
    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var onOffButton: UIButton!
    
    func updateUI(date: String, onOff: Bool){
        termLabel.text = date
        onOffButton.isSelected = onOff
    }

}



