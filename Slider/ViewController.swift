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
//    загаданное число
    var number: Int = 0
//    роунд
    var round: Int = 0
//    сумма очков
    var points: Int = 0
    
    @IBAction func setNumber() {
//       Игра только началась
        if self.round == 0 {
            number = Int.random(in: 1...50)
            label.text = String(number)
            self.round = 1
        } else {
//            Если первй раунд, получаем значение со слайдера.
            let sliderNumbar = Int(self.slider.value.rounded())
//            сравниваем значение с загаданным числом
            if sliderNumbar > self.number {
                points = 50 - sliderNumbar + number
            } else if self.number > sliderNumbar {
                points = 50 - self.number + sliderNumbar
            } else {
                points = 50
            }
            
//            условие, если раундов уже 5
            if round == 5 {
                let alert = UIAlertController(title: "The game is over", message: "You have earned \(points) points", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Start over", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
//                устанавливаем значения раунда и обнуляем очки
                self.round = 1
                self.points = 0
            } else {
                round += 1
            }
//            генерируем случайное значение
            number = Int.random(in: 1...50)
            label.text = String(number)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

