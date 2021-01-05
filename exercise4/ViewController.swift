//
//  ViewController.swift
//  exercise4
//
//  Created by Scores_Main_User on 1/4/21.
//

import UIKit

class ViewController: UIViewController
{
    
    
    var data   = [
        [Shape(name: "Triangle", numOfVertices: "3"),
         Shape(name: "Rectangle", numOfVertices: "4") , Shape(name: "Circle", numOfVertices: "0"), Shape(name: "Pentagon", numOfVertices: "5"), Shape(name: "Hexagon", numOfVertices: "6"),
         Shape(name: "Heptagon", numOfVertices: "7"),Shape(name: "Octagon", numOfVertices: "8") ],
        
        [Color(name: "Red", RGB: "255 0 0", Hex: "#FF0000")
         ,Color(name: "Green", RGB: "0 255 0", Hex: "#00FF00"),
         Color(name: "Blue", RGB: "0 0 255", Hex: "#0000FF"),
         Color(name: "Yellow", RGB: "255 255 0", Hex: "#FFFF00"),
         Color(name: "Magenta", RGB: "255 0 255", Hex: "#FF00FF"),
         Color(name: "Cyan", RGB: "255 0 255", Hex: "#FF00FF"),
         Color(name: "Orange", RGB: "255 128 0", Hex: "#FF8000"),
         Color(name: "Purple", RGB: "128 0 255", Hex: "#8000FF"),]
    ]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    
}

extension ViewController : UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("you tapped me \(indexPath)")
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        print(cell)
        let newCellData = data[indexPath.section][indexPath.row]
        self.data[indexPath.section].insert(newCellData, at: 0)
        tableView.insertRows(at:[IndexPath(row: 0, section: indexPath.section) ], with: .fade)
        
       
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return indexPath.section == 0 ? 150 : 250
        
    }
}

extension ViewController : UITableViewDataSource
{
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
//    {
//        let testAction = UIContextualAction(style: .destructive, title: "DELETE") { (_, _, completionHandler) in
//                print("test")
//                completionHandler(true)
//            }
//            return UISwipeActionsConfiguration(actions: [testAction])
//    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let deleteAction = UITableViewRowAction.init(style: .destructive, title: "Delete")
        { (action, indexPath) in
            self.data[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let label : UILabel = UILabel()
        label.text = section == 0 ? "Shapes" : "Colors"
        label.backgroundColor = UIColor.lightGray
        
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        data[section].count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        guard let identifier : String =  K.identifier[indexPath.section] else {
            return UITableViewCell()
        }
        let cellData : FullyNamed = (data[indexPath.section][indexPath.row] as! FullyNamed)
        if identifier == "layout1"
        {
            guard let shapeCell  = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? ShapesTableViewCell else {
                return UITableViewCell()
                
            }
            
            shapeCell.configure(with: (cellData as! Shape))
            return shapeCell
        }
        else
        {
            guard let colorCell  = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? ColorTableViewCellV2 else {
                return UITableViewCell()
                
            }
            
            colorCell.configure(with: (cellData as! Color))
            return colorCell
        }
        
    }
    
}
