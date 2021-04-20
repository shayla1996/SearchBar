//
//  ViewController.swift
//  CreateSearchBar
//
//  Created by Shaikat on 20/4/21.
//  Copyright © 2021 Shayla.18. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    var fruitsName = ["Apple", "Apricots", "Avocados",
                      "Bananas", "Boysenberries", "Blueberries",
                      "Bing Cherry", "Cherries", "Cantaloupe",
                      "Crab apples", "Clementine", "Cucumbers",
                      "Dates", "Dewberries", "Dragon Fruit",
                      "Elderberry", "Eggfruit", "Finger lime",
                      "Fig", "Grapefruit", "Guava", "Grapes",
                      "Honeydew melon", "Indian Prune", "Indonesian Lime",
                      "Indian Fig", "Jackfruit", "Java Apple",
                      "Kiwi", "Kaffir Lime", "Lime", "Lychee",
                      "Mango", "Mulberry", "Melon", "Nashi Pear",
                      "Nectarine", "Olive", "Orange", "Papaya",
                      "Persimmon", "Pineapple", "Rambutan",
                      "Raspberries", "Star Fruit", "Strawberries",
                      "Sugar Baby Watermelon", "Tomato", "Tart Cherries",
                      "Ugil Fruit", "Ugni", "Vanilla Bean",
                      "Velvet Pink Banana", "Watermelon", "White Mulberry",
                      "Ximenia caffra fruit", "Xigua", "Yellow Passion Fruit",
                      "Yangmei", "Zig Zag Vine Fruit", "zucchini"]
    
    var filterData : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        filterData = fruitsName
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                 for: indexPath)
            cell.textLabel?.text = filterData[indexPath.row]
        return cell
    }
}

extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterData = []
        if searchText == "" {
            filterData = fruitsName
        }
        
        for word in fruitsName{
            if word.uppercased().contains(searchText.uppercased()){
                filterData.append(word)
            }
        }
        self.tableview.reloadData()
    }
}

