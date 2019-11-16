//
//  ViewController.swift
//  NewStuff
//
//  Created by Caleb Price on 11/16/19.
//  Copyright © 2019 Caleb Price. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
  
    
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var Image: UIImageView!
    
    @IBOutlet weak var Background: UIImageView!
    
    @IBAction func onGoButton(sender: AnyObject) {
        self.performSegue( withIdentifier: "BruceTheMoose", sender: sender)
     
        }
@IBAction func send(_ sender: AnyObject) {
    let name: String = textField.text!
    var dataFromFirst :Int? = Int(name)
    
    }
//    func Search(Any)
//
//
}


//class Search(){
//    var dictionary: [Int:[String:String]]
//
//    init(){
//
//    }
//}


func Driver(){
    let patient1 = Patient(name:"Adam Kitchen", id:00001, birthDay:28,birthMonth:08,birthYear:1996,weight:150,height:67,gender:"M", status:"Dying inside")
    print(patient1.getName())
    print(patient1.getId())
    print(patient1.getBirth())
    print(patient1.getGender())
    print(patient1.getStatus())
    print(patient1.getHeight())
    print(patient1.getWeight())
}

class Patient{
    private var name: String
    private var id: Int
    private var birthDay: Int
    private var birthMonth: Int
    private var birthYear: Int
    private var weight: Int
    private var height: Int
    private var gender: String
    private var status: String
    private var comment: [String]
    private var treatment: Treatment
    private var medicine: Medication
    
    
    init(name: String, id: Int, birthDay: Int, birthMonth: Int , birthYear: Int, weight: Int, height: Int, gender: String, status: String ){
        self.name = name
        self.id = id
        self.birthDay = birthDay
        self.birthMonth = birthMonth
        self.birthYear = birthYear
        self.weight = weight
        self.height = height
        self.gender = gender
        self.status = status
        self.comment = []
        self.treatment = Treatment()
        self.medicine = Medication()
    }
    
    func getName() -> String{
        return String(format: "Patient Name: %@", self.name)
    }
    
    func getId() -> String{
        return String(format: "Id Number: %d", self.id)
    }
    func getBirth() -> String{
        return String(format: "DOB: %d/%d/%d", self.birthMonth,self.birthDay,self.birthYear)
    }
    func getGender() -> String{
        return String(format: "Gender: %@", self.gender)
    }
    func getStatus() -> String{
        return String(format: "Status: %@", self.status)
    }
    func getWeight() -> String{
        return String(format: "Weight: %d lbs" , self.weight)
    }
    func getHeight() -> String{
        return String(format: "Height: %d in", self.height)
    }

    func changeStatus(status: String){
        self.status = status
    }
    
    func updateTreatment(addition: String){
        self.treatment.addtoList(addition: addition)
    }
    func displayTreatment(){
        for i in self.treatment.getTreatment(){
            print(i)
        }
    }
    
    func updateMedication(dosage: Int, medicine: String){
        self.medicine.changedosage(number: dosage)
        self.medicine.changeMedicineType(medicine: medicine)
    }
    
    func displayMedication(){
        for (i,j) in self.medicine.getMedicine(){
            print(String(format: "Medication: %d mg of %s", j, i))
        }
    }
    func displayComments(){
        for i in self.comment{
            print(i)
        }
    }
    func addComment(msg: String){
        self.comment.append(msg)
    }
}

class Picture{
    
}


class Treatment{
    var toDoList: [String]
    
    init() {
        self.toDoList = []
    }
    
    func addtoList(addition: String){
        self.toDoList.append(addition)
    }
    func getTreatment() -> [String]{
        return self.toDoList
    }
}

class Medication{
    private var dosage: Int
    private var medicineType: String
    private var moreMedicine: [String: Int]
    
    init(){
        self.dosage = 0
        self.medicineType = ""
        self.moreMedicine = [:]
    }
    
    func changedosage(number: Int){
        self.dosage = number
    }
    
    func changeMedicineType(medicine: String){
        self.medicineType = medicine
    }
    
    func addMedicine(mg: Int, drug: String){
        self.moreMedicine[drug] = mg
    }
    
    func getMedicine() -> [String: Int]{
        return self.moreMedicine
    }
}
    
    
