//
//  DBHelper.swift
//  Commad
//
//  Created by 정명곤 on 2023/02/17.
//

import Foundation
import SQLite3

class DBHelper {
    
    static let shared = DBHelper()
    
    var db: OpaquePointer?
    
    let databaseName = "Commad.sqlite"
    
    init() {
        self.db = createDB()
    }
    
    deinit {
        sqlite3_close(db)
    }
    
    private func onSQLErrorPrintMessage(_ db: OpaquePointer?) {
        let errorMessage = String(cString: sqlite3_errmsg(db))
        
        print("Error preparing update:\(errorMessage)")
        
        return
    }
    
    private func createDB() -> OpaquePointer? {
        
        var db: OpaquePointer? = nil
        
        do {
//            let dbPath: String = try FileManager.default.url(
//                for: .documentDirectory,
//                in: .userDomainMask,
//                appropriateFor: nil,
//                create: false).appendingPathComponent(databaseName).path
            let dbPath: String = "/Users/mangon/Documents/db.sqlite"
            
            if sqlite3_open(dbPath, &db) == SQLITE_OK {
                print("Successfully created \(dbPath)")
                
                return db
            }
        } catch {
            print("Error while creating Database\(error.localizedDescription)")
        }
        
        return nil
    }
    
    func createUserTalble() {
        
        let query = """
                    CREATE TABLE IF NOT EXISTS "User" (
                    "id"    INTEGER NOT NULL UNIQUE,
                    "userName"    TEXT NOT NULL,
                    "userBirthday"    TEXT NOT NULL,
                    "userPhoneNum"    TEXT NOT NULL,
                    PRIMARY KEY("id" AUTOINCREMENT)
                    );
                    """
        
        var statement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Creating table has been successfully done")
            } else {
                let errorMessage = String(cString: sqlite3_errmsg(db))
                
                print("\nsqlite3_step failure while creating table: \(errorMessage)")
            }
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(self.db))
            
            print("\nsqlite3_prepare failure while creating table: \(errorMessage)")
        }
    }
    
    func insertData(name: String, birthDay: String, phoneNumber: String) {
        
        let query = """
                    INSERT INTO USER(id, userName, userBirthday, userPhoneNum) VALUES (?, ?, ?, ?);
                    
                    """
        var statement: OpaquePointer? = nil
        
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) != SQLITE_OK {
            let errMsg = String(cString: sqlite3_errmsg(db))
            return
        }
        
        if sqlite3_bind_text(statement, 2, name, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("err")
            return
        }
        if sqlite3_bind_text(statement, 3, birthDay, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("err")
            return
        }
        if sqlite3_bind_text(statement, 4, phoneNumber, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("err")
            return
        }
        
        if sqlite3_step(statement) == SQLITE_DONE {
            print("sqlite insertion success")
        } else {
            print("sqlite step failure")
        }
    }
    
    func readData() -> [User] {
        let query: String = "SELECT * FROM USER;"
        var statement: OpaquePointer? = nil
        var result: [User] = []
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(db)!)
            
            print("error while prepare:\(errorMessage)")
            
            return result
        }
        
        while sqlite3_step(statement) == SQLITE_ROW {
            
            let id = sqlite3_column_int(statement, 0)
            
            let name = String(cString: sqlite3_column_text(statement, 1))
            
            let birthDay = String(cString: sqlite3_column_text(statement, 2))
            
            let phoneNumber = String(cString: sqlite3_column_text(statement, 3))
            
            result.append(User(id: Int(id), userName: String(name), userBirthDay: String(birthDay), userPhoneNumber: String(phoneNumber)))
            
        }
        
        sqlite3_finalize(statement)
        
        return result
    }
}

