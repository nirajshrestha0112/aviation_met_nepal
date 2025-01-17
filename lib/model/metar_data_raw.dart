import 'dart:developer';

class MetarDataRaw {
  String? status;
  Data? data;

  MetarDataRaw({this.status, this.data});

  MetarDataRaw.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? "";
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<String>? date;
  List<String>? raw;

  Data({this.date, this.raw});

  Data.fromJson(Map<String, dynamic> json) {
    // if (json['Error'] != null) {
    //   throw "Something";
    // }
    date = json['Date'] != null ? json['Date'].cast<String>() : [];
    raw = json['Raw'] != null ? json['Raw'].cast<String>() : [];
    // : ["No data available"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Date'] = date;
    data['Raw'] = raw;
    return data;
  }
}
