class FAQSData {
  late final List<FAQSModel> list;
  late final String status;
  late final String message;
  FAQSData.fromJson(Map<String, dynamic> json) {
    list = List.from(json['data']).map((e) => FAQSModel.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }
}

class FAQSModel {
  late final int id;
  late final String question;
  late final String answer;

  FAQSModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }
}
