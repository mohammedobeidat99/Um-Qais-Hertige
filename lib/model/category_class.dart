// Define your data model
class Category {
  final String name;
  final List<ImageModel> images;

  Category({required this.name, required this.images});
}

class ImageModel {
  final String imageUrl;

  ImageModel({required this.imageUrl});
}