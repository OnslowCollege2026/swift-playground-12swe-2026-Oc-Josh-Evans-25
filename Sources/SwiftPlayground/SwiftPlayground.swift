// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@main
struct SwiftPlayground {
    static func main() {
        // Constants and variables.
        
        /// The vocalubary to test the user on.
        /// Each inner array contains the English, word, the correct answer in the
        /// target language, and then three incorect answers.
        let vocabulary = [
            ["hello", "kia ora", "ka pai", "ata marie", "kao"],
            ["goodbye", "haere ra", "kia ora", "ae", "haere mai"],
            ["thank you", "kia ora", "kao", "ata marie", "ae"],
            ["yes", "Ae", "haere ra", "ata marie", "kao"],
            ["no", "Kao", "ka pai", "haere ra", "ae"]
        ]

        /// The indices of the questions that user got wrong.
        var incorrectIndices: [Int] = []

        /// The number of questions that user got wrong first time around.
        var score = 0

        /// The number of questions the user has been asked.
        var count = 0


        while count < vocabulary.count {
            let englishWord = vocabulary[count][0]
            let correctWord = vocabulary[count][1]
            let allAnswers = vocabulary[count].dropFirst().shuffled()

            
            print("Please translate \(englishWord)")
            allAnswers.forEach{ answer in
                print("- \(answer)")
            }
            if let userInput = readLine(), userInput.lowercased() == correctWord.lowercased() {
                    score = score + 1
                    print("Yes, \(correctWord) is correct.")
                } else {
                    incorrectIndices.append(count)
                    print("Sorry! The correct answer is \(correctWord).")
                }
        }
        count = count + 1
        
        while incorrectIndices.count > 0 {
            let index = incorrectIndices[0]

            let englishWord = vocabulary[index][0]
            let correctWord = vocabulary[index][1]
            let allAnswers = vocabulary[index].dropFirst().shuffled()

            print("Please translate \(englishWord)")
            allAnswers.forEach{ answer in
                print("- \(answer)")
            }
            if let userInput = readLine(), userInput.lowercased() == correctWord.lowercased() {
                incorrectIndices.removeFirst()
                print("Yes, \(correctWord) is correct!")
            } else {
                print("Sorry! The correct answer is \(correctWord).")
            }
        }

        print("You have a score of \(score)/\(vocabulary.count)")
        if Double(score) >= Double(vocabulary.count / 2) {
            print("Congratulations.")
        } else {
            print("Try again next time.")
        }
    }
}