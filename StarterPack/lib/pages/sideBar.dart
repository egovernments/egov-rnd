import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_digit_app/blocs/app_init.dart';
import 'package:new_digit_app/blocs/app_localization.dart';
import 'package:new_digit_app/blocs/authbloc.dart';
import 'package:new_digit_app/blocs/localization.dart';
import 'package:new_digit_app/pages/profile.dart';
import 'package:new_digit_app/routes/routes.dart';
import '../utils/i18_key_constants.dart' as i18;

class SideBar extends StatelessWidget {
  SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                color: theme.colorScheme.secondary.withOpacity(0.12),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: state.maybeWhen(
                      orElse: () => const Offstage(),
                      // orElse: () => const Text('Side Bar could not load'),
                      authenticated: (accessToken, refreshToken, userRequest) {
                        return Column(
                          children: [
                            Text(
                              userRequest!.userName!,
                              style: theme.textTheme.displayMedium,
                            ),
                            Text(
                              userRequest.mobileNumber!,
                              style: theme.textTheme.displayMedium,
                            ),
                          ],
                        );
                      }),
                )),
            DigitIconTile(
              title: AppLocalizations.of(context).translate(
                i18.common.coreCommonHome,
              ),
              icon: Icons.home,
              onPressed: () {
                // Navigator.of(context, rootNavigator: true).pop();
                context.router.popUntilRoot();
                context.router.push(HomeRoute());
              },
            ),
            DigitIconTile(
              title: AppLocalizations.of(context)
                  .translate(i18.common.coreCommonLogout),
              icon: Icons.logout,
              onPressed: () {
                context.read<AuthBloc>().add(const AuthEvent.logout());
                context.navigateBack();
              },
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DigitIconTile(
                  icon: Icons.language,
                  onPressed: () {},
                  title: AppLocalizations.of(context)
                      .translate(i18.common.coreCommonlanguage),
                  content: BlocBuilder<AppInitialization, InitState>(
                      builder: (context, state) => state.maybeWhen(
                            orElse: () => const Offstage(),
                            initialized: (appConfig, serviceReg) {
                              final languages =
                                  appConfig.appConfig!.appConfig?[0].languages;

                              return BlocBuilder<LocalizationBloc,
                                      LocalizationState>(
                                  builder: (context, locState) {
                                return DigitRowCard(
                                  rowItems: languages!.map((e) {
                                    return DigitRowCardModel(
                                        label: e.label,
                                        value: e.value,
                                        isSelected: e.value ==
                                            context
                                                .read<LocalizationBloc>()
                                                .locale);
                                  }).toList(),
                                  width: MediaQuery.of(context).size.width,
                                  onChanged: (rowCardValue) {
                                    context.read<LocalizationBloc>().add(
                                        LocalizationEvent.onSelect(
                                            locale: rowCardValue.value,
                                            moduleList: appConfig
                                                .appConfig!
                                                .appConfig?[0]
                                                .backendInterface));
                                  },
                                );
                              });
                            },
                          )),
                )),
            DigitIconTile(
              title: AppLocalizations.of(context)
                  .translate(i18.common.coreCommonProfile),
              icon: Icons.person,
              onPressed: () {
                context.navigateTo(ProfileRoute());
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            const PoweredByDigit(
              version: 'v1.3',
            )
          ],
        );
      },
    );
  }
}
