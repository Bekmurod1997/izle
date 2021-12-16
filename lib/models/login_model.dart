class LoginModel {
  int? id;
  String? token;
  String? deviceId;
  String? name;
  String? phone;
  String? email;
  String? photo;
  String? date;
  String? city;
  int? balance;

  LoginModel(
      {this.id,
      this.token,
      this.deviceId,
      this.name,
      this.phone,
      this.email,
      this.photo,
      this.date,
      this.city,
      this.balance});

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deviceId = json['device_id'];
    token = json['token'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    photo = json['photo'];
    date = json['date'];
    city = json['city'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['device_id'] = this.deviceId;

    data['token'] = this.token;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['photo'] = this.photo;
    data['date'] = this.date;
    data['city'] = this.city;
    data['balance'] = this.balance;
    return data;
  }
}
