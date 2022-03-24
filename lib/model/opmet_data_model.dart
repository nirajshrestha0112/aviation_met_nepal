class OpmetData {
  bool? status;
  String? message;
  String? data;

  OpmetData({this.status, this.message, this.data});

  OpmetData.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? "";
    message = json['message'] ?? "";
    data = json['data'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = data;
    return data;
  }

  
}
