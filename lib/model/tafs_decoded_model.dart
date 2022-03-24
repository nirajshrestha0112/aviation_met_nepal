class TafsDataDecoded {
  String ?status;
  Data ?data;

  TafsDataDecoded({this.status, this.data});

  TafsDataDecoded.fromJson(Map<String, dynamic> json) {
    status = json['status']??"";
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  List<String>? date;
  Decoded ?decoded;

  Data({this.date, this.decoded});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['Date'].cast<String>();
    decoded =
        json['Decoded'] != null ? Decoded.fromJson(json['Decoded']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Date'] = date;
    if (decoded != null) {
      data['Decoded'] = decoded?.toJson();
    }
    return data;
  }
}

class Decoded {
  List<String>? tAFFor;
  List<String>? text;
  List<String>? forecastPeriod;
  List<String>? forecastType;
  List<String>? winds;
  List<String>? visibility;
  List<String>? clouds;
  List<String>? weather;

  Decoded(
      {this.tAFFor,
      this.text,
      this.forecastPeriod,
      this.forecastType,
      this.winds,
      this.visibility,
      this.clouds,
      this.weather});

  Decoded.fromJson(Map<String, dynamic> json) {
    tAFFor = json['TAF for:'].cast<String>();
    text = json['Text:'].cast<String>();
    forecastPeriod = json['Forecast period:'].cast<String>();
    forecastType = json['Forecast type:'].cast<String>();
    winds = json['Winds:'].cast<String>();
    visibility = json['Visibility:'].cast<String>();
    clouds = json['Clouds:'].cast<String>();
    weather = json['Weather:'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['TAF for:'] = tAFFor;
    data['Text:'] = text;
    data['Forecast period:'] = forecastPeriod;
    data['Forecast type:'] = forecastType;
    data['Winds:'] = winds;
    data['Visibility:'] = visibility;
    data['Clouds:'] = clouds;
    data['Weather:'] = weather;
    return data;
  }
}
