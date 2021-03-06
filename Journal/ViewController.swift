//
//  ViewController.swift
//  Journal
//
//  Created by Francis Tseng on 2017/8/4.
//  Copyright © 2017年 Francis Tseng. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var eventTableView: UITableView!

    var eachEventTitle = ""
    var eachEventImage: UIImage!
    var eachEventContext = ""

    var events = [EventMO]()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let request: NSFetchRequest<EventMO> = EventMO.fetchRequest()
            let context = appDelegate.persistentContainer.viewContext
            do {
                events = try context.fetch(request)
            } catch {
                print(error)
            }

            eventTableView.reloadData()

        }

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "toedit" {

            let cell = sender as? CreatingTableViewCell

            let destinationVC = segue.destination as? EditingViewController

            for item in events where cell?.eventTitle.text == item.title {

                eachEventTitle = item.title!

                if let image = UIImage(data: item.image! as Data) {

                    eachEventImage = image

                }

                eachEventContext = item.context!

            }
            destinationVC?.titleForSegue = eachEventTitle
            destinationVC?.imageForSegue = eachEventImage
            destinationVC?.contextForSegue = eachEventContext
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return events.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "creatingCell", for: indexPath) as? CreatingTableViewCell

        let image = UIImage(data: events[indexPath.row].image! as Data)

        cell?.eventImageView.contentMode = .scaleAspectFill
        cell?.eventImageView.image = image

        cell?.eventTitle.text = events[indexPath.row].title

        return cell!

    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            events.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)

//            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
//                
//                //swiftlint:disable force_cast
//                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//                //swiftlint:enable force_cast
//                
//                for item in events where item.title == events[indexPath.row].title {
//                
//                context.delete(item)
//                
//                appDelegate.saveContext()
//                let request: NSFetchRequest<EventMO> = EventMO.fetchRequest()
//                do {
//                    events = try context.fetch(request)
//                } catch {
//                    print(error)
//                }
//                }

                tableView.reloadData()
            }

            }

        }
