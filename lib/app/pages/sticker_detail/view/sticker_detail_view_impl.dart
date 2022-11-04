import 'package:flutter/cupertino.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/pages/sticker_detail/sticker_detail_page.dart';

import '../../../core/ui/helpers/messages.dart';
import './sticker_detail_view.dart';

abstract class StickerDetailViewImpl extends State<StickerDetailPage>
    with Messages<StickerDetailPage>, Loader<StickerDetailPage>
    implements StickerDetailView {
  bool hasSticker = false;
  String countryCode = '';
  String countryName = '';
  String stickerNumber = '';
  int amount = 0;

  @override
  void initState() {
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showLoader();
      var arguments = ModalRoute.of(context)?.settings.arguments;

      if (arguments != null && arguments is Map<String, dynamic>) {
        widget.presenter.load(
          countryCode: arguments['countryCode'],
          countryName: arguments['countryName'],
          stickerNumber: arguments['stickerNumber'],
          stickerUser: arguments['stickerUser'],
        );
      } else {
        hideLoader();
        Navigator.of(context).pop();
        showError('Não foi possivel carregar a figurinha');
      }
    });
    super.initState();
  }

  @override
  void screenLoaded(bool hasSticker, String countryCode, String countryName,
      String stickerNumber, int amount) {
    hideLoader();
    setState(() {
      this.hasSticker = hasSticker;
      this.countryCode = countryCode;
      this.countryName = countryName;
      this.stickerNumber = stickerNumber;
      this.amount = amount;
    });
  }

  @override
  void updateAmount(int amount) {
    setState(() {
      this.amount = amount;
    });
  }

  @override
  void saveSuccess() {
    hideLoader();
    Navigator.of(context).pop();
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }
}
