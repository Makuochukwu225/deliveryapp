import '../../../../export.dart';

final imageRepositoryProvider = Provider<ImageRepository>((ref) {
  final dataSource = ImageDataSource();
  return ImageRepository(dataSource);
});

final imageListProvider = FutureProvider<List<ImageModel>>((ref) async {
  final repository = ref.read(imageRepositoryProvider);
  return await repository.getImageList();
});
