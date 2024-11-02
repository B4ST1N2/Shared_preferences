class Data {
  final String name;
  final int population;

  Data({required this.name, required this.population});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      name: json['name']['common'],
      population: json['population'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'population': population,
      };
}
