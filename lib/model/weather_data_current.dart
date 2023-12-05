class WeatherDataCurrent {
  final Current current;
  WeatherDataCurrent({required this.current});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(current: Current.fromJson(json['current']));
}

class Current {
  int? temp;
  num? humidity;
  num? clouds;
  double? uvIndex;
  num? feelsLike;
  double? windSpeed;
  List<Weather>? weather;

  Current({
    this.temp,
    this.humidity,
    this.clouds,
    this.windSpeed,
    this.weather,
    this.uvIndex,
    this.feelsLike,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        temp: (json['temp'] as num?)?.round(),
        feelsLike: num.tryParse(json['feels_like'].toString()),
        humidity: num.tryParse(json['humidity'].toString()),
        uvIndex: (json['uvi'] as num?)?.toDouble(),
        clouds: num.tryParse(json['clouds'].toString()),
        windSpeed: double.tryParse(json['wind_speed'].toString()),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        if (temp != null) 'temp': temp,
        if (feelsLike != null) 'feels_like': feelsLike,
        if (humidity != null) 'humidity': humidity,
        'uvi': uvIndex,
        if (clouds != null) 'clouds': clouds,
        if (windSpeed != null) 'wind_speed': windSpeed,
        if (weather != null)
          'weather': weather?.map((e) => e.toJson()).toList(),
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  // from json
  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'] as int?,
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}
