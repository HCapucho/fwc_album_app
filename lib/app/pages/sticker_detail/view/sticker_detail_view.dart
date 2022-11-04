abstract class StickerDetailView {
  void screenLoaded(bool hasSticker, String countryCode, String countryName,
      String stickerNumber, int amount);

  void updateAmount(int i);

  void showLoader();

  void saveSuccess();

  void error(String message);
}
