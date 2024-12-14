struct Question {
    let category: String
    let text: String
    let options: [String]
    let correctAnswerIndex: Int
}

let questions: [Question] = [
    Question(
        category: "Animals",
        text: "Which animal is known as the king of the jungle?",
        options: ["Lion", "Elephant", "Tiger", "Giraffe"],
        correctAnswerIndex: 0
    ),
    Question(
        category: "Animals",
        text: "What is the largest species of whale?",
        options: ["Blue Whale", "Humpback Whale", "Killer Whale", "Beluga Whale"],
        correctAnswerIndex: 0
    ),
    Question(
        category: "Animals",
        text: "Which animal is known to have the longest lifespan?",
        options: ["Elephant", "Bowhead Whale", "Tortoise", "Parrot"],
        correctAnswerIndex: 1
    ),
    Question(
        category: "Animals",
        text: "Which animal is known for changing its color for camouflage?",
        options: ["Chameleon", "Octopus", "Cuttlefish", "All of the above"],
        correctAnswerIndex: 3
    ),
    Question(
        category: "Animals",
        text: "Which bird is known for its ability to mimic human speech?",
        options: ["Parrot", "Eagle", "Sparrow", "Pigeon"],
        correctAnswerIndex: 0
    ),


    // People Questions
    Question(
        category: "People",
        text: "Who was the first President of the United States?",
        options: ["Abraham Lincoln", "George Washington", "John Adams", "Thomas Jefferson"],
        correctAnswerIndex: 1
    ),
    Question(
        category: "People",
        text: "In which year did World War II end?",
        options: ["1945", "1939", "1944", "1941"],
        correctAnswerIndex: 0
    ),
    Question(
        category: "People",
        text: "What was the name of the ship on which the Pilgrims traveled to America?",
        options: ["Santa Maria", "Mayflower", "Endeavour", "Discovery"],
        correctAnswerIndex: 1
    ),
    Question(
        category: "People",
        text: "Who was known as the 'Iron Lady'?",
        options: ["Margaret Thatcher", "Angela Merkel", "Indira Gandhi", "Hillary Clinton"],
        correctAnswerIndex: 0
    ),
    Question(
        category: "People",
        text: "What ancient civilization built the pyramids?",
        options: ["Roman", "Egyptian", "Greek", "Mayan"],
        correctAnswerIndex: 1
    ),

    // Game Questions
    Question(
        category: "Games",
        text: "How many players are on a soccer team?",
        options: ["9", "10", "11", "12"],
        correctAnswerIndex: 2
    ),
    Question(
        category: "Games",
        text: "What sport is known as 'The Beautiful Game'?",
        options: ["Cricket", "Soccer", "Tennis", "Basketball"],
        correctAnswerIndex: 1
    ),
    Question(
        category: "Games",
        text: "Which country has won the most FIFA World Cups?",
        options: ["Germany", "Brazil", "Italy", "Argentina"],
        correctAnswerIndex: 1
    ),
    Question(
        category: "Games",
        text: "What is the maximum score in a single frame of bowling?",
        options: ["300", "150", "100", "250"],
        correctAnswerIndex: 0
    ),
    Question(
        category: "Games",
        text: "What is the national sport of Japan?",
        options: ["Baseball", "Sumo Wrestling", "Karate", "Judo"],
        correctAnswerIndex: 1
    )
]
