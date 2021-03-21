//
//  ViewController.swift
//  GenericTableView
//
//  Created by macbook05 on 12/03/21.
//  Copyright © 2021 macbook05. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var items = [String]()
    var tableView: GenericTableView<String, CustomTableViewCell>?
    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { [weak self] (_) in
            guard let strongSelf = self else { return }
            strongSelf.items = Array(repeating: "items", count: 50)
            strongSelf.tableView?.reloadTableView(data: strongSelf.items)
        }
        setupTableView()
    }

    private func setupTableView() {
        tableView = GenericTableView(frame: view.frame, items: items, cellHeight: 44, isFromNib: true, configureCell: { [weak self] (item, cell) in
            guard let _ = self else { return }
            cell.label.text = item
            cell.img.image = cell.setImage()
        }, selectCell: { [weak self] (item) in
            guard let strongSelf = self else { return }
            print(item)
            strongSelf.showSecondVC()
        })

        view.addSubview(tableView ?? UITableView())

        tableView?.setSepratorStyle(style: .singleLine)
    }

    private func showSecondVC() {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }

}

