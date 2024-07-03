import 'package:flutter/material.dart';
import 'IntroPage.dart'; // Import the IntroPage.dart file

class level1page extends StatefulWidget {
  @override
  _Level1PageState createState() => _Level1PageState();
}

class _Level1PageState extends State<level1page> {
  int currentQuestionIndex = 0;
  int selectedOption = -1;

  List<Question> questions = [
    Question('Question 1', 'assets/images/level1_image.png', ['Apple', 'Orange', 'Banana', 'Mango'], 0),
    Question('Question 2', 'assets/images/level2_image.png', ['Apple', 'Orange', 'Banana', 'Mango'], 1),
    Question('Question 3', 'assets/images/level3_image.png', ['Apple', 'Orange', 'Banana', 'Mango'], 3),
    Question('Question 4', 'assets/images/level4_image.png', ['Apple', 'Orange', 'Banana', 'Mango'], 2),
    Question('Question 5', 'assets/images/level5_image.png', ['Fish', 'Car', 'Bus', 'Horse'], 0),
    Question('Question 6', 'assets/images/level6_image.png', ['Car', 'Bus', 'Train', 'Bicycle'], 0),
    Question('Question 7', 'assets/images/level7_image.png', ['Car', 'Bus', 'Train', 'Bicycle'], 3),
    Question('Question 8', 'assets/images/level8_image.png', ['Phone', 'Piano', 'Computer', 'Laptop'], 0),
    Question('Question 9', 'assets/images/level9_image.png', ['Car', 'Bed', 'Book', 'Bus'], 1),
    Question('Question 10', 'assets/images/level10_image.png', ['Car', 'Bed', 'Book', 'Bus'], 3),
  ];

  bool get isCorrect => questions[currentQuestionIndex].isCorrect(selectedOption);

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = questions[currentQuestionIndex];
    bool isLastQuestion = currentQuestionIndex == questions.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: Text('Level 1 Choose Correct Name !'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            currentQuestion.questionText,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(height: 40),
          Image.asset(
            currentQuestion.imagePath,
            width: 200,
            height: 200,
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.center,
            children: List.generate(
              currentQuestion.options.length,
                  (index) => _buildOption(index, currentQuestion.options[index]),
            ),
          ),
          SizedBox(height: 20),
          selectedOption == -1
              ? Text(
            'Please select an option.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          )
              : Column(
            children: [
              Text(
                isLastQuestion
                    ? 'Quiz completed. You answered ${getCorrectAnswersCount()} questions correctly.'
                    : 'Your answer is ${isCorrect ? 'correct' : 'incorrect'}.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isCorrect || isLastQuestion ? Colors.green : Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              isLastQuestion
                  ? Container()
                  : Text(
                'Correct option: ${currentQuestion.options[currentQuestion.correctOptionIndex]}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (currentQuestionIndex > 0) {
                      currentQuestionIndex--;
                      selectedOption = -1;
                    }
                  });
                },
                child: Text('Previous'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (isLastQuestion) {
                      // Handle quiz completion
                      showResultDialog(context, getCorrectAnswersCount());
                    } else if (currentQuestionIndex < questions.length - 1) {
                      currentQuestionIndex++;
                      selectedOption = -1;
                    }
                  });
                },
                child: Text(isLastQuestion ? 'Finish' : 'Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  int getCorrectAnswersCount() {
    return questions.where((question) => question.isCorrect(question.selectedOption)).length;
  }

  Widget _buildOption(int optionIndex, String optionText) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedOption = optionIndex;
          questions[currentQuestionIndex].selectedOption = optionIndex;
        });
      },
      child: Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width / 2 - 16.0,
        decoration: BoxDecoration(
          color: selectedOption == optionIndex ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            optionText,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void showResultDialog(BuildContext context, int correctAnswers) {
    String resultImage;

    if (correctAnswers > 8) {
      resultImage = 'assets/images/happy.png';
    } else if (correctAnswers > 5) {
      resultImage = 'assets/images/normal.png';
    } else {
      resultImage = 'assets/images/sad.png';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz Result'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You answered $correctAnswers questions correctly.'),
              SizedBox(height: 20),
              Image.asset(
                resultImage,
                width: 200,
                height: 200,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate to IntroPage when Finish is pressed
                Navigator.push(context, MaterialPageRoute(builder: (context) => IntroPage()));
              },
              child: Text('Finish'),
            ),
          ],
        );
      },
    );
  }
}

class Question {
  final String questionText;
  final String imagePath;
  final List<String> options;
  final int correctOptionIndex;
  int selectedOption; // Added field to store selected option

  Question(this.questionText, this.imagePath, this.options, this.correctOptionIndex)
      : selectedOption = -1; // Initialize selectedOption to -1

  bool isCorrect(int selectedOptionIndex) {
    return selectedOptionIndex == correctOptionIndex;
  }
}
