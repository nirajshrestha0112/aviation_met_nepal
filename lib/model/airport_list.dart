class AirportList {
  AirportList({
    required this.status,
    required this.message,
    required this.data,
  });
  String? status;
  String? message;
  List<Data>? data;

  AirportList.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? "";
    message = json['message'] ?? "";
    data = json['data'] != null
        ? List.from(json['data']).map((e) => Data.fromJson(e)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final airportData = <String, dynamic>{};
    airportData['status'] = status;
    airportData['message'] = message;
    airportData['data'] = data?.map((e) => e.toJson()).toList();
    return airportData;
  }
}

class Data {
  Data({
    required this.ident,
    required this.type,
    required this.name,
    required this.elevationFt,
    required this.continent,
    required this.isoCountry,
    required this.isoRegion,
    required this.municipality,
    required this.gpsCode,
    required this.iataCode,
    required this.localCode,
    required this.coordinates,
  });
  late final String ident;
  late final String type;
  late final String name;
  late final String elevationFt;
  late final String continent;
  late final String isoCountry;
  late final String isoRegion;
  late final String municipality;
  late final String gpsCode;
  late final String iataCode;
  late final String localCode;
  late final String coordinates;

  Data.fromJson(Map<String, dynamic> json) {
    ident = json['ident'];
    type = json['type'];
    name = json['name'];
    elevationFt = json['elevation_ft'];
    continent = json['continent'];
    isoCountry = json['iso_country'];
    isoRegion = json['iso_region'];
    municipality = json['municipality'];
    gpsCode = json['gps_code'];
    iataCode = json['iata_code'];
    localCode = json['local_code'];
    coordinates = json['coordinates'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ident'] = ident;
    data['type'] = type;
    data['name'] = name;
    data['elevation_ft'] = elevationFt;
    data['continent'] = continent;
    data['iso_country'] = isoCountry;
    data['iso_region'] = isoRegion;
    data['municipality'] = municipality;
    data['gps_code'] = gpsCode;
    data['iata_code'] = iataCode;
    data['local_code'] = localCode;
    data['coordinates'] = coordinates;
    return data;
  }
}
