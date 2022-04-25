//
//  ViewController.swift
//  Slider
//
//  Created by Дмитрий Остерман on 24.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!

    var game: Game!
    
//    MARK: - Жизненный цикл
    
    override func loadView() {
        super .loadView()
        let versionLabel = UILabel(frame: CGRect(x: 50, y: 20, width: 85, height: 20))
        versionLabel.backgroundColor = #colorLiteral(red: 0.3884259462, green: 0.6494452953, blue: 0.6857375503, alpha: 1)
        versionLabel.text = " version 1.1"
        versionLabel.textColor = .white
        self.view.addSubview(versionLabel)
        print("loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        создаем экземпляр сущности ИГРА
        game = Game(startValue: 1, endValue: 50, rounds: 5)
//        обновляем данные о текущем значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
//    MARK: взаимодействие view - model
    
//    проверка выбранного пользователем числа
    @IBAction func chekNumber() {
//        считаем очки за раунд
        game.calculateScore(with: Int(slider.value))
//        проверяем окончена ли игра
        if game.isGameEnded {
            showAlertWith(score: game.score)
//            начинаем игру заново
            game.restartGame()
        } else {
            game.startNewRound()
        }
//        обновляем даннын о текущем значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    
//MARK: обновление view
   private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
    }
    
//    Отображение алерта со счетом
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(title: "Игра окончена.", message: "Вы заработали: \(score) очков", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново.", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
// MARK: The End.
    
    
    
}

