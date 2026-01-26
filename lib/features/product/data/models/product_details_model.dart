class ProductDetailsModel {
  final String id;
  final String title;
  final String description;
  final int? currentPrice;
  final List<String> photoUrls;
  final List<String> sizes;
  final List<String> colors;

  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.currentPrice,
    required this.photoUrls,
    required this.sizes,
    required this.colors,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductDetailsModel(
      id: jsonData['_id'] ?? '',
      title: jsonData['title'] ?? 'Placeholder Title',
      description: jsonData['description'] ?? 'Placeholder Description',
      currentPrice: jsonData['current_price'] ?? 0,
      photoUrls: jsonData['photos'].cast<String>() ?? [""],
      sizes: jsonData['sizes'].cast<String>() ?? [],
      colors: jsonData['colors'].cast<String>() ?? [],
    );
  }
}
