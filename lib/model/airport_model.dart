class Airport {
  int? id;
  String? identifier;
  String? name;
  String? folderName;
  double? longitude;
  double? latitude;
  double? elevation;
  String? description;
  List<Tags>? tags;
  List? images;
  List? dataSource;
  
  List<MetaData>? metaData;

  Airport(
      {this.id,
      this.identifier,
      this.name,
      this.folderName,
      this.longitude,
      this.latitude,
      this.elevation,
      this.description,
      this.tags,
      this.images,
      this.dataSource,
      this.metaData});

  Airport.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    identifier = json['identifier'] ?? "";
    name = json['name'] ?? "";
    folderName = json['folder_name'] ?? "";
    if (json['longitude'] != null) {
      if (json['longitude'] is int) {
        longitude = json['longitude'].toDouble();
      } else {
        longitude = json['longitude'];
      }
    }
    if (json['latitude'] != null) {
      if (json['latitude'] is int) {
        latitude = json['latitude'].toDouble();
      } else {
        latitude = json['latitude'];
      }
    }
    if (json['elevation'] != null) {
      if (json['elevation'] is int) {
        elevation = json['elevation'].toDouble();
      } else {
        elevation = json['elevation'];
      }
    }
    // latitude = json['latitude'];
    // elevation = json['elevation'];
    description = json['description'];
    tags = <Tags>[];
    if (json['tags'] != null) {
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    images = json['images'];
    dataSource = json['data_source'];
    if (json['meta_data'] != null) {
      metaData = <MetaData>[];
      json['meta_data'].forEach((v) {
        metaData!.add(MetaData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['identifier'] = identifier;
    data['name'] = name;
    data['folder_name'] = folderName;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['elevation'] = elevation;
    data['description'] = description;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    data['images'] = images;
    data['data_source'] = dataSource;
    if (metaData != null) {
      data['meta_data'] = metaData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tags {
  int? id;
  String? name;
  String? description;

  Tags({this.id, this.name, this.description});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    description = json['description'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}

class MetaData {
  int? id;
  String? name;
  String? caption;
  String? description;
  String? flagged;
  int? seq;
  String? value;

  MetaData(
      {this.id,
      this.name,
      this.caption,
      this.description,
      this.flagged,
      this.seq,
      this.value});

  MetaData.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    caption = json['caption'] ?? "";
    description = json['description'] ?? "";
    flagged = json['flagged'] ?? "";
    seq = json['seq'] ?? "";
    value = json['value'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['caption'] = caption;
    data['description'] = description;
    data['flagged'] = flagged;
    data['seq'] = seq;
    data['value'] = value;
    return data;
  }
}
