class AllMessageModel {
  List<Data>? data;

  AllMessageModel({this.data});

  AllMessageModel.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  String? name;
  String? photo;
  int? messages;
  String? lastMessage;
  String? date;

  Data(
      {this.id,
      this.userId,
      this.name,
      this.photo,
      this.messages,
      this.lastMessage,
      this.date});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'] ?? '';
    photo = json['photo'];
    messages = json['messages'];
    lastMessage = json['last_message'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['messages'] = this.messages;
    data['last_message'] = this.lastMessage;
    data['date'] = this.date;
    return data;
  }
}
