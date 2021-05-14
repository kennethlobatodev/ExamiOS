//
//  GraphTableViewCell.swift
//  ExameniOS
//
//  Created by Kenneth on 14/05/21.
//

import UIKit

class GraphTableViewCell: UITableViewCell {
    
    @IBOutlet weak var uiLabelColor: UILabel!
    
    @IBOutlet weak var uiLabelQuestions: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
