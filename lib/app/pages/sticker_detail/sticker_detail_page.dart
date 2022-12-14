// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/rounded_button.dart';
import 'package:fwc_album_app/app/pages/sticker_detail/presenter/sticker_detail_presenter.dart';
import 'package:fwc_album_app/app/pages/sticker_detail/view/sticker_detail_view_impl.dart';

import '../../core/ui/widgets/button.dart';

class StickerDetailPage extends StatefulWidget {
  StickerDetailPresenter presenter;

  StickerDetailPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<StickerDetailPage> createState() => _StickerDetailPageState();
}

class _StickerDetailPageState extends StickerDetailViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe Figurinha'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(hasSticker
                  ? 'assets/images/sticker.png'
                  : 'assets/images/sticker_pb.png'),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      '$countryCode $stickerNumber',
                      style: context.textStyles.textPrimaryFontBold
                          .copyWith(fontSize: 22),
                    ),
                  ),
                  const Spacer(),
                  RoundedButton(
                      icon: Icons.remove,
                      onPressed: widget.presenter.decrementAmount),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      '$amount',
                      style: context.textStyles.textSecondaryFontMedium,
                    ),
                  ),
                  RoundedButton(
                      icon: Icons.add,
                      onPressed: widget.presenter.incrementAmount),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                child: Text(
                  countryName,
                  style: context.textStyles.textPrimaryFontRegular,
                ),
              ),
              Button.primary(
                label:
                    hasSticker ? 'Atualizar figurinha' : 'Adicionar figurinha',
                width: MediaQuery.of(context).size.width * .9,
                onPressed: widget.presenter.saveSticker,
              ),
              Button(
                onPressed: widget.presenter.deleteSticker,
                width: MediaQuery.of(context).size.width * .9,
                label: 'Excluir figurinha',
                outline: true,
                style: context.buttonStyles.primaryOutlineButton,
                labelStyle:
                    context.textStyles.textSecondaryFontExtraBoldPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
