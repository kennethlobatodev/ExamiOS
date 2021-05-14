//
//  GraphViewController.swift
//  ExameniOS
//
//  Created by Kenneth on 14/05/21.
//

import UIKit

class GraphViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var setColors: [String] = Array()
    var setQuestions: [Questions] = Array()

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewXIB()
        setDelegate()
        print("setColors \(self.setColors)")
        print("setQuestions \(self.setQuestions)")
    }
    
    func setDelegate(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func setViewXIB() {
        let nibGraphTableViewCell = UINib(nibName: "GraphTableViewCell", bundle: nil)
        tableView.register(nibGraphTableViewCell, forCellReuseIdentifier: "GraphTableViewCell")
    }

}

extension GraphViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        setColors.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GraphTableViewCell", for: indexPath) as? GraphTableViewCell
        
        cell!.uiLabelColor.text = setColors[indexPath.row]
    
        return cell!
    }
    
    
}
