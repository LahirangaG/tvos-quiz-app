import SwiftUI

struct QuizView: View {
    let category: String
    let onReturnToCategorySelection: () -> Void // Callback to return to the category selection
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswerIndex: Int? = nil
    @State private var score = 0
    @State private var showResult = false
    @State private var timeRemaining = 10
    @State private var timerActive = true

    var filteredQuestions: [Question] {
        questions.filter { $0.category == category }
    }

    var body: some View {
        ZStack {
            VStack {
                if showResult {
                    // Show the result screen
                    VStack {
                        Text("Quiz Completed!")
                            .font(.largeTitle)
                            .padding()
                        Text("Your Score: \(score) / \(filteredQuestions.count)")
                            .font(.title)
                        Button("Back to Categories") {
                            onReturnToCategorySelection()
                        }
                        .padding()
                        .background(Color(hex: "#5a67da")) // Set background color to #5a67da
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                } else {
                    // Show the quiz question and answers
                    VStack {
                        Text(filteredQuestions[currentQuestionIndex].text)
                            .font(.title)
                            .padding()

                        ForEach(0..<filteredQuestions[currentQuestionIndex].options.count, id: \.self) { index in
                            Button(action: {
                                selectedAnswerIndex = index
                                checkAnswer()
                            }) {
                                Text(filteredQuestions[currentQuestionIndex].options[index])
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(selectedAnswerIndex == index ? Color(hex: "#5a67da") : Color(hex: "#5a67da")) // Set background color to #5a67da
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                            }
                        }

                        Spacer()

                        // Display the timer
                        Text("Time Remaining: \(timeRemaining)s")
                            .font(.headline)
                            .foregroundColor(timeRemaining > 3 ? .black : .red)

                        Text("Score: \(score)")
                            .font(.headline)
                    }
                    .padding()
                    .onAppear(perform: startTimer)
                }
            }
        }
    }

    func checkAnswer() {
        timerActive = false // Stop the timer
        if selectedAnswerIndex == filteredQuestions[currentQuestionIndex].correctAnswerIndex {
            score += 1
        }
        goToNextQuestion()
    }

    func goToNextQuestion() {
        if currentQuestionIndex < filteredQuestions.count - 1 {
            currentQuestionIndex += 1
            selectedAnswerIndex = nil
            timeRemaining = 10 // Reset the timer
            timerActive = true
            startTimer()
        } else {
            showResult = true
        }
    }

    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if timeRemaining > 0 && timerActive {
                timeRemaining -= 1
            } else {
                timer.invalidate()
                if timeRemaining == 0 {
                    // Automatically move to the next question if time runs out
                    goToNextQuestion()
                }
            }
        }
    }
}
