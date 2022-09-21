class LoginResponse {
  String? detail;
  int? id;
  String? token;
  String? name;
  String? phone;
  int? statusCode;

  LoginResponse({this.detail, this.id, this.token, this.name, this.phone, this.statusCode});

  LoginResponse.fromJson(Map<String, dynamic> json, {this.statusCode}) {
    detail = json['detail'];
    id = json['id'];
    token = json['token'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['detail'] = detail;
    data['id'] = id;
    data['token'] = token;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}
