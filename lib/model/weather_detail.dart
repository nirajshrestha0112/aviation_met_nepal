class WeatherForecast {
  WeatherForecast({
    required this.data,
  });

  final Data data;

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      WeatherForecast(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.areaInfo,
    required this.params,
  });

  final AreaInfo areaInfo;
  final Map<String, dynamic> params;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      areaInfo: AreaInfo.fromJson(json["areainfo"]),
      params: json["params"],
    );
  }

  Map<String, dynamic> toJson() => {
        "areainfo": areaInfo.toJson(),
        "params": params.toString(),
      };
}

class AreaInfo {
  AreaInfo({
    required this.id,
    required this.description,
    required this.areaInfoClass,
    required this.coordinate,
    required this.domain,
    required this.geometry,
    required this.tags,
    required this.parentId,
    required this.forecastArea,
  });

  final String id;
  final String description;
  final String areaInfoClass;
  final String coordinate;
  final String domain;
  final String geometry;
  final String tags;
  final dynamic parentId;
  final ForecastArea forecastArea;

  factory AreaInfo.fromJson(Map<String, dynamic> json) => AreaInfo(
        id: json["id"],
        description: json["description"],
        areaInfoClass: json["class"],
        coordinate: json["coordinate"],
        domain: json["domain"],
        geometry: json["geometry"],
        tags: json["tags"],
        parentId: json["parent_id"],
        forecastArea: ForecastArea.fromJson(json["forecast_area"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "class": areaInfoClass,
        "coordinate": coordinate,
        "domain": domain,
        "geometry": geometry,
        "tags": tags,
        "parent_id": parentId,
        "forecast_area": forecastArea.toJson(),
      };
}

class ForecastArea {
  ForecastArea({
    required this.areaId,
    required this.name,
  });

  final String areaId;
  final String name;

  factory ForecastArea.fromJson(Map<String, dynamic> json) => ForecastArea(
        areaId: json["area_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "area_id": areaId,
        "name": name,
      };
}

class WeatherTemperature {
  WeatherTemperature({
    required this.c,
    required this.f,
  });

  final String c;
  final String f;

  factory WeatherTemperature.fromJson(Map<String, dynamic> json) =>
      WeatherTemperature(
        c: json["C"] ?? "",
        f: json["F"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "C": c,
        "F": f,
      };
}

class Humidity {
  Humidity({
    required this.percentage,
  });

  final String percentage;

  factory Humidity.fromJson(Map<String, dynamic> json) => Humidity(
        percentage: json["%"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "%": percentage,
      };
}

class Rain {
  Rain({required this.mm});
  final String mm;
  factory Rain.fromJson(Map<String, dynamic> json) =>
      Rain(mm: json['mm'] ?? "");
  Map<String, dynamic> toJson() => {"mm": mm};
}

class WindSpeed {
  WindSpeed(
      {required this.mph,
      required this.kt,
      required this.ms,
      required this.kph});
  final String kph;
  final String mph;
  final String kt;
  final String ms;
  factory WindSpeed.fromJson(Map<String, dynamic> json) => WindSpeed(
      kph: json['KPH'] ?? "",
      kt: json['kt'] ?? "",
      mph: json['MPH'] ?? "",
      ms: json['MS'] ?? "");
  Map<String, dynamic> toJson() => {"KPH": kph, 'MPH': mph, 'MS': ms, 'kt': kt};
}

class WindDirection {
  WindDirection({
    required this.deg,
    required this.card,
    required this.sexa,
  });
  final String deg;
  final String card;
  final String sexa;

  factory WindDirection.fromJson(Map<String, dynamic> json) => WindDirection(
        deg: json['deg'] ?? "",
        card: json['CARD'] ?? "",
        sexa: json['SEXA'] ?? "",
      );
  Map<String, dynamic> toJson() => {
        "deg": deg,
        'CARD': card,
        'SEXA': sexa,
      };
}
