class WeatherCameraImages {
  List<Files> files = [];
  String? name;

  WeatherCameraImages.fromJson(Map<String, dynamic> json) {
    if (json['files'] != null) {
      files = <Files>[];
      json['files'].forEach((v) {
        files.add(Files.fromJson(v));
      });
    }
    name = json['name']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};

    if (files.isNotEmpty) {
      data['files'] = files.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    return data;
  }
}

class Files {
  String? source;

  Files.fromJson(Map<String, dynamic> json) {
    source = json['source']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['source'] = source;
    return data;
  }
}