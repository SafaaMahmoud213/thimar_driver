class PrivacyData {
  late final PrivacyModel data;
  late final String status;
  late final String message;

  PrivacyData.fromJson(Map<String, dynamic> json) {
    data = PrivacyModel.fromJson(json['data']);
    status = json['status'];
    message = json['message'];
  }
}

class PrivacyModel {
  late final String policy;

  PrivacyModel.fromJson(Map<String, dynamic> json) {
    policy = json['policy'];
  }
}
