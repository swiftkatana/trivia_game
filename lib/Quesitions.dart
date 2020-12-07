class Quesitions {
  final quesitions;
  var quesitionIndex = 0;
  var quesitionNow;
  var correctAnswer;
  var coutnerAnswer = 0;
  Quesitions(this.quesitions);

  Map startGame() {
    this.quesitionNow = quesitions[this.quesitionIndex];
    this.correctAnswer = this.quesitionNow['correct_answer'];
    return this.quesitionNow;
  }

  Map nextQues(text) {
    if (this.quesitionIndex < this.quesitions.length) {
      print('next quesition');
      if (text == this.correctAnswer) this.coutnerAnswer += 1;

      this.quesitionIndex += 1;
      this.quesitionNow = quesitions[this.quesitionIndex];
      this.correctAnswer = this.quesitionNow['correct_answer'];
      return this.quesitionNow;
    } else {
      print('you done the game');
      return {};
    }
  }
}
