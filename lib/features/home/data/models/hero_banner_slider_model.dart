class HeroBannerSliderModel {
  final String id;
  final String photoUrl;
  final String description;
  final String brandId;
  final String category;

  HeroBannerSliderModel({
    required this.id,
    required this.photoUrl,
    required this.description,
    required this.brandId,
    required this.category,
  });

  factory HeroBannerSliderModel.fromJson(Map<String, dynamic> jsonData) {
    return HeroBannerSliderModel(
      id: jsonData['_id'] ?? '',
      photoUrl: jsonData['photo_url'] ?? '',
      description: jsonData['description'] ?? '',
      brandId: jsonData['brand'] ?? '',
      category: jsonData['category'] ?? '',
    );
  }
}
