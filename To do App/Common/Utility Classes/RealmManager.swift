//
//  RealmManager.swift
//  To do App
//
//  Created by Praphin SP on 15/01/22.
//

import Foundation
import RealmSwift

class RealmManager: NSObject {
    
    var realm: Realm? {
        let realm = try? Realm()
        return realm
    }

    func save(object: Object) {
        if let r = self.realm {
            try? r.write {
                r.add(object, update: .modified)
            }
        }
    }
    
    func save(objects: [Object]) {
        if let r = self.realm {
            try? r.write {
                r.add(objects, update: .modified)
            }
        }
    }

    func update(updateBlock: (()->Void)) {
        if let r = self.realm {
            try? r.write {
                updateBlock()
            }
        }
    }
    
    func write(updateBlock: ((_ realm: Realm)->Void)) {
        if let r = self.realm {
            try? r.write {
                updateBlock(r)
            }
        }
    }
    
    func object<T>(type: T.Type, predicate : NSPredicate) -> T? {
        if let r = self.realm, let c = type as? Object.Type {
            let arr = r.objects(c).filter(predicate)
            return arr.first as? T
        }
        else {
            return nil
        }
    }
    
    func objects<T>(type: T.Type, predicate : NSPredicate? = nil) -> [T] {
        if let r = self.realm, let c = type as? Object.Type {
            if let predicate = predicate {
                let arr = r.objects(c).filter(predicate)
                return Array(arr) as? [T] ?? []
            }
            else {
                let arr = r.objects(c)
                return Array(arr) as? [T] ?? []
            }
        }
        else {
            return []
        }
    }
    
    func clearDB() {
        if let r = self.realm{
            try! r.write {
                r.deleteAll()
            }
        }
    }
    
    func updateRealmVersionIfRequired() {
        
//        if let appVersion = AppVariable.shared.appVersion, let buildNo = AppVariable.shared.buildNumber {
//
//            var appVersionStr = appVersion.replacingOccurrences(of: ".", with: "")
//            appVersionStr.append(buildNo)
//
//            if appVersionStr.count < 5 {
//                for _ in appVersionStr.count ..< 5 {
//                    appVersionStr.append("0")
//                }
//            }
//
//            let configuration = Realm.Configuration.defaultConfiguration
//            let schemaVersionInt = configuration.schemaVersion
//            let schemaVersionStr = "\(schemaVersionInt)"
//            var clearDB = false
//
//            if appVersionStr.count < schemaVersionStr.count
//            {
//                let diff = schemaVersionStr.count - appVersionStr.count
//                for _ in 0 ..< diff
//                {
//                    appVersionStr = appVersionStr + "0"
//                }
//            }
//            if let appVersionInt = UInt64(appVersionStr)
//            {
//                if appVersionInt > schemaVersionInt {
//                    let config = Realm.Configuration(
//                        schemaVersion: appVersionInt,
//                        migrationBlock: { migration, oldSchemaVersion in
//                            if oldSchemaVersion <= 29991 {
//                                clearDB = true
//                            }
//                            if oldSchemaVersion <= 31000 {
//                                WTTSettingsUtility.sharedInstance.updateSettingAPI = true
//                                WTTSettingsUtility.sharedInstance.resetSettingUpdatedAt()
//                                WTTUserSettingsResource().getUserSettingsData { (s, newData) in }
//                            }
//
//                            if oldSchemaVersion <= 31100 {
//                                AppVariable.shared.deleteValueFromUserDefault(key: DataKey.diaryUpdateAt)
//                            }
//
//                            if oldSchemaVersion <= realmOldSchemes.diaryMigrationScheme {
//                                migration.enumerateObjects(ofType: "LoggedParrentRealmModel") { oldLog, newLog in
//                                    newLog?["track_id"] =  "\(oldLog?["id"] ?? "")"
//                                }
//                            }
//
//                    })
//                    Realm.Configuration.defaultConfiguration = config
//                    do{
//                        let realm = try Realm()
//                        if clearDB {
//                            try! realm.write {
//                                realm.deleteAll()
//                            }
//                            UserDefaults.resetStandardUserDefaults()
//                        }
//                        print("Database Path : \(config.fileURL!)")
//
//                    }catch{
//                        print("Realm error : \(error.localizedDescription)")
//                    }
//                }
//            }
//        }
    }
    
    func deleteObject(deleteBlock: ((_ realm: Realm)->Void)) {
        if let r = self.realm {
            try? r.write {
                deleteBlock(r)
            }
        }
    }


}
