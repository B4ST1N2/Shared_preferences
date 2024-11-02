class ApiDataModel {
  final String name;
  final String description;

  ApiDataModel({required this.name, required this.description});

  factory ApiDataModel.fromJson(Map<String, dynamic> json) {
    return ApiDataModel(
      name: json['name'],
      description: json['description'],
    );
  }
}
