import '../../models/sticker_model.dart';

abstract class FindStickerService {
  Future<StickerModel> execute(String countryName, String stickerNumber);
}
