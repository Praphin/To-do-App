//
//  Task.swift
//  To do App
//
//  Created by Praphin SP on 15/01/22.
//

import Foundation

class Task {
    
    var name: String = ""
    var createdAt: Double = 0.0
    var lastUpdatedAt: Double = 0.0
    var completedAt: Double = 0.0
    var deletedAt: Double = 0.0
    
    func createTask(name: String) -> Task {
        let task: Task = Task()
        task.name = name
        return task
    }
}
