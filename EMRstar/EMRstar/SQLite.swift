//
//  SQLite.swift
//  EMRstar
//
//  Created by Carson Keller on 11/16/19.
//  Copyright © 2019 Carson Keller. All rights reserved.
//


import UIKit
import SQLite3

class ViewController: UIViewController {
    
    var db: OpaquePointer?
    
    @IBOutlet weak var Name: UITextField!
    
    //@IBAction func Name(_ sender: UITextField) {
    //}
    
    @IBOutlet weak var ID: UITextField!
    
    //@IBAction func ID(_ sender: UITextField) {
    //}
    
    @IBOutlet weak var Birthday: UITextField!
    
    //@IBAction func Birthday(_ sender: UITextField) {
    //}
    
    @IBOutlet weak var BirthMonth: UITextField!
    
    //@IBAction func BirthMonth(_ sender: UITextField) {
    //}
    
    @IBOutlet weak var BirthYear: UITextField!
    
    //@IBAction func BirthYear(_ sender: UITextField) {
    //}
    
    @IBOutlet weak var Weight: UITextField!
    
    //@IBAction func Weight(_ sender: UITextField) {
    //}
    
    @IBOutlet weak var Height: UITextField!
    
    //@IBAction func Height(_ sender: UITextField) {
    //}
    
    @IBOutlet weak var Gender: UITextField!
    
    //@IBAction func Gender(_ sender: UITextField) {
    //}
    
    @IBOutlet weak var Status: UITextField!
    
    //@IBAction func Status(_ sender: UITextField) {
    //}
    
    @IBOutlet weak var Comment: UITextField!
    
    //@IBAction func Comment(_ sender: UITextField) {
    //}
    
    @IBOutlet weak var Treatment: UITextField!
    
    //@IBAction func Treatment(_ sender: UITextField) {
    //}
    
    @IBOutlet weak var Medicine: UITextField!
    
    //@IBAction func Medicine(_ sender: UITextField) {
    //}
    
    @IBAction func SAVE(_ sender: Any) {
        
        let name = Name.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let id = ID.text?.trimmingCharacters(in: .whitespacesAndNewlines)

        let birthDay = Birthday.text?.trimmingCharacters(in: .whitespacesAndNewlines)

        let birthMonth = BirthMonth.text?.trimmingCharacters(in: .whitespacesAndNewlines)

        let birthYear = BirthYear.text?.trimmingCharacters(in: .whitespacesAndNewlines)

        let weight = Weight.text?.trimmingCharacters(in: .whitespacesAndNewlines)

        let height = Height.text?.trimmingCharacters(in: .whitespacesAndNewlines)

        let gender = Gender.text?.trimmingCharacters(in: .whitespacesAndNewlines)

        let status = Status.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let comment = Comment.text?.trimmingCharacters(in: .whitespacesAndNewlines)

        let treatment = Treatment.text?.trimmingCharacters(in: .whitespacesAndNewlines)

        let medicine = Medicine.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
//        if (name?.isEmpty) {
//            return;
//        }
//
//        if (id?.isEmpty) {
//            return;
//        }
//
//        if (birthDay?.isEmpty) {
//            return;
//        }
//
//        if (birthMonth?.isEmpty) {
//            return;
//        }
//
//        if (birthYear?.isEmpty) {
//            return;
//        }
//
//        if (weight?.isEmpty) {
//            return;
//        }
//
//        if (height?.isEmpty) {
//            return;
//        }
//
//        if (gender?.isEmpty) {
//            return;
//        }
//
//        if (status?.isEmpty) {
//            return;
//        }
//
//        if (comment?.isEmpty) {
//            return;
//        }
//
//        if (treatment?.isEmpty) {
//            return;
//        }
//
//        if (medicine?.isEmpty) {
//            return;
//        }
        
        var stmt : OpaquePointer?
        
        let insertQuery = "INSERT INTO Patients (name, id, birthDay, birthMonth, birthYear, weight, height, gender, status, comment, treatment, medicine) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
        
        if sqlite3_prepare(db, insertQuery, -1, &stmt, nil) != SQLITE_OK {
            print("Error Binding Entry")
        }
        
        if sqlite3_bind_text(stmt, 1, name, -1, nil) != SQLITE_OK {
            print("Error Binding Entry")
        }
        
        if sqlite3_bind_int(stmt, 2, (id! as NSString).intValue) != SQLITE_OK {
            print("Error Binding Entry")
        }

        if sqlite3_bind_int(stmt, 3, (birthDay! as NSString).intValue) != SQLITE_OK {
            print("Error Binding Entry")
        }

        if sqlite3_bind_int(stmt, 4, (birthMonth! as NSString).intValue) != SQLITE_OK {
            print("Error Binding Entry")
        }

        if sqlite3_bind_int(stmt, 5, (birthYear! as NSString).intValue) != SQLITE_OK {
            print("Error Binding Entry")
        }

        if sqlite3_bind_int(stmt, 6, (weight! as NSString).intValue) != SQLITE_OK {
            print("Error Binding Entry")
        }

        if sqlite3_bind_int(stmt, 7, (height! as NSString).intValue) != SQLITE_OK {
            print("Error Binding Entry")
        }

        if sqlite3_bind_text(stmt, 8, gender, -1, nil) != SQLITE_OK {
            print("Error Binding Entry")
        }

        if sqlite3_bind_text(stmt, 9, status, -1, nil) != SQLITE_OK {
            print("Error Binding Entry")
        }

        if sqlite3_bind_text(stmt, 10, comment, -1, nil) != SQLITE_OK {
            print("Error Binding Entry")
        }

        if sqlite3_bind_text(stmt, 11, treatment, -1, nil) != SQLITE_OK {
            print("Error Binding Entry")
        }

        if sqlite3_bind_text(stmt, 12, medicine, -1, nil) != SQLITE_OK {
            print("Error Binding Entry")
        }

        if sqlite3_step(stmt) == SQLITE_DONE {
            print("Entry Saved")
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("PatientDatabase.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("Error Opening Database")
        }
        
        let createTableQuery = "CREATE TABLE IF NOT EXISTS Patients (name TEXT PRIMARY KEY AUTOINCREMENT, id INTEGER, birthDay INTEGER, birthMonth INTEGER, birthYear INTEGER, weight INTEGER, height INTEGER, gender TEXT, status TEXT, comment TEXT, treatment TEXT, medicine TEXT)"
        
        if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK {
            print("Error Creating Table")
        }
        
        
        
        
        
        
    }
}
