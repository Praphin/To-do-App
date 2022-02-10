//
//  TDListVC.swift
//  To do App
//
//  Created by Praphin SP on 15/01/22.
//

import UIKit

class TDListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var vm: TDListVM = TDListVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

extension TDListVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.totalTasks()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TDListCell.className, for: indexPath) as! TDListCell
        cell.configure(task: self.vm.getTask(index: indexPath))
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
