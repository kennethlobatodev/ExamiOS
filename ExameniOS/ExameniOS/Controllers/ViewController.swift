//
//  ViewController.swift
//  ExameniOS
//
//  Created by Kenneth on 14/04/21.
//

import UIKit
import AVFoundation

class ViewController: BaseViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let imagePicker = UIImagePickerController()
    
    let arrayString = ["", "Camera", "Get Net Working"]
    
    var colors: [String] = Array()
    var questions: [Questions] = Array()

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setViewXIB()
        getData()
    }
    
    func setDelegate(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func getData() {
        NetWorkingProvider.shared.getColor { (data) in
            self.colors.append(contentsOf: data.colors)
            self.questions.append(contentsOf: data.questions)
        } failure: { (error) in
            print("error \(error)")
        }
    }
    
    func optionMenu() {
        
        let optionMenu =  UIAlertController(title: nil, message: NSLocalizedString("Tomar Foto", comment: ""), preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title: NSLocalizedString("Aceptar", comment: ""), style: .default, handler: { (alert: UIAlertAction!) -> Void in
            self.openCamera()
        })
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("Cancelar", comment: ""), style: .cancel)
        
        optionMenu.addAction(okAction)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func setViewXIB() {
        let nibFirstTableViewCell = UINib(nibName: "FirstTableViewCell", bundle: nil)
        tableView.register(nibFirstTableViewCell, forCellReuseIdentifier: "FirstTableViewCell")
        let nibSecondTableViewCell = UINib(nibName: "SecondTableViewCell", bundle: nil)
        tableView.register(nibSecondTableViewCell, forCellReuseIdentifier: "SecondTableViewCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GraphViewController" {
            let dataSender = segue.destination as! GraphViewController
            dataSender.setColors = colors
            dataSender.setQuestions = questions
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayString.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell", for: indexPath) as? FirstTableViewCell
            return cell!

        }else if indexPath.row > 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath) as? SecondTableViewCell
            cell?.uiLabel.text = arrayString[indexPath.row]
            return cell!
        }

        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            print("0")
            break;
        case 1:
            optionMenu()
            break;
        case 2:
            print("2")
            performSegue(withIdentifier: "GraphViewController", sender: nil)
            break;
        default:
            print("Error")
            break;
        }
        
    }
    
}
