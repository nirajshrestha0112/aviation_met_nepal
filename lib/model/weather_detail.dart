import 'dart:convert';

class WeatherForecast {
  WeatherForecast({
    required this.updates,
    required this.data,
  });

  final Updates updates;
  final Data data;

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      WeatherForecast(
        updates: Updates.fromJson(json["updates"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "updates": updates.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.areainfo,
    required this.params,
    required this.warning,
  });

  final Areainfo areainfo;
  final Map<String, dynamic> params;
  final Warning warning;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        areainfo: Areainfo.fromJson(json["areainfo"]),
        params: json["params"],
        warning: Warning.fromJson(json["warning"]),
      );

  Map<String, dynamic> toJson() => {
        "areainfo": areainfo.toJson(),
        // "params": params.toString(),
        "warning": warning.toJson(),
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

class Warning {
  Warning({
    required this.level,
    required this.levelName,
    required this.areaId,
    required this.areaName,
  });

  final int level;
  final String levelName;
  final String areaId;
  final String areaName;

  factory Warning.fromJson(Map<String, dynamic> json) => Warning(
        level: json["level"],
        levelName: json["level_name"],
        areaId: json["area_id"],
        areaName: json["area_name"],
      );

  Map<String, dynamic> toJson() => {
        "level": level,
        "level_name": levelName,
        "area_id": areaId,
        "area_name": areaName,
      };
}

class Updates {
  Updates({
    required this.forecastBugErrorXml,
    required this.forecastXml,
    required this.forecastAreasXml,
  });

  final DateTime forecastBugErrorXml;
  final DateTime forecastXml;
  final DateTime forecastAreasXml;

  factory Updates.fromJson(Map<String, dynamic> json) => Updates(
        forecastBugErrorXml: DateTime.parse(json["forecast_bug_error.xml"]),
        forecastXml: DateTime.parse(json["forecast.xml"]),
        forecastAreasXml: DateTime.parse(json["forecast-areas.xml"]),
      );

  Map<String, dynamic> toJson() => {
        "forecast_bug_error.xml": forecastBugErrorXml.toIso8601String(),
        "forecast.xml": forecastXml.toIso8601String(),
        "forecast-areas.xml": forecastAreasXml.toIso8601String(),
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
        c: json["C"],
        f: json["F"],
      );

  Map<String, dynamic> toJson() => {
        "C": c,
        "F": f,
      };
}

void main() {
  parseJson();
}

void parseJson() async {
  const jsonData = '''
  {
    "updates": {
        "forecast_bug_error.xml": "2021-05-18 10:49:34",
        "forecast.xml": "2022-04-11 02:51:04",
        "forecast-areas.xml": "1970-01-01 00:00:00"
    },
    "data": {
        "areainfo": {
            "id": "4991",
            "description": "Kathmandu",
            "class": "land",
            "coordinate": "27.6936341445 85.28928868211",
            "domain": "Nepal",
            "geometry": "area",
            "tags": "",
            "parent_id": null,
            "forecast_area": {
                "area_id": "4991",
                "name": "Kathmandu"
            }
        },
        "params": {
            "st": {
                "202204110000": {
                    "C": "18",
                    "F": "64.4"
                },
                "202204110600": {
                    "C": "21",
                    "F": "69.8"
                },
                "202204111200": {
                    "C": "21",
                    "F": "69.8"
                },
                "202204111800": {
                    "C": "15",
                    "F": "59"
                },
                "202204120000": {
                    "C": "14",
                    "F": "57.2"
                },
                "202204120600": {
                    "C": "14",
                    "F": "57.2"
                },
                "202204121200": {
                    "C": "14",
                    "F": "57.2"
                },
                "202204121800": {
                    "C": "18",
                    "F": "64.4"
                },
                "202204130000": {
                    "C": "18",
                    "F": "64.4"
                },
                "202204130600": {
                    "C": "24",
                    "F": "75.2"
                },
                "202204131200": {
                    "C": "24.69792352",
                    "F": "76.456262336"
                },
                "202204131800": {
                    "C": "19",
                    "F": "66.2"
                },
                "description": "Apparent Temperature"
            },
            "td": {
                "202204110000": {
                    "C": "2.328352249075",
                    "F": "36.191034048335"
                },
                "202204110600": {
                    "C": "-11.73561786028",
                    "F": "10.875887851496"
                },
                "202204111200": {
                    "C": "-11.73561786028",
                    "F": "10.875887851496"
                },
                "202204111800": {
                    "C": "-16.324679482048",
                    "F": "2.6155769323136"
                },
                "202204120000": {
                    "C": "-17.092159032121",
                    "F": "1.2341137421822"
                },
                "202204120600": {
                    "C": "-17.092159032121",
                    "F": "1.2341137421822"
                },
                "202204121200": {
                    "C": "10.60783471354",
                    "F": "51.094102484372"
                },
                "202204121800": {
                    "C": "14.499739587519",
                    "F": "58.099531257534"
                },
                "202204130000": {
                    "C": "14.499739587519",
                    "F": "58.099531257534"
                },
                "202204130600": {
                    "C": "20.334462802543",
                    "F": "68.602033044577"
                },
                "202204131200": {
                    "C": "22.278535320328",
                    "F": "72.10136357659"
                },
                "202204131800": {
                    "C": "15.472454561226",
                    "F": "59.850418210207"
                },
                "description": "Dew point"
            },
            "gust": {
                "202204110000": {
                    "kt": "65",
                    "MPH": "74.80066425",
                    "KPH": "120.38",
                    "MS": "33.43888886"
                },
                "202204110600": {
                    "kt": "40",
                    "MPH": "46.031178",
                    "KPH": "74.08",
                    "MS": "20.57777776"
                },
                "202204111200": {
                    "kt": "40",
                    "MPH": "46.031178",
                    "KPH": "74.08",
                    "MS": "20.57777776"
                },
                "202204111800": {
                    "kt": "40",
                    "MPH": "46.031178",
                    "KPH": "74.08",
                    "MS": "20.57777776"
                },
                "202204120000": {
                    "kt": "40",
                    "MPH": "46.031178",
                    "KPH": "74.08",
                    "MS": "20.57777776"
                },
                "202204120600": {
                    "kt": "40",
                    "MPH": "46.031178",
                    "KPH": "74.08",
                    "MS": "20.57777776"
                },
                "202204121200": {
                    "kt": "25",
                    "MPH": "28.76948625",
                    "KPH": "46.3",
                    "MS": "12.8611111"
                },
                "202204121800": {
                    "kt": "25",
                    "MPH": "28.76948625",
                    "KPH": "46.3",
                    "MS": "12.8611111"
                },
                "202204130000": {
                    "kt": "25",
                    "MPH": "28.76948625",
                    "KPH": "46.3",
                    "MS": "12.8611111"
                },
                "202204130600": {
                    "kt": "25",
                    "MPH": "28.76948625",
                    "KPH": "46.3",
                    "MS": "12.8611111"
                },
                "202204131200": {
                    "kt": "25",
                    "MPH": "28.76948625",
                    "KPH": "46.3",
                    "MS": "12.8611111"
                },
                "202204131800": {
                    "kt": "25",
                    "MPH": "28.76948625",
                    "KPH": "46.3",
                    "MS": "12.8611111"
                },
                "description": "Gusts"
            },
            "hu": {
                "202204110000": {
                    "%": "35"
                },
                "202204110600": {
                    "%": "10"
                },
                "202204111200": {
                    "%": "10"
                },
                "202204111800": {
                    "%": "10"
                },
                "202204120000": {
                    "%": "10"
                },
                "202204120600": {
                    "%": "10"
                },
                "202204121200": {
                    "%": "80"
                },
                "202204121800": {
                    "%": "80"
                },
                "202204130000": {
                    "%": "80"
                },
                "202204130600": {
                    "%": "80"
                },
                "202204131200": {
                    "%": "80"
                },
                "202204131800": {
                    "%": "80"
                },
                "description": "Humidity"
            },
            "rain06h": {
                "202204110000": {
                    "mm": "0"
                },
                "202204110600": {
                    "mm": "0"
                },
                "202204111200": {
                    "mm": "0"
                },
                "202204111800": {
                    "mm": "0"
                },
                "202204120000": {
                    "mm": "0"
                },
                "202204120600": {
                    "mm": "0"
                },
                "202204121200": {
                    "mm": "0"
                },
                "202204121800": {
                    "mm": "0"
                },
                "202204130000": {
                    "mm": "0"
                },
                "202204130600": {
                    "mm": "0"
                },
                "202204131200": {
                    "mm": "0"
                },
                "202204131800": {
                    "mm": "0"
                },
                "description": "Rain accumulation 06h"
            },
            "t": {
                "202204110000": {
                    "C": "18",
                    "F": "64.4"
                },
                "202204110600": {
                    "C": "21",
                    "F": "69.8"
                },
                "202204111200": {
                    "C": "21",
                    "F": "69.8"
                },
                "202204111800": {
                    "C": "15",
                    "F": "59"
                },
                "202204120000": {
                    "C": "14",
                    "F": "57.2"
                },
                "202204120600": {
                    "C": "14",
                    "F": "57.2"
                },
                "202204121200": {
                    "C": "14",
                    "F": "57.2"
                },
                "202204121800": {
                    "C": "18",
                    "F": "64.4"
                },
                "202204130000": {
                    "C": "18",
                    "F": "64.4"
                },
                "202204130600": {
                    "C": "24",
                    "F": "75.2"
                },
                "202204131200": {
                    "C": "26",
                    "F": "78.8"
                },
                "202204131800": {
                    "C": "19",
                    "F": "66.2"
                },
                "description": "Temperature"
            },
            "visibility": {
                "202204110000": {
                    "m": "24135",
                    "FT": "79162.8"
                },
                "202204110600": {
                    "m": "24139",
                    "FT": "79175.92"
                },
                "description": "Visibility"
            },
            "ww": {
                "202204110000": {
                    "code": "2"
                },
                "202204110600": {
                    "code": "4"
                },
                "202204111200": {
                    "code": "2"
                },
                "202204111800": {
                    "code": "3"
                },
                "202204120000": {
                    "code": "2"
                },
                "202204120600": {
                    "code": "10"
                },
                "202204121200": {
                    "code": "10"
                },
                "202204121800": {
                    "code": "10"
                },
                "202204130000": {
                    "code": "10"
                },
                "202204130600": {
                    "code": "10"
                },
                "202204131200": {
                    "code": "31"
                },
                "202204131800": {
                    "code": "0"
                },
                "description": "Weather"
            },
            "weather": {
                "202204110000": {
                    "description": null,
                    "icon": "2"
                },
                "202204110600": {
                    "description": null,
                    "icon": "4"
                },
                "202204111200": {
                    "description": null,
                    "icon": "2"
                },
                "202204111800": {
                    "description": null,
                    "icon": "3"
                },
                "202204120000": {
                    "description": null,
                    "icon": "2"
                },
                "202204120600": {
                    "description": "Mist",
                    "icon": "10"
                },
                "202204121200": {
                    "description": "Mist",
                    "icon": "10"
                },
                "202204121800": {
                    "description": "Mist",
                    "icon": "10"
                },
                "202204130000": {
                    "description": "Mist",
                    "icon": "10"
                },
                "202204130600": {
                    "description": "Mist",
                    "icon": "10"
                },
                "202204131200": {
                    "description": null,
                    "icon": "31"
                },
                "202204131800": {
                    "description": null,
                    "icon": "0"
                },
                "description": "Weather 2"
            },
            "ws": {
                "202204110000": {
                    "kt": "40",
                    "MPH": "46.031178",
                    "KPH": "74.08",
                    "MS": "20.57777776"
                },
                "202204110600": {
                    "kt": "30",
                    "MPH": "34.5233835",
                    "KPH": "55.56",
                    "MS": "15.43333332"
                },
                "202204111200": {
                    "kt": "30",
                    "MPH": "34.5233835",
                    "KPH": "55.56",
                    "MS": "15.43333332"
                },
                "202204111800": {
                    "kt": "30",
                    "MPH": "34.5233835",
                    "KPH": "55.56",
                    "MS": "15.43333332"
                },
                "202204120000": {
                    "kt": "30",
                    "MPH": "34.5233835",
                    "KPH": "55.56",
                    "MS": "15.43333332"
                },
                "202204120600": {
                    "kt": "30",
                    "MPH": "34.5233835",
                    "KPH": "55.56",
                    "MS": "15.43333332"
                },
                "202204121200": {
                    "kt": "30",
                    "MPH": "34.5233835",
                    "KPH": "55.56",
                    "MS": "15.43333332"
                },
                "202204121800": {
                    "kt": "20",
                    "MPH": "23.015589",
                    "KPH": "37.04",
                    "MS": "10.28888888"
                },
                "202204130000": {
                    "kt": "20",
                    "MPH": "23.015589",
                    "KPH": "37.04",
                    "MS": "10.28888888"
                },
                "202204130600": {
                    "kt": "20",
                    "MPH": "23.015589",
                    "KPH": "37.04",
                    "MS": "10.28888888"
                },
                "202204131200": {
                    "kt": "20",
                    "MPH": "23.015589",
                    "KPH": "37.04",
                    "MS": "10.28888888"
                },
                "202204131800": {
                    "kt": "20",
                    "MPH": "23.015589",
                    "KPH": "37.04",
                    "MS": "10.28888888"
                },
                "description": "Wind 10m"
            },
            "wd": {
                "202204110000": {
                    "deg": "22.5",
                    "CARD": "NNE",
                    "SEXA": "2230"
                },
                "202204110600": {
                    "deg": "22.5",
                    "CARD": "NNE",
                    "SEXA": "2230"
                },
                "202204111200": {
                    "deg": "22.5",
                    "CARD": "NNE",
                    "SEXA": "2230"
                },
                "202204111800": {
                    "deg": "22.5",
                    "CARD": "NNE",
                    "SEXA": "2230"
                },
                "202204120000": {
                    "deg": "22.5",
                    "CARD": "NNE",
                    "SEXA": "2230"
                },
                "202204120600": {
                    "deg": "22.5",
                    "CARD": "NNE",
                    "SEXA": "2230"
                },
                "202204121200": {
                    "deg": "22.5",
                    "CARD": "NNE",
                    "SEXA": "2230"
                },
                "202204121800": {
                    "deg": "202.5",
                    "CARD": "SSW",
                    "SEXA": "20230"
                },
                "202204130000": {
                    "deg": "202.5",
                    "CARD": "SSW",
                    "SEXA": "20230"
                },
                "202204130600": {
                    "deg": "202.5",
                    "CARD": "SSW",
                    "SEXA": "20230"
                },
                "202204131200": {
                    "deg": "202.5",
                    "CARD": "SSW",
                    "SEXA": "20230"
                },
                "202204131800": {
                    "SEXA": "20230",
                    "deg": "202.5",
                    "CARD": "SSW"
                },
                "description": "Wind direction"
            },
            "sunset": {
                "times": {
                    "20220411": "12:38",
                    "20220412": "12:39",
                    "20220413": "12:39",
                    "20220414": "12:40",
                    "20220415": "12:40",
                    "20220416": "12:41",
                    "20220417": "12:41",
                    "20220418": "12:42",
                    "20220410": "12:38"
                }
            },
            "sunrise": {
                "times": {
                    "20220411": "00:01",
                    "20220412": "00:00",
                    "20220413": "23:59",
                    "20220414": "23:57",
                    "20220415": "23:56",
                    "20220416": "23:55",
                    "20220417": "23:54",
                    "20220418": "23:53",
                    "20220410": "00:02"
                }
            },
            "moonset": {
                "times": {
                    "20220411": "21:22",
                    "20220412": "21:58",
                    "20220413": "22:31",
                    "20220414": "23:04",
                    "20220415": "23:37",
                    "20220417": "00:11",
                    "20220418": "00:50",
                    "20220410": "20:43"
                }
            },
            "moonrise": {
                "times": {
                    "20220411": "07:26",
                    "20220412": "08:23",
                    "20220413": "09:22",
                    "20220414": "10:21",
                    "20220415": "11:21",
                    "20220416": "12:23",
                    "20220417": "13:28",
                    "20220418": "14:35",
                    "20220410": "06:28"
                }
            }
        },
        "warning": {
            "level": 1,
            "level_name": "No Alert",
            "area_id": "4914",
            "area_name": "Kathmandu"
        }
    }
}
  
  ''';
  final parsedData = jsonDecode(jsonData);
  WeatherForecast weatherForecast = WeatherForecast.fromJson(parsedData);
  Map<String, dynamic> tempJsonObject = weatherForecast.data.params['st'];
  Map<String, dynamic> rainProabObject =
      weatherForecast.data.params['rain06h'] ??
          weatherForecast.data.params['proba_rain'];

  tempJsonObject.remove('description');
  List<String> dateList = tempJsonObject.keys.toList(); // TODO: parse as a date
  List<WeatherTemperature> weatherTemperatureList = tempJsonObject.entries
      .map((entry) => WeatherTemperature.fromJson(entry.value))
      .toList();

  print(dateList.last);
  print(weatherTemperatureList.last.c);
}
