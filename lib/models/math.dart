class MathModel {
  final String question;
  final String ans;
  final List<Option> options;

  MathModel({required this.question, required this.ans, required this.options});
}

class Option {
  final String option;

  Option(this.option);
}
