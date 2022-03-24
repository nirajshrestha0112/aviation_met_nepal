class AirportList {
  AirportList({
    required this.status,
    required this.message,
    required this.data,
  });
   String ?status;
   String ?message;
   List<Data> ?data;
  
  AirportList.fromJson(Map<String, dynamic> json){
    status = json['status']??"";
    message = json['message']??"";
    data = json['data']!=null?List.from(json['data']).map((e)=>Data.fromJson(e)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data?.map((e)=>e.toJson()).toList();
    return _data;
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
  
  Data.fromJson(Map<String, dynamic> json){
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
    final _data = <String, dynamic>{};
    _data['ident'] = ident;
    _data['type'] = type;
    _data['name'] = name;
    _data['elevation_ft'] = elevationFt;
    _data['continent'] = continent;
    _data['iso_country'] = isoCountry;
    _data['iso_region'] = isoRegion;
    _data['municipality'] = municipality;
    _data['gps_code'] = gpsCode;
    _data['iata_code'] = iataCode;
    _data['local_code'] = localCode;
    _data['coordinates'] = coordinates;
    return _data;
  }
}