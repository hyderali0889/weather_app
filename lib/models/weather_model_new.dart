class WeatherModel {
 late Location location;
 late Current current;
 late Forecast forecast;

  WeatherModel({required this.location, required this.current, required this.forecast});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    location = (json['location'] != null
        ? Location.fromJson(json['location'])
        : null)!;
    current =
        (json['current'] != null ? Current.fromJson(json['current']) : null)!;
    forecast = (json['forecast'] != null
        ? Forecast.fromJson(json['forecast'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location'] = location.toJson();
    data['current'] = current.toJson();
    data['forecast'] = forecast.toJson();
    return data;
  }
}

class Location {
 late String name;
 late String region;
 late String country;
 late num lat;
 late num lon;
 late String tzId;
 late num localtimeEpoch;
 late String localtime;

  Location(
      {
     required   this.name,
     required this.region,
     required this.country,
     required this.lat,
     required this.lon,
     required this.tzId,
     required this.localtimeEpoch,
     required this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['region'] = region;
    data['country'] = country;
    data['lat'] = lat;
    data['lon'] = lon;
    data['tz_id'] = tzId;
    data['localtime_epoch'] = localtimeEpoch;
    data['localtime'] = localtime;
    return data;
  }
}

class Current {
 late num lastUpdatedEpoch;
 late String lastUpdated;
 late num tempC;
 late num tempF;
 late num isDay;
 late Condition condition;
 late num windMph;
 late num windKph;
 late num windDegree;
 late String windDir;
 late num pressureMb;
 late num pressureIn;
 late num precipMm;
 late num precipIn;
 late num humidity;
 late num cloud;
 late num feelslikeC;
 late num feelslikeF;
 late num visKm;
 late num visMiles;
 late num uv;
 late num gustMph;
 late num gustKph;

  Current(
      {
    required   this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph});

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = json['last_updated_epoch'];
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition = (json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null)!;
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    precipMm = json['precip_mm'];
    precipIn = json['precip_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    visKm = json['vis_km'];
    visMiles = json['vis_miles'];
    uv = json['uv'];
    gustMph = json['gust_mph'];
    gustKph = json['gust_kph'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_updated_epoch'] = lastUpdatedEpoch;
    data['last_updated'] = lastUpdated;
    data['temp_c'] = tempC;
    data['temp_f'] = tempF;
    data['is_day'] = isDay;
    data['condition'] = condition.toJson();
    data['wind_mph'] = windMph;
    data['wind_kph'] = windKph;
    data['wind_degree'] = windDegree;
    data['wind_dir'] = windDir;
    data['pressure_mb'] = pressureMb;
    data['pressure_in'] = pressureIn;
    data['precip_mm'] = precipMm;
    data['precip_in'] = precipIn;
    data['humidity'] = humidity;
    data['cloud'] = cloud;
    data['feelslike_c'] = feelslikeC;
    data['feelslike_f'] = feelslikeF;
    data['vis_km'] = visKm;
    data['vis_miles'] = visMiles;
    data['uv'] = uv;
    data['gust_mph'] = gustMph;
    data['gust_kph'] = gustKph;
    return data;
  }
}

class Condition {
 late String text;
 late String icon;
 late num code;

  Condition({required this.text, required this.icon, required this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['icon'] = icon;
    data['code'] = code;
    return data;
  }
}

class Forecast {
  late List<Forecastday> forecastday;

  Forecast({required this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        forecastday.add(Forecastday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['forecastday'] = forecastday.map((v) => v.toJson()).toList();
    return data;
  }
}

class Forecastday {
 late String date;
 late num dateEpoch;
 late Day day;
 late Astro astro;
 late List<Hour> hour;

  Forecastday({
  required this.date,
  required this.dateEpoch,
  required this.day,
  required  this.astro,
  required   this.hour});

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = (json['day'] != null ? Day.fromJson(json['day']) : null)!;
    astro = (json['astro'] != null ? Astro.fromJson(json['astro']) : null)!;
    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour.add(Hour.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['date'] = date;
    data['date_epoch'] = dateEpoch;
    data['day'] = day.toJson();
    data['astro'] = astro.toJson();
    data['hour'] = hour.map((v) => v.toJson()).toList();
    return data;
  }
}

class Day {
 late num maxtempC;
 late num maxtempF;
 late num mintempC;
 late num mintempF;
 late num avgtempC;
 late num avgtempF;
 late num maxwindMph;
 late num maxwindKph;
 late num totalprecipMm;
 late num totalprecipIn;
 late num totalsnowCm;
 late num avgvisKm;
 late num avgvisMiles;
 late num avghumidity;
 late num dailyWillItRain;
 late num dailyChanceOfRain;
 late num dailyWillItSnow;
 late num dailyChanceOfSnow;
 late Condition condition;
 late num uv;

  Day(
      {
    required   this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv});

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'];
    maxtempF = json['maxtemp_f'];
    mintempC = json['mintemp_c'];
    mintempF = json['mintemp_f'];
    avgtempC = json['avgtemp_c'];
    avgtempF = json['avgtemp_f'];
    maxwindMph = json['maxwind_mph'];
    maxwindKph = json['maxwind_kph'];
    totalprecipMm = json['totalprecip_mm'];
    totalprecipIn = json['totalprecip_in'];
    totalsnowCm = json['totalsnow_cm'];
    avgvisKm = json['avgvis_km'];
    avgvisMiles = json['avgvis_miles'];
    avghumidity = json['avghumidity'];
    dailyWillItRain = json['daily_will_it_rain'];
    dailyChanceOfRain = json['daily_chance_of_rain'];
    dailyWillItSnow = json['daily_will_it_snow'];
    dailyChanceOfSnow = json['daily_chance_of_snow'];
    condition = (json['condition'] != null
        ?  Condition.fromJson(json['condition'])
        : null)!;
    uv = json['uv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maxtemp_c'] = maxtempC;
    data['maxtemp_f'] = maxtempF;
    data['mintemp_c'] = mintempC;
    data['mintemp_f'] = mintempF;
    data['avgtemp_c'] = avgtempC;
    data['avgtemp_f'] = avgtempF;
    data['maxwind_mph'] = maxwindMph;
    data['maxwind_kph'] = maxwindKph;
    data['totalprecip_mm'] = totalprecipMm;
    data['totalprecip_in'] = totalprecipIn;
    data['totalsnow_cm'] = totalsnowCm;
    data['avgvis_km'] = avgvisKm;
    data['avgvis_miles'] = avgvisMiles;
    data['avghumidity'] = avghumidity;
    data['daily_will_it_rain'] = dailyWillItRain;
    data['daily_chance_of_rain'] = dailyChanceOfRain;
    data['daily_will_it_snow'] = dailyWillItSnow;
    data['daily_chance_of_snow'] = dailyChanceOfSnow;
    data['condition'] = condition.toJson();
    data['uv'] = uv;
    return data;
  }
}

class Astro {
 late String sunrise;
 late String sunset;
 late String moonrise;
 late String moonset;
 late String moonPhase;
 late String moonIllumination;

  Astro(
      {
     required   this.sunrise,
     required this.sunset,
     required this.moonrise,
     required this.moonset,
     required this.moonPhase,
     required this.moonIllumination});

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    moonIllumination = json['moon_illumination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['moonrise'] = moonrise;
    data['moonset'] = moonset;
    data['moon_phase'] = moonPhase;
    data['moon_illumination'] = moonIllumination;
    return data;
  }
}

class Hour {
late  num timeEpoch;
late  String time;
late  double tempC;
late  double tempF;
late  num isDay;
late  Condition condition;
late  double windMph;
late  double windKph;
late  num windDegree;
late  String windDir;
late  num pressureMb;
late  double pressureIn;
late  double precipMm;
late  double precipIn;
late  num humidity;
late  num cloud;
late  double feelslikeC;
late  double feelslikeF;
late  double windchillC;
late  double windchillF;
late  double heatindexC;
late  double heatindexF;
late  double dewpointC;
late  double dewpointF;
late  num willItRain;
late  num chanceOfRain;
late  num willItSnow;
late  num chanceOfSnow;
late  num visKm;
late  num visMiles;
late  double gustMph;
late  double gustKph;
late  num uv;

  Hour(
      {
    required  this.timeEpoch,
    required  this.time,
    required  this.tempC,
    required  this.tempF,
    required  this.isDay,
    required  this.condition,
    required  this.windMph,
    required  this.windKph,
    required  this.windDegree,
    required  this.windDir,
    required  this.pressureMb,
    required  this.pressureIn,
    required  this.precipMm,
    required  this.precipIn,
    required  this.humidity,
    required  this.cloud,
    required  this.feelslikeC,
    required  this.feelslikeF,
    required  this.windchillC,
    required  this.windchillF,
    required  this.heatindexC,
    required  this.heatindexF,
    required  this.dewpointC,
    required  this.dewpointF,
    required  this.willItRain,
    required  this.chanceOfRain,
    required  this.willItSnow,
    required  this.chanceOfSnow,
    required  this.visKm,
    required  this.visMiles,
    required  this.gustMph,
    required  this.gustKph,
    required  this.uv});

  Hour.fromJson(Map<String, dynamic> json) {
    timeEpoch = json['time_epoch'];
    time = json['time'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition = (json['condition'] != null
        ?  Condition.fromJson(json['condition'])
        : null)!;
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    precipMm = json['precip_mm'];
    precipIn = json['precip_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    windchillC = json['windchill_c'];
    windchillF = json['windchill_f'];
    heatindexC = json['heatindex_c'];
    heatindexF = json['heatindex_f'];
    dewpointC = json['dewpoint_c'];
    dewpointF = json['dewpoint_f'];
    willItRain = json['will_it_rain'];
    chanceOfRain = json['chance_of_rain'];
    willItSnow = json['will_it_snow'];
    chanceOfSnow = json['chance_of_snow'];
    visKm = json['vis_km'];
    visMiles = json['vis_miles'];
    gustMph = json['gust_mph'];
    gustKph = json['gust_kph'];
    uv = json['uv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time_epoch'] = timeEpoch;
    data['time'] = time;
    data['temp_c'] = tempC;
    data['temp_f'] = tempF;
    data['is_day'] = isDay;
    data['condition'] = condition.toJson();
    data['wind_mph'] = windMph;
    data['wind_kph'] = windKph;
    data['wind_degree'] = windDegree;
    data['wind_dir'] = windDir;
    data['pressure_mb'] = pressureMb;
    data['pressure_in'] = pressureIn;
    data['precip_mm'] = precipMm;
    data['precip_in'] = precipIn;
    data['humidity'] = humidity;
    data['cloud'] = cloud;
    data['feelslike_c'] = feelslikeC;
    data['feelslike_f'] = feelslikeF;
    data['windchill_c'] = windchillC;
    data['windchill_f'] = windchillF;
    data['heatindex_c'] = heatindexC;
    data['heatindex_f'] = heatindexF;
    data['dewpoint_c'] = dewpointC;
    data['dewpoint_f'] = dewpointF;
    data['will_it_rain'] = willItRain;
    data['chance_of_rain'] = chanceOfRain;
    data['will_it_snow'] = willItSnow;
    data['chance_of_snow'] = chanceOfSnow;
    data['vis_km'] = visKm;
    data['vis_miles'] = visMiles;
    data['gust_mph'] = gustMph;
    data['gust_kph'] = gustKph;
    data['uv'] = uv;
    return data;
  }
}
