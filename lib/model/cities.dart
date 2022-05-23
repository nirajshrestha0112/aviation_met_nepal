class DatumCities {
  DatumCities({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.type,
    required this.coordinate,
    required this.region,
    required this.level,
    required this.geometry,
    required this.domain,
    required this.tags,
  });

  late final String id;
  late final String latitude;
  late final String longitude;
  late final String description;
  late final String type;
  late final String coordinate;
  late final String region;
  late final String level;
  late final String geometry;
  late final String domain;
  late final String tags;

  DatumCities.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    latitude = json['latitude'] ?? "";
    longitude = json['longitude'] ?? "";
    description = json['description'] ?? "";
    type = json['type'] ?? "";
    coordinate = json['coordinate'] ?? "";
    region = json['region'] ?? "";
    level = json['level'] ?? "";
    geometry = json['geometry'] ?? "";
    domain = json['domain'] ?? "";
    tags = json['tags'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['description'] = description;
    data['type'] = type;
    data['coordinate'] = coordinate;
    data['region'] = region;
    data['level'] = level;
    data['geometry'] = geometry;
    data['domain'] = domain;
    data['tags'] = tags;
    return data;
  }
}
