class RecoveryPasswordModel {
  Data? data;

  RecoveryPasswordModel({this.data});

  RecoveryPasswordModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  String? phone;
  String? code;
  int? smsExpire;
  int? id;

  Data({this.phone, this.code, this.smsExpire, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    code = json['code'];
    smsExpire = json['sms_expire'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['code'] = this.code;
    data['sms_expire'] = this.smsExpire;
    data['id'] = this.id;
    return data;
  }
}
