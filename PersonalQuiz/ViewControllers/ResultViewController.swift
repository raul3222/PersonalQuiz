//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Raul Shafigin on 01.11.2021.
//

import UIKit

class ResultViewController: UIViewController {
   

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    var resultAnimal: AnimalType = .dog

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        checkAnimalFrom(answers: answers)
    }
    
    private func checkAnimalFrom(answers: [Answer]) {
        
        var dogCount = 0
        var catCount = 0
        var turtleCount = 0
        var rabbitCount = 0
        
        var animalsDictionary = [AnimalType: Int]()
      
        for answer in answers {
            
            switch answer.type {
            case .dog:
                dogCount += 1
                animalsDictionary.updateValue(dogCount, forKey: .dog)
            case .cat:
                catCount += 1
                animalsDictionary.updateValue(catCount, forKey: .cat)
            case .rabbit:
                rabbitCount += 1
                animalsDictionary.updateValue(rabbitCount, forKey: .rabbit)
            case .turtle:
                turtleCount += 1
                animalsDictionary.updateValue(rabbitCount, forKey: .turtle)
            }
        }
        
        if let max = animalsDictionary.values.max() {
            for (key, value) in animalsDictionary {
                if value == max {
                    resultAnimal = key
                }
            }
        }
        
        for answer in answers {
            if answer.type == resultAnimal{
                titleLabel.text = String(answer.type.rawValue)
                descriptionLabel.text = answer.type.definition
            }
        }
    }
}
