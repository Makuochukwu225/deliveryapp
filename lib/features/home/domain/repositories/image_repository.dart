import '../../../../export.dart';


class ImageRepository {
  final ImageDataSource dataSource;

  ImageRepository(this.dataSource);

  Future<List<ImageModel>> getImageList() async {
    return await dataSource.fetchImageList();
  }
}
