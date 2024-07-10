import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:um_qais/constant/colors.dart';
import 'package:um_qais/model/category_class.dart';

import '../../constant/list.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainColor,
        title: const Text(
          'Gallery',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryItem(category: category);
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(category.name,style: TextStyle(color: MainColor),),
      children: [
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: category.images.map((image) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        FullScreenImagePage(imageUrl: image.imageUrl),
                  ),
                );
              },
              onLongPress: () {
                _showDownloadDialog(context, image.imageUrl);
              },
              child: Hero(
                tag: image.imageUrl,
                child: Image.asset(
                  image.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  void _showDownloadDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: MainColor2,
          title: const Text(
            "Download Image",
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            "Do you want to download this image?",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () async {
                // Perform download action here
                await _saveImage(imageUrl);
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Image saved to gallery")),
                );
              },
              child: const Text(
                "Download",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _saveImage(String imageUrl) async {
    final ByteData bytes = await rootBundle.load(imageUrl);
    final Uint8List data = bytes.buffer.asUint8List();
    await ImageGallerySaver.saveImage(data);
  }
}

class FullScreenImagePage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImagePage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(249, 249, 250, 250),
      appBar: AppBar(
        backgroundColor: MainColor,
      ),
      body: Center(
        child: Hero(
          tag: imageUrl,
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
