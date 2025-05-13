class OutgoingCallModle {
  bool? status;
  String? message;
  List<Data>? data;

  OutgoingCallModle({this.status, this.message, this.data});

  OutgoingCallModle.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? phoneno;
  String? startTime;
  String? endTime;
  String? duration;

  Data({this.id, this.phoneno, this.startTime, this.endTime, this.duration});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneno = json['phoneno'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phoneno'] = this.phoneno;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['duration'] = this.duration;
    return data;
  }
}
