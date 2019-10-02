//
//  ViewController.swift
//  dek_d_internship
//
//  Created by Sai-Mork on 2/10/19.
//  Copyright © 2019 Kasidid Wachirachai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var content = [Content]()
    
    @IBOutlet weak var contentTableView: UITableView!
    
    override func viewDidLoad() {
        content.append(Content(name: "เฟรชชี่ปี1", desc: "เปิดวาร์ปเฟรชชี่ปี1"))
        content.append(Content(name: "โพยเตรียมสอบ", desc: #"อวดโพยเชิญทู้นี้! ส่อง"โพยเตรียมสอบ" ในวิถีเซียน ละเอียดชนิดหมูบดยังต้องยอมแพ้"#))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contentCell = tableView.dequeueReusableCell(withIdentifier: "content_cell")!
        contentCell.textLabel?.text = content[indexPath.row].name
        contentCell.detailTextLabel?.text = content[indexPath.row].desc
        return contentCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showcontent", sender: self)
        print("tapped")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "คำเตือน", message: "หากคุณลบแล้วข้อมูลนี้จะหายไป", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ยืนยัน", style: .destructive, handler: { action in
                self.content.remove(at: indexPath.row)
                self.contentTableView.reloadData()
            }))
            alert.addAction(UIAlertAction(title: "ยกเลิก", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func addButton(_ sender: Any) {
        let alert = UIAlertController(title: "เพิ่มเนื้อหา", message: "กรุณากรอกเนื้อหาที่ต้องการเพิ่ม", preferredStyle: .alert)
        alert.addTextField(configurationHandler: {(textField) -> Void in
            textField.placeholder = "หัวข้อ"
        })
        alert.addTextField(configurationHandler: {(textField) -> Void in
            textField.placeholder = "รายละเอียด"
        })
        alert.addAction(UIAlertAction(title: "เพิ่ม", style: .cancel, handler: { action in
            let newContent = Content(name: alert.textFields![0].text!, desc: alert.textFields![1].text!)
            self.content.append(newContent)
            print(self.content)
            self.contentTableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "ยกเลิก", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ContentViewController {
            destination.content = content[(contentTableView.indexPathForSelectedRow!.row)]
        }
    }

}

struct Content {
    var name: String = ""
    var desc: String = ""
}

