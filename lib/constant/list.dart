import 'package:um_qais/constant/image.dart';
import 'package:um_qais/model/category_class.dart';

const List<String> imageUrls = [
  Imageback2,
  Imageback2,
  Imageback3,
  // Add more image URLs here
];
// Sample data
List<Category> categories = [
  Category(
    name: 'Umm Qais view',
    images: [
      ImageModel(imageUrl:Imageview ),
      ImageModel(imageUrl: Imageview2),
      ImageModel(imageUrl: Imageback3),
      ImageModel(imageUrl: Imageview3),
    ],
  ),
  Category(
    name: 'The church',
    images: [
       ImageModel(imageUrl: Imageback1),
      ImageModel(imageUrl: Imageback2),
    ],
  ),

  Category(
    name: 'Umm Qais amphitheater',
    images: [
       ImageModel(imageUrl: Imageintro1),
      ImageModel(imageUrl: Imageintro3),
      ImageModel(imageUrl: Imageintro2),
    ],
  ),

   Category(
    name: 'Entrance and gates of Umm Qais',
    images: [
       ImageModel(imageUrl: Imageback1),
      ImageModel(imageUrl: Imageback2),
    ],
  ),

  Category(
    name: 'Trenches and coffins',
    images: [
       ImageModel(imageUrl: Imageback1),
      ImageModel(imageUrl: Imageback2),
    ],
  ),

  Category(
    name: 'The museum',
    images: [
       ImageModel(imageUrl: Imagemuseum1),
      ImageModel(imageUrl: Imagemuseum2),
            ImageModel(imageUrl: Imagemuseum3),
                  ImageModel(imageUrl: Imagemuseum4),


    ],
  ),
];