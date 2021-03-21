//
//  SecondViewController.swift
//  GenericTableView
//
//  Created by macbook05 on 21/03/21.
//  Copyright © 2021 macbook05. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    private var items = [String]()
    private var tableView: GenericTableView<String, UITableViewCell>?


    override func viewDidLoad() {
        super.viewDidLoad()

        items = Array(repeating: "items", count: 50)
        setupTableView()
    }

    private func setupTableView() {
        tableView = GenericTableView(frame: view.frame, items: items, cellHeight: 44, isFromNib: false, configureCell: {[weak self] (item, cell) in
            guard let _ = self else { return }
            cell.textLabel?.text = item
        }, selectCell: { (_) in

        })

        view.addSubview(tableView ?? UITableView())
        tableView?.setSepratorStyle(style: .none)

    }
}
