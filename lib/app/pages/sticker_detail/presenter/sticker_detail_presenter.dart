import 'package:fwc_album_app/app/core/mvp/fwc_presenter.dart';
import 'package:fwc_album_app/app/models/user_sticker_model.dart';
import 'package:fwc_album_app/app/pages/sticker_detail/view/sticker_detail_view.dart';

abstract class StickerDetailPresenter extends FwcPresenter<StickerDetailView> {
  Future<void> load({
    required String countryCode,
    required String countryName,
    required String stickerNumber,
    UserStickerModel? stickerUser,
  });

  Future<void> incrementAmount();
  Future<void> decrementAmount();

  Future<void> saveSticker();
  Future<void> deleteSticker();
}