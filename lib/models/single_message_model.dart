class SingleMessageModel {
  List<Data>? data;

  SingleMessageModel({this.data});

  SingleMessageModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  Sender? sender;
  Sender? getter;
  String? message;
  int? status;
  String? date;

  Data(
      {this.id,
      this.sender,
      this.getter,
      this.message,
      this.status,
      this.date});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sender =
        json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    getter =
        json['getter'] != null ? new Sender.fromJson(json['getter']) : null;
    message = json['message'];
    status = json['status'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.sender != null) {
      data['sender'] = this.sender?.toJson();
    }
    if (this.getter != null) {
      data['getter'] = this.getter?.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    data['date'] = this.date;
    return data;
  }
}

class Sender {
  String? name;
  String? photo;

  Sender({this.name, this.photo});

  Sender.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? 'user';
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['photo'] = this.photo;
    return data;
  }
}