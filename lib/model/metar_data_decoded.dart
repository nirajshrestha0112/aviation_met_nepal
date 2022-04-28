class MetarDataDecoded {
  MetarDataDecoded({
    required this.status,
    required this.data,
  });
  String? status;
  Data? data;

  MetarDataDecoded.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? "";
    // data = Data.fromJson(json['data']);
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Data({
    required this.date,
    required this.decoded,
  });
  late final List<String> date;
  Decoded? decoded;

  Data.fromJson(Map<String, dynamic> json) {
    date = json['Date'] != null
        ? List.castFrom<dynamic, String>(json['Date'])
        : [];
    decoded =
        json['Decoded'] != null ? Decoded.fromJson(json['Decoded']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Date'] = date;
    data['Decoded'] = decoded!.toJson();
    return data;
  }
}

class Decoded {
  Decoded({
    required this.metarFor,
    required this.text,
    required this.temperature,
    required this.dewpoint,
    required this.pressureAltimeter,
    required this.winds,
    required this.visibility,
    required this.ceiling,
    required this.clouds,
  });
  late final List<String> metarFor;
  late final List<String> text;
  late final List<String> temperature;
  late final List<String> dewpoint;
  late final List<String> pressureAltimeter;
  late final List<String> winds;
  late final List<String> visibility;
  late final List<String> ceiling;
  late final List<String> clouds;

  Decoded.fromJson(Map<String, dynamic> json) {
    metarFor = json['METAR for:'] != null
        ? List.castFrom<dynamic, String>(json['METAR for:'])
        : [];
    text = json['Text:'] != null
        ? List.castFrom<dynamic, String>(json['Text:'])
        : [];
    temperature = json['Temperature:'] != null
        ? List.castFrom<dynamic, String>(json['Temperature:'])
        : [];
    dewpoint = json['Dewpoint:'] != null
        ? List.castFrom<dynamic, String>(json['Dewpoint:'])
        : [];
    pressureAltimeter = json['Pressure (altimeter):'] != null
        ? List.castFrom<dynamic, String>(json['Pressure (altimeter):'])
        : [];
    winds = json['Winds:'] != null
        ? List.castFrom<dynamic, String>(json['Winds:'])
        : [];
    visibility = json['Visibility:'] != null
        ? List.castFrom<dynamic, String>(json['Visibility:'])
        : [];
    ceiling = json['Ceiling:'] != null
        ? List.castFrom<dynamic, String>(json['Ceiling:'])
        : [];
    clouds = json['Clouds:'] != null
        ? List.castFrom<dynamic, String>(json['Clouds:'])
        : [];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['METAR for:'] = metarFor;
    data['Text:'] = text;
    data['Temperature:'] = temperature;
    data['Dewpoint:'] = dewpoint;
    data['Pressure (altimeter):'] = pressureAltimeter;
    data['Winds:'] = winds;
    data['Visibility:'] = visibility;
    data['Ceiling:'] = ceiling;
    data['Clouds:'] = clouds;
    return data;
  }
}
