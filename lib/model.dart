// To parse this JSON data, do
//
//     final questions = questionsFromJson(jsonString);

import 'dart:convert';

Questions? questionsFromJson(String str) => Questions.fromJson(json.decode(str));

String questionsToJson(Questions? data) => json.encode(data!.toJson());

class Questions {
  Questions({
    this.questions,
  });

  List<Question?>? questions;

  factory Questions.fromJson(Map<String, dynamic> json) => Questions(
    questions: json["questions"] == null ? [] : List<Question?>.from(json["questions"]!.map((x) => Question.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "questions": questions == null ? [] : List<dynamic>.from(questions!.map((x) => x!.toJson())),
  };
}

class Question {
  Question({
    this.question,
    this.answers,
    this.questionImageUrl,
    this.correctAnswer,
    this.score,
  });

  String? question;
  Answers? answers;
  String? questionImageUrl;
  String? correctAnswer;
  int? score;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    question: json["question"],
    answers: Answers.fromJson(json["answers"]),
    questionImageUrl: json["questionImageUrl"],
    correctAnswer: json["correctAnswer"],
    score: json["score"],
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "answers": answers!.toJson(),
    "questionImageUrl": questionImageUrl,
    "correctAnswer": correctAnswer,
    "score": score,
  };
}

class Answers {
  Answers({
    this.a,
    this.b,
    this.c,
    this.d,
  });

  String? a;
  String? b;
  String? c;
  String? d;

  factory Answers.fromJson(Map<String, dynamic> json) => Answers(
    a: json["A"],
    b: json["B"],
    c: json["C"],
    d: json["D"],
  );

  Map<String, dynamic> toJson() => {
    "A": a,
    "B": b,
    "C": c,
    "D": d,
  };
}
