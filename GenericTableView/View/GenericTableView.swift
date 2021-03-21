//
//  GenericTableView.swift
//  GenericTableView
//
//  Created by macbook05 on 12/03/21.
//  Copyright © 2021 macbook05. All rights reserved.
//

import UIKit

class GenericTableView<Item, Cell: UITableViewCell>: UITableView, UITableViewDelegate, UITableViewDataSource {

    var items: [Item]!
    var configureCell: (Item, Cell) -> ()
    var selectCell:(Item) -> ()
    var cellHeight: CGFloat?
    var isFromNib: Bool?

    init(frame: CGRect, items: [Item], cellHeight: CGFloat, isFromNib: Bool, configureCell: @escaping (Item, Cell) -> (), selectCell: @escaping (Item) -> ()) {
        self.items = items
        self.cellHeight = cellHeight
        self.configureCell = configureCell
        self.selectCell = selectCell
        self.isFromNib = isFromNib
        super.init(frame: frame, style: .plain)

        self.delegate = self
        self.dataSource = self

        if isFromNib {
            self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellReuseIdentifier: String(describing: Cell.self))
        } else {
            self.register(Cell.self, forCellReuseIdentifier: String(describing: Cell.self))
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.rowHeight = cellHeight
        self.estimatedRowHeight = UITableView.automaticDimension
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    //MARK:- UITableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: Cell.self), for: indexPath) as? Cell else { return UITableViewCell() }

        if let items = items {
            configureCell(items[indexPath.row], cell)
        }

        return cell
    }

    //MARK:- UITableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let items = items {
            selectCell(items[indexPath.row])
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight ?? 0
    }

}


extension GenericTableView {
    //MARK:- Reload TableView
    func reloadTableView(data items: [Item]) {
        self.items = items
        self.reloadData()
    }

    //MARK:- Set Seprator Style
    func setSepratorStyle(style: UITableViewCell.SeparatorStyle) {
        self.separatorStyle = style
    }
}

