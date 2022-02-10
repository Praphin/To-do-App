//
//  TDListVM.swift
//  To do App
//
//  Created by Praphin SP on 15/01/22.
//

import Foundation

class TDListVM {
    
    var tasks: [Task] = []
    
    init() {
        preloadData()
    }
    
    func preloadData() {
        tasks.removeAll()
        
        tasks.append(Task().createTask(name: String(Date().timeIntervalSince1970)))
        tasks.append(Task().createTask(name: String(Date().timeIntervalSince1970)))
        tasks.append(Task().createTask(name: String(Date().timeIntervalSince1970)))
        tasks.append(Task().createTask(name: String(Date().timeIntervalSince1970)))
        tasks.append(Task().createTask(name: String(Date().timeIntervalSince1970)))
        tasks.append(Task().createTask(name: String(Date().timeIntervalSince1970)))
        tasks.append(Task().createTask(name: String(Date().timeIntervalSince1970)))
    }
    
    func totalTasks() -> Int {
        return tasks.count
    }
    
    func getTask(index: IndexPath) -> Task {
        return self.tasks[index.row]
    }
}
