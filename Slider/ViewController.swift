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
    var round: Int = 1
//    сумма очков
    var points: Int = 0
    
    @IBAction func setNumber() {

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

    lazy var nextViewController: NextViewController = getNextViewController()
    
   private func getNextViewController() -> NextViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NextViewController")
    return viewController as! NextViewController
    }
    
    @IBAction func showNextScreen() {
        self.present(nextViewController, animated: true, completion: nil)
    }
    
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
//        генерируем случайное значение
                  number = Int.random(in: 1...50)
                  label.text = String(number)
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    
    
}

