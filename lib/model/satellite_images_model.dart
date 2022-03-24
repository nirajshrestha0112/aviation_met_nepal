class SatelliteImageData {
  bool? status;
  Data? data;

  SatelliteImageData({this.status, this.data});

  SatelliteImageData.fromJson(Map<String, dynamic> json) {
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
  List<String>? files;
  String? date;

  Data({this.files, this.date});

  Data.fromJson(Map<String, dynamic> json) {
    files = json['files'].cast<String>() ?? "";
    date = json['date'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['files'] = files;
    data['date'] = date;
    return data;
  }
}
