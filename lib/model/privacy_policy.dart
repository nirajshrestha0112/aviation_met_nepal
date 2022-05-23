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
    status = json['status'] ?? "";
    message = json['message'] ?? "";
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final privacyData = <String, dynamic>{};
    privacyData['status'] = status;
    privacyData['message'] = message;
    privacyData['data'] = data.map((e) => e.toJson()).toList();
    return privacyData;
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
    final data = <String, dynamic>{};
    data['id'] = id;
    data['policy_title'] = policyTitle;
    data['policy_title_np'] = policyTitleNp;
    data['policy_details'] = policyDetails;
    data['policy_details_np'] = policyDetailsNp;
    return data;
  }
}
