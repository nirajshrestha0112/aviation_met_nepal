/* class CitiesById {
  CitiesById({
    required this.updates,
    required this.data,
  });
  late final Updates updates;
  late final Data data;
  
  CitiesById.fromJson(Map<String, dynamic> json){
    updates = Updates.fromJson(json['updates']);
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['updates'] = updates.toJson();
    _data['data'] = data.toJson();
    return _data;
  }
}

class Updates {
  Updates({
    required this.forecastBugError.xml,
    required this.forecast.xml,
    required this.forecast-areas.xml,
  });
  late final String forecastBugError.xml;
  late final String forecast.xml;
  late final String forecast-areas.xml;
  
  Updates.fromJson(Map<String, dynamic> json){
    forecastBugError.xml = json['forecast_bug_error.xml'];
    forecast.xml = json['forecast.xml'];
    forecast-areas.xml = json['forecast-areas.xml'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['forecast_bug_error.xml'] = forecastBugError.xml;
    _data['forecast.xml'] = forecast.xml;
    _data['forecast-areas.xml'] = forecast-areas.xml;
    return _data;
  }
}

class Data {
  Data({
    required this.areainfo,
    required this.params,
    required this.warning,
  });
  late final Areainfo areainfo;
  late final Params params;
  late final Warning warning;
  
  Data.fromJson(Map<String, dynamic> json){
    areainfo = Areainfo.fromJson(json['areainfo']);
    params = Params.fromJson(json['params']);
    warning = Warning.fromJson(json['warning']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['areainfo'] = areainfo.toJson();
    _data['params'] = params.toJson();
    _data['warning'] = warning.toJson();
    return _data;
  }
}

class Areainfo {
  Areainfo({
    required this.id,
    required this.description,
    required this.class,
    required this.coordinate,
    required this.domain,
    required this.geometry,
    required this.tags,
     this.parentId,
    required this.forecastArea,
  });
  late final String id;
  late final String description;
  late final String class;
  late final String coordinate;
  late final String domain;
  late final String geometry;
  late final String tags;
  late final Null parentId;
  late final ForecastArea forecastArea;
  
  Areainfo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    description = json['description'];
    class = json['class'];
    coordinate = json['coordinate'];
    domain = json['domain'];
    geometry = json['geometry'];
    tags = json['tags'];
    parentId = json['parent_id'];
    forecastArea = ForecastArea.fromJson(json['forecast_area']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['description'] = description;
    _data['class'] = class;
    _data['coordinate'] = coordinate;
    _data['domain'] = domain;
    _data['geometry'] = geometry;
    _data['tags'] = tags;
    _data['parent_id'] = parentId;
    _data['forecast_area'] = forecastArea.toJson();
    return _data;
  }
}

class ForecastArea {
  ForecastArea({
    required this.areaId,
    required this.name,
  });
  late final String areaId;
  late final String name;
  
  ForecastArea.fromJson(Map<String, dynamic> json){
    areaId = json['area_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['area_id'] = areaId;
    _data['name'] = name;
    return _data;
  }
}

class Params {
  Params({
    required this.st,
    required this.td,
    required this.gust,
    required this.hu,
    required this.rain06h,
    required this.t,
    required this.visibility,
    required this.ww,
    required this.weather,
    required this.ws,
    required this.wd,
    required this.sunset,
    required this.sunrise,
    required this.moonset,
    required this.moonrise,
  });
  late final St st;
  late final Td td;
  late final Gust gust;
  late final Hu hu;
  late final Rain06h rain06h;
  late final T t;
  late final Visibility visibility;
  late final Ww ww;
  late final Weather weather;
  late final Ws ws;
  late final Wd wd;
  late final Sunset sunset;
  late final Sunrise sunrise;
  late final Moonset moonset;
  late final Moonrise moonrise;
  
  Params.fromJson(Map<String, dynamic> json){
    st = St.fromJson(json['st']);
    td = Td.fromJson(json['td']);
    gust = Gust.fromJson(json['gust']);
    hu = Hu.fromJson(json['hu']);
    rain06h = Rain06h.fromJson(json['rain06h']);
    t = T.fromJson(json['t']);
    visibility = Visibility.fromJson(json['visibility']);
    ww = Ww.fromJson(json['ww']);
    weather = Weather.fromJson(json['weather']);
    ws = Ws.fromJson(json['ws']);
    wd = Wd.fromJson(json['wd']);
    sunset = Sunset.fromJson(json['sunset']);
    sunrise = Sunrise.fromJson(json['sunrise']);
    moonset = Moonset.fromJson(json['moonset']);
    moonrise = Moonrise.fromJson(json['moonrise']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['st'] = st.toJson();
    _data['td'] = td.toJson();
    _data['gust'] = gust.toJson();
    _data['hu'] = hu.toJson();
    _data['rain06h'] = rain06h.toJson();
    _data['t'] = t.toJson();
    _data['visibility'] = visibility.toJson();
    _data['ww'] = ww.toJson();
    _data['weather'] = weather.toJson();
    _data['ws'] = ws.toJson();
    _data['wd'] = wd.toJson();
    _data['sunset'] = sunset.toJson();
    _data['sunrise'] = sunrise.toJson();
    _data['moonset'] = moonset.toJson();
    _data['moonrise'] = moonrise.toJson();
    return _data;
  }
}

class St {
  St({
    required this.202204080000,
    required this.202204080600,
    required this.202204081200,
    required this.202204081800,
    required this.202204090000,
    required this.202204090600,
    required this.202204091200,
    required this.202204091800,
    required this.202204100000,
    required this.202204100600,
    required this.202204101200,
    required this.202204101800,
    required this.202204110000,
    required this.description,
  });
  late final 202204080000 202204080000;
  late final 202204080600 202204080600;
  late final 202204081200 202204081200;
  late final 202204081800 202204081800;
  late final 202204090000 202204090000;
  late final 202204090600 202204090600;
  late final 202204091200 202204091200;
  late final 202204091800 202204091800;
  late final 202204100000 202204100000;
  late final 202204100600 202204100600;
  late final 202204101200 202204101200;
  late final 202204101800 202204101800;
  late final 202204110000 202204110000;
  late final String description;
  
  St.fromJson(Map<String, dynamic> json){
    202204080000 = 202204080000.fromJson(json['202204080000']);
    202204080600 = 202204080600.fromJson(json['202204080600']);
    202204081200 = 202204081200.fromJson(json['202204081200']);
    202204081800 = 202204081800.fromJson(json['202204081800']);
    202204090000 = 202204090000.fromJson(json['202204090000']);
    202204090600 = 202204090600.fromJson(json['202204090600']);
    202204091200 = 202204091200.fromJson(json['202204091200']);
    202204091800 = 202204091800.fromJson(json['202204091800']);
    202204100000 = 202204100000.fromJson(json['202204100000']);
    202204100600 = 202204100600.fromJson(json['202204100600']);
    202204101200 = 202204101200.fromJson(json['202204101200']);
    202204101800 = 202204101800.fromJson(json['202204101800']);
    202204110000 = 202204110000.fromJson(json['202204110000']);
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['202204080000'] = 202204080000.toJson();
    _data['202204080600'] = 202204080600.toJson();
    _data['202204081200'] = 202204081200.toJson();
    _data['202204081800'] = 202204081800.toJson();
    _data['202204090000'] = 202204090000.toJson();
    _data['202204090600'] = 202204090600.toJson();
    _data['202204091200'] = 202204091200.toJson();
    _data['202204091800'] = 202204091800.toJson();
    _data['202204100000'] = 202204100000.toJson();
    _data['202204100600'] = 202204100600.toJson();
    _data['202204101200'] = 202204101200.toJson();
    _data['202204101800'] = 202204101800.toJson();
    _data['202204110000'] = 202204110000.toJson();
    _data['description'] = description;
    return _data;
  }
}

class 202204080000 {
  202204080000({
    required this.C,
    required this.F,
  });
  late final String C;
  late final String F;
  
  202204080000.fromJson(Map<String, dynamic> json){
    C = json['C'];
    F = json['F'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['C'] = C;
    _data['F'] = F;
    return _data;
  }
}

class 202204080600 {
  202204080600({
    required this.C,
    required this.F,
  });
  late final String C;
  late final String F;
  
  202204080600.fromJson(Map<String, dynamic> json){
    C = json['C'];
    F = json['F'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['C'] = C;
    _data['F'] = F;
    return _data;
  }
}

class 202204081200 {
  202204081200({
    required this.C,
    required this.F,
  });
  late final String C;
  late final String F;
  
  202204081200.fromJson(Map<String, dynamic> json){
    C = json['C'];
    F = json['F'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['C'] = C;
    _data['F'] = F;
    return _data;
  }
}

class 202204081800 {
  202204081800({
    required this.C,
    required this.F,
  });
  late final String C;
  late final String F;
  
  202204081800.fromJson(Map<String, dynamic> json){
    C = json['C'];
    F = json['F'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['C'] = C;
    _data['F'] = F;
    return _data;
  }
}

class 202204090000 {
  202204090000({
    required this.C,
    required this.F,
  });
  late final String C;
  late final String F;
  
  202204090000.fromJson(Map<String, dynamic> json){
    C = json['C'];
    F = json['F'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['C'] = C;
    _data['F'] = F;
    return _data;
  }
}

class 202204090600 {
  202204090600({
    required this.C,
    required this.F,
  });
  late final String C;
  late final String F;
  
  202204090600.fromJson(Map<String, dynamic> json){
    C = json['C'];
    F = json['F'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['C'] = C;
    _data['F'] = F;
    return _data;
  }
}

class 202204091200 {
  202204091200({
    required this.C,
    required this.F,
  });
  late final String C;
  late final String F;
  
  202204091200.fromJson(Map<String, dynamic> json){
    C = json['C'];
    F = json['F'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['C'] = C;
    _data['F'] = F;
    return _data;
  }
}

class 202204091800 {
  202204091800({
    required this.C,
    required this.F,
  });
  late final String C;
  late final String F;
  
  202204091800.fromJson(Map<String, dynamic> json){
    C = json['C'];
    F = json['F'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['C'] = C;
    _data['F'] = F;
    return _data;
  }
}

class 202204100000 {
  202204100000({
    required this.C,
    required this.F,
  });
  late final String C;
  late final String F;
  
  202204100000.fromJson(Map<String, dynamic> json){
    C = json['C'];
    F = json['F'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['C'] = C;
    _data['F'] = F;
    return _data;
  }
}

class 202204100600 {
  202204100600({
    required this.C,
    required this.F,
  });
  late final String C;
  late final String F;
  
  202204100600.fromJson(Map<String, dynamic> json){
    C = json['C'];
    F = json['F'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['C'] = C;
    _data['F'] = F;
    return _data;
  }
}

class 202204101200 {
  202204101200({
    required this.C,
    required this.F,
  });
  late final String C;
  late final String F;
  
  202204101200.fromJson(Map<String, dynamic> json){
    C = json['C'];
    F = json['F'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['C'] = C;
    _data['F'] = F;
    return _data;
  }
}

class 202204101800 {
  202204101800({
    required this.C,
    required this.F,
  });
  late final String C;
  late final String F;
  
  202204101800.fromJson(Map<String, dynamic> json){
    C = json['C'];
    F = json['F'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['C'] = C;
    _data['F'] = F;
    return _data;
  }
}

class 202204110000 {
  202204110000({
    required this.C,
    required this.F,
  });
  late final String C;
  late final String F;
  
  202204110000.fromJson(Map<String, dynamic> json){
    C = json['C'];
    F = json['F'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['C'] = C;
    _data['F'] = F;
    return _data;
  }
}

class Td {
  Td({
    required this.202204080000,
    required this.202204080600,
    required this.202204081200,
    required this.202204081800,
    required this.202204090000,
    required this.202204090600,
    required this.202204091200,
    required this.202204091800,
    required this.202204100000,
    required this.202204100600,
    required this.202204101200,
    required this.202204101800,
    required this.202204110000,
    required this.description,
  });
  late final 202204080000 202204080000;
  late final 202204080600 202204080600;
  late final 202204081200 202204081200;
  late final 202204081800 202204081800;
  late final 202204090000 202204090000;
  late final 202204090600 202204090600;
  late final 202204091200 202204091200;
  late final 202204091800 202204091800;
  late final 202204100000 202204100000;
  late final 202204100600 202204100600;
  late final 202204101200 202204101200;
  late final 202204101800 202204101800;
  late final 202204110000 202204110000;
  late final String description;
  
  Td.fromJson(Map<String, dynamic> json){
    202204080000 = 202204080000.fromJson(json['202204080000']);
    202204080600 = 202204080600.fromJson(json['202204080600']);
    202204081200 = 202204081200.fromJson(json['202204081200']);
    202204081800 = 202204081800.fromJson(json['202204081800']);
    202204090000 = 202204090000.fromJson(json['202204090000']);
    202204090600 = 202204090600.fromJson(json['202204090600']);
    202204091200 = 202204091200.fromJson(json['202204091200']);
    202204091800 = 202204091800.fromJson(json['202204091800']);
    202204100000 = 202204100000.fromJson(json['202204100000']);
    202204100600 = 202204100600.fromJson(json['202204100600']);
    202204101200 = 202204101200.fromJson(json['202204101200']);
    202204101800 = 202204101800.fromJson(json['202204101800']);
    202204110000 = 202204110000.fromJson(json['202204110000']);
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['202204080000'] = 202204080000.toJson();
    _data['202204080600'] = 202204080600.toJson();
    _data['202204081200'] = 202204081200.toJson();
    _data['202204081800'] = 202204081800.toJson();
    _data['202204090000'] = 202204090000.toJson();
    _data['202204090600'] = 202204090600.toJson();
    _data['202204091200'] = 202204091200.toJson();
    _data['202204091800'] = 202204091800.toJson();
    _data['202204100000'] = 202204100000.toJson();
    _data['202204100600'] = 202204100600.toJson();
    _data['202204101200'] = 202204101200.toJson();
    _data['202204101800'] = 202204101800.toJson();
    _data['202204110000'] = 202204110000.toJson();
    _data['description'] = description;
    return _data;
  }
}

class Gust {
  Gust({
    required this.202204080000,
    required this.202204080600,
    required this.202204081200,
    required this.202204081800,
    required this.202204090000,
    required this.202204090600,
    required this.202204091200,
    required this.202204091800,
    required this.202204100000,
    required this.202204100600,
    required this.202204101200,
    required this.202204101800,
    required this.202204110000,
    required this.description,
  });
  late final 202204080000 202204080000;
  late final 202204080600 202204080600;
  late final 202204081200 202204081200;
  late final 202204081800 202204081800;
  late final 202204090000 202204090000;
  late final 202204090600 202204090600;
  late final 202204091200 202204091200;
  late final 202204091800 202204091800;
  late final 202204100000 202204100000;
  late final 202204100600 202204100600;
  late final 202204101200 202204101200;
  late final 202204101800 202204101800;
  late final 202204110000 202204110000;
  late final String description;
  
  Gust.fromJson(Map<String, dynamic> json){
    202204080000 = 202204080000.fromJson(json['202204080000']);
    202204080600 = 202204080600.fromJson(json['202204080600']);
    202204081200 = 202204081200.fromJson(json['202204081200']);
    202204081800 = 202204081800.fromJson(json['202204081800']);
    202204090000 = 202204090000.fromJson(json['202204090000']);
    202204090600 = 202204090600.fromJson(json['202204090600']);
    202204091200 = 202204091200.fromJson(json['202204091200']);
    202204091800 = 202204091800.fromJson(json['202204091800']);
    202204100000 = 202204100000.fromJson(json['202204100000']);
    202204100600 = 202204100600.fromJson(json['202204100600']);
    202204101200 = 202204101200.fromJson(json['202204101200']);
    202204101800 = 202204101800.fromJson(json['202204101800']);
    202204110000 = 202204110000.fromJson(json['202204110000']);
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['202204080000'] = 202204080000.toJson();
    _data['202204080600'] = 202204080600.toJson();
    _data['202204081200'] = 202204081200.toJson();
    _data['202204081800'] = 202204081800.toJson();
    _data['202204090000'] = 202204090000.toJson();
    _data['202204090600'] = 202204090600.toJson();
    _data['202204091200'] = 202204091200.toJson();
    _data['202204091800'] = 202204091800.toJson();
    _data['202204100000'] = 202204100000.toJson();
    _data['202204100600'] = 202204100600.toJson();
    _data['202204101200'] = 202204101200.toJson();
    _data['202204101800'] = 202204101800.toJson();
    _data['202204110000'] = 202204110000.toJson();
    _data['description'] = description;
    return _data;
  }
}

class Hu {
  Hu({
    required this.202204080000,
    required this.202204080600,
    required this.202204081200,
    required this.202204081800,
    required this.202204090000,
    required this.202204090600,
    required this.202204091200,
    required this.202204091800,
    required this.202204100000,
    required this.202204100600,
    required this.202204101200,
    required this.202204101800,
    required this.202204110000,
    required this.description,
  });
  late final 202204080000 202204080000;
  late final 202204080600 202204080600;
  late final 202204081200 202204081200;
  late final 202204081800 202204081800;
  late final 202204090000 202204090000;
  late final 202204090600 202204090600;
  late final 202204091200 202204091200;
  late final 202204091800 202204091800;
  late final 202204100000 202204100000;
  late final 202204100600 202204100600;
  late final 202204101200 202204101200;
  late final 202204101800 202204101800;
  late final 202204110000 202204110000;
  late final String description;
  
  Hu.fromJson(Map<String, dynamic> json){
    202204080000 = 202204080000.fromJson(json['202204080000']);
    202204080600 = 202204080600.fromJson(json['202204080600']);
    202204081200 = 202204081200.fromJson(json['202204081200']);
    202204081800 = 202204081800.fromJson(json['202204081800']);
    202204090000 = 202204090000.fromJson(json['202204090000']);
    202204090600 = 202204090600.fromJson(json['202204090600']);
    202204091200 = 202204091200.fromJson(json['202204091200']);
    202204091800 = 202204091800.fromJson(json['202204091800']);
    202204100000 = 202204100000.fromJson(json['202204100000']);
    202204100600 = 202204100600.fromJson(json['202204100600']);
    202204101200 = 202204101200.fromJson(json['202204101200']);
    202204101800 = 202204101800.fromJson(json['202204101800']);
    202204110000 = 202204110000.fromJson(json['202204110000']);
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['202204080000'] = 202204080000.toJson();
    _data['202204080600'] = 202204080600.toJson();
    _data['202204081200'] = 202204081200.toJson();
    _data['202204081800'] = 202204081800.toJson();
    _data['202204090000'] = 202204090000.toJson();
    _data['202204090600'] = 202204090600.toJson();
    _data['202204091200'] = 202204091200.toJson();
    _data['202204091800'] = 202204091800.toJson();
    _data['202204100000'] = 202204100000.toJson();
    _data['202204100600'] = 202204100600.toJson();
    _data['202204101200'] = 202204101200.toJson();
    _data['202204101800'] = 202204101800.toJson();
    _data['202204110000'] = 202204110000.toJson();
    _data['description'] = description;
    return _data;
  }
}

class Rain06h {
  Rain06h({
    required this.202204080000,
    required this.202204080600,
    required this.202204081200,
    required this.202204081800,
    required this.202204090000,
    required this.202204090600,
    required this.202204091200,
    required this.202204091800,
    required this.202204100000,
    required this.202204100600,
    required this.202204101200,
    required this.202204101800,
    required this.202204110000,
    required this.description,
  });
  late final 202204080000 202204080000;
  late final 202204080600 202204080600;
  late final 202204081200 202204081200;
  late final 202204081800 202204081800;
  late final 202204090000 202204090000;
  late final 202204090600 202204090600;
  late final 202204091200 202204091200;
  late final 202204091800 202204091800;
  late final 202204100000 202204100000;
  late final 202204100600 202204100600;
  late final 202204101200 202204101200;
  late final 202204101800 202204101800;
  late final 202204110000 202204110000;
  late final String description;
  
  Rain06h.fromJson(Map<String, dynamic> json){
    202204080000 = 202204080000.fromJson(json['202204080000']);
    202204080600 = 202204080600.fromJson(json['202204080600']);
    202204081200 = 202204081200.fromJson(json['202204081200']);
    202204081800 = 202204081800.fromJson(json['202204081800']);
    202204090000 = 202204090000.fromJson(json['202204090000']);
    202204090600 = 202204090600.fromJson(json['202204090600']);
    202204091200 = 202204091200.fromJson(json['202204091200']);
    202204091800 = 202204091800.fromJson(json['202204091800']);
    202204100000 = 202204100000.fromJson(json['202204100000']);
    202204100600 = 202204100600.fromJson(json['202204100600']);
    202204101200 = 202204101200.fromJson(json['202204101200']);
    202204101800 = 202204101800.fromJson(json['202204101800']);
    202204110000 = 202204110000.fromJson(json['202204110000']);
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['202204080000'] = 202204080000.toJson();
    _data['202204080600'] = 202204080600.toJson();
    _data['202204081200'] = 202204081200.toJson();
    _data['202204081800'] = 202204081800.toJson();
    _data['202204090000'] = 202204090000.toJson();
    _data['202204090600'] = 202204090600.toJson();
    _data['202204091200'] = 202204091200.toJson();
    _data['202204091800'] = 202204091800.toJson();
    _data['202204100000'] = 202204100000.toJson();
    _data['202204100600'] = 202204100600.toJson();
    _data['202204101200'] = 202204101200.toJson();
    _data['202204101800'] = 202204101800.toJson();
    _data['202204110000'] = 202204110000.toJson();
    _data['description'] = description;
    return _data;
  }
}

class T {
  T({
    required this.202204080000,
    required this.202204080600,
    required this.202204081200,
    required this.202204081800,
    required this.202204090000,
    required this.202204090600,
    required this.202204091200,
    required this.202204091800,
    required this.202204100000,
    required this.202204100600,
    required this.202204101200,
    required this.202204101800,
    required this.202204110000,
    required this.description,
  });
  late final 202204080000 202204080000;
  late final 202204080600 202204080600;
  late final 202204081200 202204081200;
  late final 202204081800 202204081800;
  late final 202204090000 202204090000;
  late final 202204090600 202204090600;
  late final 202204091200 202204091200;
  late final 202204091800 202204091800;
  late final 202204100000 202204100000;
  late final 202204100600 202204100600;
  late final 202204101200 202204101200;
  late final 202204101800 202204101800;
  late final 202204110000 202204110000;
  late final String description;
  
  T.fromJson(Map<String, dynamic> json){
    202204080000 = 202204080000.fromJson(json['202204080000']);
    202204080600 = 202204080600.fromJson(json['202204080600']);
    202204081200 = 202204081200.fromJson(json['202204081200']);
    202204081800 = 202204081800.fromJson(json['202204081800']);
    202204090000 = 202204090000.fromJson(json['202204090000']);
    202204090600 = 202204090600.fromJson(json['202204090600']);
    202204091200 = 202204091200.fromJson(json['202204091200']);
    202204091800 = 202204091800.fromJson(json['202204091800']);
    202204100000 = 202204100000.fromJson(json['202204100000']);
    202204100600 = 202204100600.fromJson(json['202204100600']);
    202204101200 = 202204101200.fromJson(json['202204101200']);
    202204101800 = 202204101800.fromJson(json['202204101800']);
    202204110000 = 202204110000.fromJson(json['202204110000']);
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['202204080000'] = 202204080000.toJson();
    _data['202204080600'] = 202204080600.toJson();
    _data['202204081200'] = 202204081200.toJson();
    _data['202204081800'] = 202204081800.toJson();
    _data['202204090000'] = 202204090000.toJson();
    _data['202204090600'] = 202204090600.toJson();
    _data['202204091200'] = 202204091200.toJson();
    _data['202204091800'] = 202204091800.toJson();
    _data['202204100000'] = 202204100000.toJson();
    _data['202204100600'] = 202204100600.toJson();
    _data['202204101200'] = 202204101200.toJson();
    _data['202204101800'] = 202204101800.toJson();
    _data['202204110000'] = 202204110000.toJson();
    _data['description'] = description;
    return _data;
  }
}

class Visibility {
  Visibility({
    required this.202204080000,
    required this.202204080600,
    required this.202204081200,
    required this.202204081800,
    required this.202204090000,
    required this.202204090600,
    required this.202204091200,
    required this.202204091800,
    required this.202204100000,
    required this.202204100600,
    required this.202204101800,
    required this.202204110000,
    required this.description,
  });
  late final 202204080000 202204080000;
  late final 202204080600 202204080600;
  late final 202204081200 202204081200;
  late final 202204081800 202204081800;
  late final 202204090000 202204090000;
  late final 202204090600 202204090600;
  late final 202204091200 202204091200;
  late final 202204091800 202204091800;
  late final 202204100000 202204100000;
  late final 202204100600 202204100600;
  late final 202204101800 202204101800;
  late final 202204110000 202204110000;
  late final String description;
  
  Visibility.fromJson(Map<String, dynamic> json){
    202204080000 = 202204080000.fromJson(json['202204080000']);
    202204080600 = 202204080600.fromJson(json['202204080600']);
    202204081200 = 202204081200.fromJson(json['202204081200']);
    202204081800 = 202204081800.fromJson(json['202204081800']);
    202204090000 = 202204090000.fromJson(json['202204090000']);
    202204090600 = 202204090600.fromJson(json['202204090600']);
    202204091200 = 202204091200.fromJson(json['202204091200']);
    202204091800 = 202204091800.fromJson(json['202204091800']);
    202204100000 = 202204100000.fromJson(json['202204100000']);
    202204100600 = 202204100600.fromJson(json['202204100600']);
    202204101800 = 202204101800.fromJson(json['202204101800']);
    202204110000 = 202204110000.fromJson(json['202204110000']);
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['202204080000'] = 202204080000.toJson();
    _data['202204080600'] = 202204080600.toJson();
    _data['202204081200'] = 202204081200.toJson();
    _data['202204081800'] = 202204081800.toJson();
    _data['202204090000'] = 202204090000.toJson();
    _data['202204090600'] = 202204090600.toJson();
    _data['202204091200'] = 202204091200.toJson();
    _data['202204091800'] = 202204091800.toJson();
    _data['202204100000'] = 202204100000.toJson();
    _data['202204100600'] = 202204100600.toJson();
    _data['202204101800'] = 202204101800.toJson();
    _data['202204110000'] = 202204110000.toJson();
    _data['description'] = description;
    return _data;
  }
}

class Ww {
  Ww({
    required this.202204080000,
    required this.202204080600,
    required this.202204081200,
    required this.202204081800,
    required this.202204090000,
    required this.202204090600,
    required this.202204091200,
    required this.202204091800,
    required this.202204100000,
    required this.202204100600,
    required this.202204101200,
    required this.202204101800,
    required this.description,
  });
  late final 202204080000 202204080000;
  late final 202204080600 202204080600;
  late final 202204081200 202204081200;
  late final 202204081800 202204081800;
  late final 202204090000 202204090000;
  late final 202204090600 202204090600;
  late final 202204091200 202204091200;
  late final 202204091800 202204091800;
  late final 202204100000 202204100000;
  late final 202204100600 202204100600;
  late final 202204101200 202204101200;
  late final 202204101800 202204101800;
  late final String description;
  
  Ww.fromJson(Map<String, dynamic> json){
    202204080000 = 202204080000.fromJson(json['202204080000']);
    202204080600 = 202204080600.fromJson(json['202204080600']);
    202204081200 = 202204081200.fromJson(json['202204081200']);
    202204081800 = 202204081800.fromJson(json['202204081800']);
    202204090000 = 202204090000.fromJson(json['202204090000']);
    202204090600 = 202204090600.fromJson(json['202204090600']);
    202204091200 = 202204091200.fromJson(json['202204091200']);
    202204091800 = 202204091800.fromJson(json['202204091800']);
    202204100000 = 202204100000.fromJson(json['202204100000']);
    202204100600 = 202204100600.fromJson(json['202204100600']);
    202204101200 = 202204101200.fromJson(json['202204101200']);
    202204101800 = 202204101800.fromJson(json['202204101800']);
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['202204080000'] = 202204080000.toJson();
    _data['202204080600'] = 202204080600.toJson();
    _data['202204081200'] = 202204081200.toJson();
    _data['202204081800'] = 202204081800.toJson();
    _data['202204090000'] = 202204090000.toJson();
    _data['202204090600'] = 202204090600.toJson();
    _data['202204091200'] = 202204091200.toJson();
    _data['202204091800'] = 202204091800.toJson();
    _data['202204100000'] = 202204100000.toJson();
    _data['202204100600'] = 202204100600.toJson();
    _data['202204101200'] = 202204101200.toJson();
    _data['202204101800'] = 202204101800.toJson();
    _data['description'] = description;
    return _data;
  }
}

class Weather {
  Weather({
    required this.202204080000,
    required this.202204080600,
    required this.202204081200,
    required this.202204081800,
    required this.202204090000,
    required this.202204090600,
    required this.202204091200,
    required this.202204091800,
    required this.202204100000,
    required this.202204100600,
    required this.202204101200,
    required this.202204101800,
    required this.description,
  });
  late final 202204080000 202204080000;
  late final 202204080600 202204080600;
  late final 202204081200 202204081200;
  late final 202204081800 202204081800;
  late final 202204090000 202204090000;
  late final 202204090600 202204090600;
  late final 202204091200 202204091200;
  late final 202204091800 202204091800;
  late final 202204100000 202204100000;
  late final 202204100600 202204100600;
  late final 202204101200 202204101200;
  late final 202204101800 202204101800;
  late final String description;
  
  Weather.fromJson(Map<String, dynamic> json){
    202204080000 = 202204080000.fromJson(json['202204080000']);
    202204080600 = 202204080600.fromJson(json['202204080600']);
    202204081200 = 202204081200.fromJson(json['202204081200']);
    202204081800 = 202204081800.fromJson(json['202204081800']);
    202204090000 = 202204090000.fromJson(json['202204090000']);
    202204090600 = 202204090600.fromJson(json['202204090600']);
    202204091200 = 202204091200.fromJson(json['202204091200']);
    202204091800 = 202204091800.fromJson(json['202204091800']);
    202204100000 = 202204100000.fromJson(json['202204100000']);
    202204100600 = 202204100600.fromJson(json['202204100600']);
    202204101200 = 202204101200.fromJson(json['202204101200']);
    202204101800 = 202204101800.fromJson(json['202204101800']);
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['202204080000'] = 202204080000.toJson();
    _data['202204080600'] = 202204080600.toJson();
    _data['202204081200'] = 202204081200.toJson();
    _data['202204081800'] = 202204081800.toJson();
    _data['202204090000'] = 202204090000.toJson();
    _data['202204090600'] = 202204090600.toJson();
    _data['202204091200'] = 202204091200.toJson();
    _data['202204091800'] = 202204091800.toJson();
    _data['202204100000'] = 202204100000.toJson();
    _data['202204100600'] = 202204100600.toJson();
    _data['202204101200'] = 202204101200.toJson();
    _data['202204101800'] = 202204101800.toJson();
    _data['description'] = description;
    return _data;
  }
}

class Ws {
  Ws({
    required this.202204080000,
    required this.202204080600,
    required this.202204081200,
    required this.202204081800,
    required this.202204090000,
    required this.202204090600,
    required this.202204091200,
    required this.202204091800,
    required this.202204100000,
    required this.202204100600,
    required this.202204101200,
    required this.202204101800,
    required this.202204110000,
    required this.description,
  });
  late final 202204080000 202204080000;
  late final 202204080600 202204080600;
  late final 202204081200 202204081200;
  late final 202204081800 202204081800;
  late final 202204090000 202204090000;
  late final 202204090600 202204090600;
  late final 202204091200 202204091200;
  late final 202204091800 202204091800;
  late final 202204100000 202204100000;
  late final 202204100600 202204100600;
  late final 202204101200 202204101200;
  late final 202204101800 202204101800;
  late final 202204110000 202204110000;
  late final String description;
  
  Ws.fromJson(Map<String, dynamic> json){
    202204080000 = 202204080000.fromJson(json['202204080000']);
    202204080600 = 202204080600.fromJson(json['202204080600']);
    202204081200 = 202204081200.fromJson(json['202204081200']);
    202204081800 = 202204081800.fromJson(json['202204081800']);
    202204090000 = 202204090000.fromJson(json['202204090000']);
    202204090600 = 202204090600.fromJson(json['202204090600']);
    202204091200 = 202204091200.fromJson(json['202204091200']);
    202204091800 = 202204091800.fromJson(json['202204091800']);
    202204100000 = 202204100000.fromJson(json['202204100000']);
    202204100600 = 202204100600.fromJson(json['202204100600']);
    202204101200 = 202204101200.fromJson(json['202204101200']);
    202204101800 = 202204101800.fromJson(json['202204101800']);
    202204110000 = 202204110000.fromJson(json['202204110000']);
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['202204080000'] = 202204080000.toJson();
    _data['202204080600'] = 202204080600.toJson();
    _data['202204081200'] = 202204081200.toJson();
    _data['202204081800'] = 202204081800.toJson();
    _data['202204090000'] = 202204090000.toJson();
    _data['202204090600'] = 202204090600.toJson();
    _data['202204091200'] = 202204091200.toJson();
    _data['202204091800'] = 202204091800.toJson();
    _data['202204100000'] = 202204100000.toJson();
    _data['202204100600'] = 202204100600.toJson();
    _data['202204101200'] = 202204101200.toJson();
    _data['202204101800'] = 202204101800.toJson();
    _data['202204110000'] = 202204110000.toJson();
    _data['description'] = description;
    return _data;
  }
}

class Wd {
  Wd({
    required this.202204080000,
    required this.202204080600,
    required this.202204081200,
    required this.202204081800,
    required this.202204090000,
    required this.202204090600,
    required this.202204091200,
    required this.202204091800,
    required this.202204100000,
    required this.202204100600,
    required this.202204101200,
    required this.202204101800,
    required this.202204110000,
    required this.description,
  });
  late final 202204080000 202204080000;
  late final 202204080600 202204080600;
  late final 202204081200 202204081200;
  late final 202204081800 202204081800;
  late final 202204090000 202204090000;
  late final 202204090600 202204090600;
  late final 202204091200 202204091200;
  late final 202204091800 202204091800;
  late final 202204100000 202204100000;
  late final 202204100600 202204100600;
  late final 202204101200 202204101200;
  late final 202204101800 202204101800;
  late final 202204110000 202204110000;
  late final String description;
  
  Wd.fromJson(Map<String, dynamic> json){
    202204080000 = 202204080000.fromJson(json['202204080000']);
    202204080600 = 202204080600.fromJson(json['202204080600']);
    202204081200 = 202204081200.fromJson(json['202204081200']);
    202204081800 = 202204081800.fromJson(json['202204081800']);
    202204090000 = 202204090000.fromJson(json['202204090000']);
    202204090600 = 202204090600.fromJson(json['202204090600']);
    202204091200 = 202204091200.fromJson(json['202204091200']);
    202204091800 = 202204091800.fromJson(json['202204091800']);
    202204100000 = 202204100000.fromJson(json['202204100000']);
    202204100600 = 202204100600.fromJson(json['202204100600']);
    202204101200 = 202204101200.fromJson(json['202204101200']);
    202204101800 = 202204101800.fromJson(json['202204101800']);
    202204110000 = 202204110000.fromJson(json['202204110000']);
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['202204080000'] = 202204080000.toJson();
    _data['202204080600'] = 202204080600.toJson();
    _data['202204081200'] = 202204081200.toJson();
    _data['202204081800'] = 202204081800.toJson();
    _data['202204090000'] = 202204090000.toJson();
    _data['202204090600'] = 202204090600.toJson();
    _data['202204091200'] = 202204091200.toJson();
    _data['202204091800'] = 202204091800.toJson();
    _data['202204100000'] = 202204100000.toJson();
    _data['202204100600'] = 202204100600.toJson();
    _data['202204101200'] = 202204101200.toJson();
    _data['202204101800'] = 202204101800.toJson();
    _data['202204110000'] = 202204110000.toJson();
    _data['description'] = description;
    return _data;
  }
}

class Sunset {
  Sunset({
    required this.times,
  });
  late final Times times;
  
  Sunset.fromJson(Map<String, dynamic> json){
    times = Times.fromJson(json['times']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['times'] = times.toJson();
    return _data;
  }
}

class Times {
  Times({
    required this.20220407,
    required this.20220408,
    required this.20220409,
    required this.20220410,
    required this.20220411,
    required this.20220412,
    required this.20220413,
    required this.20220414,
    required this.20220415,
  });
  late final String 20220407;
  late final String 20220408;
  late final String 20220409;
  late final String 20220410;
  late final String 20220411;
  late final String 20220412;
  late final String 20220413;
  late final String 20220414;
  late final String 20220415;
  
  Times.fromJson(Map<String, dynamic> json){
    20220407 = json['20220407'];
    20220408 = json['20220408'];
    20220409 = json['20220409'];
    20220410 = json['20220410'];
    20220411 = json['20220411'];
    20220412 = json['20220412'];
    20220413 = json['20220413'];
    20220414 = json['20220414'];
    20220415 = json['20220415'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['20220407'] = 20220407;
    _data['20220408'] = 20220408;
    _data['20220409'] = 20220409;
    _data['20220410'] = 20220410;
    _data['20220411'] = 20220411;
    _data['20220412'] = 20220412;
    _data['20220413'] = 20220413;
    _data['20220414'] = 20220414;
    _data['20220415'] = 20220415;
    return _data;
  }
}

class Sunrise {
  Sunrise({
    required this.times,
  });
  late final Times times;
  
  Sunrise.fromJson(Map<String, dynamic> json){
    times = Times.fromJson(json['times']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['times'] = times.toJson();
    return _data;
  }
}

class Moonset {
  Moonset({
    required this.times,
  });
  late final Times times;
  
  Moonset.fromJson(Map<String, dynamic> json){
    times = Times.fromJson(json['times']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['times'] = times.toJson();
    return _data;
  }
}

class Moonrise {
  Moonrise({
    required this.times,
  });
  late final Times times;
  
  Moonrise.fromJson(Map<String, dynamic> json){
    times = Times.fromJson(json['times']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['times'] = times.toJson();
    return _data;
  }
}

class Warning {
  Warning({
    required this.level,
    required this.levelName,
    required this.paramId,
    required this.paramName,
    required this.areaName,
    required this.areaId,
  });
  late final String level;
  late final String levelName;
  late final String paramId;
  late final String paramName;
  late final String areaName;
  late final String areaId;
  
  Warning.fromJson(Map<String, dynamic> json){
    level = json['level'];
    levelName = json['level_name'];
    paramId = json['param_id'];
    paramName = json['param_name'];
    areaName = json['area_name'];
    areaId = json['area_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['level'] = level;
    _data['level_name'] = levelName;
    _data['param_id'] = paramId;
    _data['param_name'] = paramName;
    _data['area_name'] = areaName;
    _data['area_id'] = areaId;
    return _data;
  }
} */
