class AboutData {
  late final AboutModel data;
  late final String status;
  late final String message;

  AboutData.fromJson(Map<String, dynamic> json) {
    data = AboutModel.fromJson(json['data']);
    status = json['status'];
    message = json['message'];
  }
}

class AboutModel {
  late final String about;

  AboutModel.fromJson(Map<String, dynamic> json) {
    about = json['about'];
  }
}
