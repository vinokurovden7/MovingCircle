//
//  ViewController.swift
//  MovingCircle
//
//  Created by Денис Винокуров on 30.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: IBOutlets:
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var upMoveButton: UIButton!
    @IBOutlet weak var rightMoveButton: UIButton!
    @IBOutlet weak var downMoveButton: UIButton!
    @IBOutlet weak var leftMoveButton: UIButton!
    @IBOutlet weak var buttonStack: UIStackView!
    @IBOutlet weak var centeringMoveButton: UIButton!
    
    //MARK: Переменные:
    private let circleView = UIView()
    private var screenWith = CGFloat()
    private var screenHeight = CGFloat()
    private var point = CGPoint()
    private var size = CGSize()
    private let movingStep: CGFloat = 50
    private let viewSize: CGFloat = 100
    
    enum DirectionMove: String {
        case up = "Вверх"
        case right = "Вправо"
        case down = "Вниз"
        case left = "Влево"
        case center = "Центр"
    }

    //MARK: Жизненный цикл:
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenWith = self.view.frame.width
        screenHeight = self.view.frame.height
        point = CGPoint(x: screenWith / 2 - (viewSize / 2), y: screenHeight / 2 - (viewSize / 2))
        size = CGSize(width: viewSize, height: viewSize)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupCircleView()
        self.view.addSubview(circleView)
        
    }
    
    //MARK: Обработчики IBActions:
    @IBAction func upMoveButtonAction(_ sender: UIButton) {
        moveView(direcion: .up)
    }
    @IBAction func rightMoveButtonAction(_ sender: UIButton) {
        moveView(direcion: .right)
    }
    @IBAction func downMoveButtonAction(_ sender: UIButton) {
        moveView(direcion: .down)
    }
    @IBAction func leftMoveButtonAction(_ sender: UIButton) {
        moveView(direcion: .left)
    }
    @IBAction func centeringMoveButtonAction(_ sender: UIButton) {
        moveView(direcion: .center)
    }
    
    
    //MARK: Кастомные функции:
    private func setupCircleView() {
        
        circleView.frame = CGRect(origin: point, size: size)
        circleView.layer.cornerRadius = circleView.frame.height / 2
        circleView.backgroundColor = .systemGreen
        
    }
    
    private func moveView(direcion: DirectionMove) {
        switch direcion {
        case .up:
            if circleView.frame.origin.y <= informationLabel.frame.maxY + movingStep {
                informationLabel.text = "Дальше двигаться вверх нельзя"
            } else {
                informationLabel.text = direcion.rawValue
                circleView.frame.origin.y -= movingStep
            }
        case .right:
            if circleView.frame.origin.x >= self.view.frame.maxX - circleView.frame.width - movingStep {
                informationLabel.text = "Дальше двигаться вправо нельзя"
            } else {
                informationLabel.text = direcion.rawValue
                circleView.frame.origin.x += movingStep
            }
        case .down:
            if circleView.frame.origin.y >= buttonStack.frame.minY - circleView.frame.height - movingStep {
                informationLabel.text = "Дальше двигаться вниз нельзя"
            } else {
                informationLabel.text = direcion.rawValue
                circleView.frame.origin.y += movingStep
            }
        case .left:
            if circleView.frame.origin.x <= movingStep {
                informationLabel.text = "Дальше двигаться влево нельзя"
            } else {
                informationLabel.text = direcion.rawValue
                circleView.frame.origin.x -= movingStep
            }
        case .center:
            circleView.frame = CGRect(origin: point, size: size)
            informationLabel.text = direcion.rawValue
        }
    }

}
