class HomeData {
  late final List<HomeModel> list;

  late final String message;
  late final String status;

  HomeData.fromJson(Map<String, dynamic> json) {
    list = List.from(json['data']).map((e) => HomeModel.fromJson(e)).toList();
    message = json['message'];
    status = json['status'];
  }
}

class HomeModel {
  late final int id;
  late final String status;
  late final String date;
  late final String time;
  late final int? orderPrice;
  late final int deliveryPrice;
  late final int? totalPrice;
  late final String? phone;
  late final Address? address;
  late final String payType;
  late final void note;
  late final String clientName;
  late final String clientImage;
  late final void city;
  late final List<Images> images;
  HomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    date = json['date'];
    time = json['time'];
    orderPrice = json['order_price'];
    deliveryPrice = json['delivery_price'];
    totalPrice = json['total_price'];
    phone = null;
    address = null;
    payType = json['pay_type'];
    note = null;
    clientName = json['client_name'];
    clientImage = json['client_image'];
    city = null;
    images = List.from(json['images']).map((e) => Images.fromJson(e)).toList();
  }
}

class Address {
  late final int id;
  late final String type;
  late final double lat;
  late final double lng;
  late final String location;
  late final String description;
  late final int userId;
  late final int isDefault;
  late final String phone;
  late final String createdAt;
  late final String updatedAt;
  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    lat = json['lat'];
    lng = json['lng'];
    location = json['location'];
    description = json['description'];
    userId = json['user_id'];
    isDefault = json['is_default'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Images {
  late final String name;
  late final String url;

  Images.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
