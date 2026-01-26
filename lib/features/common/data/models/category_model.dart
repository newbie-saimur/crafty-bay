class CategoryModel {
  final String id;
  final String title;
  final String description;
  final String iconUrl;

  CategoryModel({
    required this.id,
    required this.title,
    required this.description,
    required this.iconUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
      id: jsonData['_id'] ?? '',
      title: jsonData['title'] ?? '',
      description: jsonData['description'] ?? '',
      iconUrl: jsonData['icon'] ?? '',
    );
  }

  factory CategoryModel.fromIdAndTitle({required String id, required String title}) {
    return CategoryModel(
      id: id,
      title: title,
      description: '',
      iconUrl: '',
    );
  }
}
