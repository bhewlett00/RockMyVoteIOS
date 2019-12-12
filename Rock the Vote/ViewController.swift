//
//  ViewController.swift
//  Rock the Vote
//
//  Created by Hewlett, Brianna Anne on 12/12/19.
//  Copyright © 2019 Hewlett, Brianna Anne. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    var votes = [Vote] ()

    @IBOutlet weak var songTextField: UITextField!
    
    @IBOutlet weak var voterTextField: UITextField!
    
    @IBOutlet weak var like: UIButton!
        
    @IBOutlet weak var dislike: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func saveVotes(){
        do{
            try context.save()
        }catch{
            print("Error saving Vote to Core Data")
        }
        
        reloadData()
    }

    @IBAction func like(_ sender: UIButton) {
        let newVote = Vote(context: self.context)
            
        newVote.songTitle = self.songTextField.text!
        newVote.voterName = self.voterTextField.text!
        newVote.vote = true
            
        self.votes.append(newVote)
            
        self.saveVotes()
    }
    
    
    @IBAction func dislike(_ sender: UIButton) {
        let newVote = Vote(context: self.context)
            
        newVote.songTitle = self.songTextField.text!
        newVote.voterName = self.voterTextField.text!
        newVote.vote = false
            
        self.votes.append(newVote)
            
        self.saveVotes()
    }
    

}

