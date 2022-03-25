/* class LightingData {
	bool? status;
	List<List>? data;

	LightingData({this.status, this.data});

	LightingData.fromJson(Map<String, dynamic> json) {
		status = json['status'];
		if (json['data'] != null) {
			data = <List>[];
			json['data'].forEach((v) { data!.add(new List.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['status'] = this.status;
		if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class Data {


	Data({});

	Data.fromJson(Map<String, dynamic> json) {
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		return data;
	}
}
 */