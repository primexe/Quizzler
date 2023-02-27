
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLaber: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.qetQuestionText()
        
        answerButton1.setTitle(quizBrain.qetAnswersText()[0], for: .normal)
        answerButton2.setTitle(quizBrain.qetAnswersText()[1], for: .normal)
        answerButton3.setTitle(quizBrain.qetAnswersText()[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLaber.text = "Score: \(quizBrain.getScore())"
        
        answerButton1.backgroundColor = UIColor.clear
        answerButton2.backgroundColor = UIColor.clear
        answerButton3.backgroundColor = UIColor.clear
    }
}

