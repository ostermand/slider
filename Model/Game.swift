
//

import UIKit

//Cоздаем протокол согласно схеме UML

protocol GameProtocol {
//    счет игы
    var score: Int {get}
//    загаданное значение
    var currentSecretValue: Int {get}
//    флаг
    var isGameEnded: Bool {get}
//    новая игра
    func restartGame()
//    следующий раунд
    func startNewRound()
//    подсчет очков
    func calculateScore(with value: Int)
}

class Game: GameProtocol {
    var score: Int = 0
//    диапазон значений
    private var minSecretValue: Int
    private var maxSecretValue: Int
    var currentSecretValue: Int = 0
    
    private var lastRound: Int
    private var currentRound: Int = 1
    
    var isGameEnded: Bool {
        if currentRound >= lastRound {
            return true
        } else {
            return false
        }
    }
    
    init?(startValue: Int, endValue: Int, rounds: Int) {
        guard startValue <= endValue else {
            return nil
        }
        minSecretValue = startValue
        maxSecretValue = endValue
        lastRound = rounds
        currentSecretValue = self.getNewSecretValue()
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentSecretValue = self.getNewSecretValue()
        currentRound += 1
    }
    
    private func getNewSecretValue() -> Int {
        Int.random(in: minSecretValue...maxSecretValue)
    }
    
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if currentSecretValue > value {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
    }
}
























































































































































































































