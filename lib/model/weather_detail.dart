

class WeatherForecast {
  WeatherForecast({
    // required this.updates,
    required this.data,
  });

  // final Updates updates;
  final Data data;

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      WeatherForecast(
        // updates: Updates.fromJson(json["updates"] ?? {}),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        // "updates": updates.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.areainfo,
    required this.params,
    // required this.warning,
  });

  final Areainfo areainfo;
  final Map<String, dynamic> params;
  // final Warning warning;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        areainfo: Areainfo.fromJson(json["areainfo"]),
        params: json["params"],
        // warning: Warning.fromJson(json["warning"]),
      );

  Map<String, dynamic> toJson() => {
        "areainfo": areainfo.toJson(),
        "params": params.toString(),
        // "warning": warning.toJson(),
      };
}

class Areainfo {
  Areainfo({
    required this.id,
    required this.description,
    required this.areainfoClass,
    required this.coordinate,
    required this.domain,
    required this.geometry,
    required this.tags,
    required this.parentId,
    required this.forecastArea,
  });

  final String id;
  final String description;
  final String areainfoClass;
  final String coordinate;
  final String domain;
  final String geometry;
  final String tags;
  final dynamic parentId;
  final ForecastArea forecastArea;

  factory Areainfo.fromJson(Map<String, dynamic> json) => Areainfo(
        id: json["id"],
        description: json["description"],
        areainfoClass: json["class"],
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
        "class": areainfoClass,
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

// class Warning {
//   Warning({
//     required this.level,
//     required this.levelName,
//     required this.areaId,
//     required this.areaName,
//   });

//   final String level;
//   final String levelName;
//   final String areaId;
//   final String areaName;

//   factory Warning.fromJson(Map<String, dynamic> json) => Warning(
//         level: json["level"],
//         levelName: json["level_name"],
//         areaId: json["area_id"],
//         areaName: json["area_name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "level": level,
//         "level_name": levelName,
//         "area_id": areaId,
//         "area_name": areaName,
//       };
// }

// class Updates {
//   Updates({
//     required this.forecastBugErrorXml,
//     required this.forecastXml,
//     required this.forecastAreasXml,
//   });

//   final DateTime forecastBugErrorXml;
//   final DateTime forecastXml;
//   final DateTime forecastAreasXml;

//   factory Updates.fromJson(Map<String, dynamic> json) => Updates(
//         forecastBugErrorXml: DateTime.parse(json["forecast_bug_error.xml"]),
//         forecastXml: DateTime.parse(json["forecast.xml"]),
//         forecastAreasXml: DateTime.parse(json["forecast-areas.xml"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "forecast_bug_error.xml": forecastBugErrorXml.toIso8601String(),
//         "forecast.xml": forecastXml.toIso8601String(),
//         "forecast-areas.xml": forecastAreasXml.toIso8601String(),
//       };
// }

class WeatherTemperature {
  WeatherTemperature({
    required this.c,
    required this.f,
  });

  final String c;
  final String f;

  factory WeatherTemperature.fromJson(Map<String, dynamic> json) =>
      WeatherTemperature(
        c: json["C"]??"",
        f: json["F"]??"",
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
        percentage: json["%"]??"",
      );

  Map<String, dynamic> toJson() => {
        "%": percentage,
      };
}

class Rain {
  Rain({required this.mm});
  final String mm;
  factory Rain.fromJson(Map<String, dynamic> json) => Rain(mm: json['mm']??"");
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
      kph: json['KPH']??"", kt: json['kt']??"", mph: json['MPH']??"", ms: json['MS']??"");
  Map<String, dynamic> toJson() => {"KPH": kph, 'MPH': mph, 'MS': ms, 'kt': kt};
}

class WindDirection {
  WindDirection(
      {required this.deg,
      required this.card,
      required this.sexa,
      });
  final String deg;
  final String card;
  final String sexa;
 
  factory WindDirection.fromJson(Map<String, dynamic> json) => WindDirection(
      deg: json['deg']??"", card: json['CARD']??"", sexa: json['SEXA']??"",);
       Map<String, dynamic> toJson() => {"deg": deg, 'CARD': card, 'SEXA': sexa,};
}
