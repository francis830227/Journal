//
//  SaveData.swift
//  Journal
//
//  Created by Francis Tseng on 2017/8/4.
//  Copyright © 2017年 Francis Tseng. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class SaveManager {

    var event: EventMO!

    var events = [EventMO]()

    //swiftlint:disable force_cast
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //swiftlint:enable force_cast

    func saveToCoreData(_ title: String, _ context: String, _ image: UIImage) {
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            
            event = EventMO(context: appDelegate.persistentContainer.viewContext)
            
            event.title = title
            
            event.context = context
            
            let eventImage = UIImageJPEGRepresentation(image, 1)
            self.event.image = eventImage! as NSData
            
            appDelegate.saveContext()

            do {
                let tasks = try self.context.fetch(EventMO.fetchRequest())
                
                events = (tasks as? [EventMO])!
                
                print("-------現在總共有---------")
                for event in events {
                    print("\(event.title ?? "no name")")
                    
                }
            } catch {}
            
    }
    
}

}
