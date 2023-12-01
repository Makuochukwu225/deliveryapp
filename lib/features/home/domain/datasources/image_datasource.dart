import '../../../../export.dart';

class ImageDataSource {
  Future<List<ImageModel>> fetchImageList() async {
    // Simulated network call
    await Future.delayed(const Duration(seconds: 15));

    // Simulated response data
    final List<ImageModel> imgList = [
      ImageModel(id: 1, imagePath: 'assets/images/bicycle.png'),
      ImageModel(id: 2, imagePath: 'assets/images/bicycle.png'),
      ImageModel(id: 3, imagePath: 'assets/images/bicycle.png'),
      ImageModel(id: 4, imagePath: 'assets/images/bicycle.png'),
      
    ];

    return imgList;
  }
}
