//
//  HomeViewModel.swift
//  Quiz
//
//  Created by Ana Dzamelashvili on 7/12/23.
//

import Foundation

class HomeViewModel {
    
    let subjects: [Subject] = [
        
        Subject(icon: "",
                subjectTitle: "პრიგრამირება",
                quizDescription: "აღწერა",
                quizQuestionCount: 2,
                questions: [Question(questionTitle: "რომელია ყველაზე პოპულარული პროგრამირების ენა?",
                                     answers: ["Python", "Java", "C++", "Kotlin"],
                                     correctAnswer: "Java",
                                     questionIndex: 0),
                            Question(questionTitle: "რა პროგრამირების ენა გამოიყენება iOS-ში?",
                                     answers: ["Objective-C", "Swift", "Java", "Kotlin"],
                                     correctAnswer: "Swift",
                                     questionIndex: 1)]
               ),
        
        
        Subject(icon: "",
                subjectTitle: "გეოგრაფია",
                quizDescription: "აღწერა",
                quizQuestionCount: 2,
                questions: [Question(questionTitle: "რომელია ყველაზე პოპულარული პროგრამირების ენა?",
                                     answers: ["Python", "Java", "C++", "Kotlin"],
                                     correctAnswer: "Java",
                                     questionIndex: 0),
                            Question(questionTitle: "რა პროგრამირების ენა გამოიყენება iOS-ში?",
                                     answers: ["Objective-C", "Swift", "Java", "Kotlin"],
                                     correctAnswer: "Swift",
                                     questionIndex: 1)]
               ),
        
        Subject(icon: "",
                subjectTitle: "ისტორია",
                quizDescription: "აღწერა",
                quizQuestionCount: 2,
                questions: [Question(questionTitle: "რომელია ყველაზე პოპულარული პროგრამირების ენა?",
                                     answers: ["Python", "Java", "C++", "Kotlin"],
                                     correctAnswer: "Java",
                                     questionIndex: 0),
                            Question(questionTitle: "რა პროგრამირების ენა გამოიყენება iOS-ში?",
                                     answers: ["Objective-C", "Swift", "Java", "Kotlin"],
                                     correctAnswer: "Swift",
                                     questionIndex: 1)]
               )

    ]
    
}
