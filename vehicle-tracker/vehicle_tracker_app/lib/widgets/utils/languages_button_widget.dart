import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:digit_components/widgets/digit_row_card/digit_row_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../util/i18n_translations.dart';

class LanguageButtonsWidget extends StatelessWidget {
  final bool bottomPadding;
  final bool isSideBar;
  const LanguageButtonsWidget({
    required this.bottomPadding,
    required this.isSideBar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 20,
          bottom: bottomPadding ? 0 : 20,
          left: isSideBar ? 0 : 8,
          right: isSideBar ? 0 : 8),
      child: DigitRowCard(
          rowItems: [
            DigitRowCardModel(
                label: AppTranslation.ODIA.tr,
                value: ORI_LOCALE.languageCode,
                isSelected: Get.locale == ORI_LOCALE),
            DigitRowCardModel(
                label: AppTranslation.ENGLISH.tr,
                value: ENG_LOCALE.languageCode,
                isSelected: Get.locale == ENG_LOCALE),
          ],
          width: isSideBar
              ? ((MediaQuery.of(context).size.width * 0.56 / 2) - (4 * 2))
              : ((MediaQuery.of(context).size.width * 0.76 / 2)),
          onChanged: (selectedModel) {
            if (selectedModel.value == ORI_LOCALE.languageCode) {
              Get.updateLocale(ORI_LOCALE);
            } else {
              Get.updateLocale(ENG_LOCALE);
            }
          }),
    );
  }
}
