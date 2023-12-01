import '../../../../export.dart';

final imageRepositoryProvider = Provider<ImageRepository>((ref) {
  final dataSource =
      ImageDataSource(); 
  return ImageRepository(dataSource);
});

final fakeImageListProvider = FutureProvider<List<ImageModel>>((ref) async {
  final repository = ref.read(imageRepositoryProvider);
  return await repository.getImageList();
});
