class UserInfoModel {
  int? id;
  String? token;
  String? name;
  String? phone;
  String? email;
  String? photo;
  String? date;
  String? city;
  int? balance;

  UserInfoModel(
      {this.id,
      this.token,
      this.name,
      this.phone,
      this.email,
      this.photo,
      this.date,
      this.city,
      this.balance});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    name = json['name'] ?? 'user';
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
