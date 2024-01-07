class Questions {
  late int id; // Marking it 'late' since it's being initialized in the constructor
  late String question;
  late int voteCount;
  late String views;
  late String tags;

  Questions({
    required this.id,
    required this.question,
    required this.voteCount,
    required this.views,
    required this.tags,
  });

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    voteCount = json['vote_count'];
    views = json['views'];
    tags = json['tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['question'] = question;
    data['vote_count'] = voteCount;
    data['views'] = views;
    data['tags'] = tags;
    return data;
  }
}

class QuestionData {
  late List<Questions> questions; // Marking it 'late' since it's being initialized in the constructor

  QuestionData({List<Questions>? questions}) : questions = questions ?? [];

  QuestionData.fromJson(Map<String, dynamic> json) {
    questions = [];
    for (var question in json['questions']) {
      questions.add(Questions.fromJson(question));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['questions'] = questions.map((question) => question.toJson()).toList();
    return data;
  }
}
