import 'package:flutter_html/flutter_html.dart';

class PrivacyPolicy {
  PrivacyPolicy({
    required this.status,
    required this.message,
    required this.data,
  });
  late final String status;
  late final String message;
  late final List<Data> data;

  PrivacyPolicy.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.policyTitle,
    required this.policyTitleNp,
    required this.policyDetails,
    required this.policyDetailsNp,
  });
  late final String id;
  late final String policyTitle;
  late final String policyTitleNp;
  late final String policyDetails;
  late final String policyDetailsNp;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    policyTitle = json['policy_title'];
    policyTitleNp = json['policy_title_np'];
    policyDetails = json['policy_details'];
    policyDetailsNp = json['policy_details_np'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['policy_title'] = policyTitle;
    _data['policy_title_np'] = policyTitleNp;
    _data['policy_details'] = policyDetails;
    _data['policy_details_np'] = policyDetailsNp;
    return _data;
  }
}
