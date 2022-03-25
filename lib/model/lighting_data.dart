import 'dart:convert';

// LightingData lightingDataFromJson(String str) =>
//     LightingData.fromJson(json.decode(str));
//
// String lightingDataToJson(LightingData data) => json.encode(data.toJson());

class LightingData {
  LightingData({
    required this.status,
    required this.data,
  });

  final bool status;
  final List<List<Datum>> data;

  factory LightingData.fromJson(Map<String, dynamic> json) => LightingData(
        status: json["status"] ?? false,
        data: List<List<Datum>>.from(json["data"]
            .map((x) => List<Datum>.from(x.map((x) => Datum.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(
            data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class Datum {
  Datum({
    required this.date,
    required this.latitude,
    required this.longitude,
    required this.type,
    required this.amplitude,
    required this.height,
    required this.locationError,
  });

  final String date;
  final String latitude;
  final String longitude;
  final String type;
  final String amplitude;
  final String height;
  final String locationError;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        date: json["date"] ?? '',
        latitude: json["latitude"] ?? '',
        longitude: json["longitude"] ?? '',
        type: json["type"] ?? '',
        amplitude: json["amplitude"] ?? '',
        height: json["height"] ?? '',
        locationError: json["location_error"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "latitude": latitude,
        "longitude": longitude,
        "type": type,
        "amplitude": amplitude,
        "height": height,
        "location_error": locationError,
      };
}

void parseJson() async {
  final jsonData = '{}';
  final parsedData = jsonDecode(jsonData);
  List<Datum> datumList = [];
  List<List<Datum>> data = LightingData.fromJson(parsedData).data;
  for (var d in data) {
    datumList += d;
  }
  int count = 1;
  for (var d in datumList) {
    print(count);
    count++;
    print(d.longitude);
    print(d.latitude);
  }
}

///TODO: please remove _model from every model filename and class name.
