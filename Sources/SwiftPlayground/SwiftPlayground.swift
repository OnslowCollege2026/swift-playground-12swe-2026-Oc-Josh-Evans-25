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
            ["Hello", "Kia ora", "Ka pai", "Ata marie", "Kao"],
            ["Goodbye", "Ata marie", "Kia ora", "Ae", "Haere mai"],
            ["Thank you", "Kia ora", "Kao", "Ata marie", "Ae"],
            ["Yes", "Ae", "Haere ra", "Ata marie", "Kao"],
            ["No", "Kao", "Ka pai", "Haere ra", "Ae"]
        ]

        /// The indices of the questions that user got wrong.
        var incorrectIndices: [Int] = []

        /// The number of questions that user got wrong first time around.
        var incorrectCount = 0

        /// The number of questions the user has been asked.
        var count = 0

        // Loop until all of the vocabulary questions have been asked.
        vocabulary.enumerated().forEach { index, word in
            // Show the question.
            print("Translate this word: \(vocabulary[index][0])")            
            
            // Present the possible answers.
            print("1. \(vocabulary[index][1])")
            print("2. \(vocabulary[index][2])")
            print("3. \(vocabulary[index][3])")
            print("4. \(vocabulary[index][4])")

            print("\nEnter your guess for \(vocabulary[index][0]): ")

            if let response = readLine(), let userResponse = Int(response) {
                
            }

            // Check if the user guessed the correct answer.
            // If not, make a note of the question to ask again later.
        }

        
    }
}