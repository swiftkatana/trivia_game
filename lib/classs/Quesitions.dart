class Quesitions {
  // quesitions is an Array Of Objects
  final quesitions;
  // quesitionIndex is a inductor to what question we are now
  var quesitionIndex = 0;
  // quesitionNow is the quesition that we are now on
  var quesitionNow;
  // correctAnswer is the correct answer for this quesition
  var correctAnswer;
  //  coutnerAnswer is how many answers was guess right
  var coutnerAnswer = 0;
  // gameOver is a inductor to what  is the status of the game false still play
  // true complete the game
  var gameOver = false;

  Quesitions(this.quesitions);

// this Function
  Map startGame() {
    this.quesitionNow = quesitions[this.quesitionIndex];
    this.correctAnswer = this.quesitionNow['correct_answer'];
    return this.quesitionNow;
  }

  // this Function return the status of tne game
  Map gameDone() {
    return {"counter": this.coutnerAnswer, "done": this.gameOver};
  }

  Map nextQues(text) {
    // enter this if you still not on the last quesition

    if (this.quesitionIndex != this.quesitions.length - 1) {
      print('next quesition');

      if (text == this.correctAnswer) {
        this.coutnerAnswer += 1;
        print('good');
      } else {
        print('bad');
        print(this.correctAnswer);
      }

      this.quesitionIndex += 1;
      this.quesitionNow = quesitions[this.quesitionIndex];
      this.correctAnswer = this.quesitionNow['correct_answer'];
      return this.quesitionNow;
    } else {
      // this else mean that you complete the game

      if (text == this.correctAnswer) {
        this.coutnerAnswer += 1;
        print('good');
      }

      this.gameOver = true;
      print('you done the game');
      print(this.coutnerAnswer);
      return {};
    }
  }
}
