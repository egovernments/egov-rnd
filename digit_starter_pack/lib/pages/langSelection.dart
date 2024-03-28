import 'package:auto_route/auto_route.dart';
import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:digit_components/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_digit_app/blocs/app_init.dart';
import 'package:new_digit_app/blocs/app_localization.dart';
import '../blocs/localization.dart';
import '../routes/routes.dart';
import '../utils/i18_key_constants.dart' as i18;

class SelectLanguageScreen extends StatelessWidget {
  SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: context.read<AppInitialization>().state.maybeWhen(
            orElse: () => const CircularProgressIndicator(),
            initialized: (appConfig, serviceRegList) {
              final languages = appConfig.appConfig!.appConfig?[0].languages;
              return BlocBuilder<LocalizationBloc, LocalizationState>(
                builder: (context, locState) =>
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  DigitLanguageCard(
                    // Provide language items to display in DigitRowCardItems
                    digitRowCardItems: languages!.map((e) {
                      return DigitRowCardModel(
                        label: e.label,
                        value: e.value,
                        // Check if the language is selected based on the current locale
                        isSelected:
                            e.value == context.read<LocalizationBloc>().locale,
                      );
                    }).toList(),
                    // Define callback function for language change
                    onLanguageChange: (rowCardValue) {
                      // Dispatch localization event to select the new locale
                      context.read<LocalizationBloc>().add(
                            LocalizationEvent.onSelect(
                              locale: rowCardValue.value,
                              moduleList: appConfig
                                  .appConfig!.appConfig?[0].backendInterface,
                            ),
                          );
                    },
                    // Define callback function for language submission
                    onLanguageSubmit: () {
                      // Navigate to the LoginRoute upon language submission
                      context.navigateTo(LoginRoute());
                    },
                    // Define label for language submission button
                    languageSubmitLabel: AppLocalizations.of(context)
                        .translate(i18.common.coreCommonContinue),
                  ),
                ]),
              );
            }));
  }
}
