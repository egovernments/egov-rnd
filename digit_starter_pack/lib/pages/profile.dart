import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_digit_app/blocs/app_init.dart';
import 'package:new_digit_app/blocs/userbloc.dart';
import 'package:new_digit_app/model/user/userModel.dart';
import 'package:new_digit_app/widget/localized.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../utils/i18_key_constants.dart' as i18;

class ProfileScreen extends LocalizedStatefulWidget {
  const ProfileScreen({super.key, super.appLocalizations});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends LocalizedState<ProfileScreen> {
  final nameKey = 'nameKey';
  final mobileNoKey = 'mobileNoKey';
  final genderKey = 'genderKey';
  final emailIdKey = 'emailIdKey';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    FormGroup buildForm(UserState state) {
      // Extract user model from the state using mapOrNull method
      final user = state.mapOrNull(
        // Map UserModel from the state
        user: (value) => value.userModel,
      );

      return fb.group(<String, Object>{
        nameKey: FormControl<String>(value: user?.name, validators: []),
        mobileNoKey: FormControl<String>(
          value: user?.mobileNumber,
          // validators: [
          //   CustomValidator.validMobileNumber,
          // ],
        ),
        emailIdKey: FormControl<String>(
          value: user?.emailId,
          validators: [Validators.email],
        ),
        genderKey: FormControl<String>(
          value: context.read<AppInitialization>().state.maybeWhen(
                orElse: () => null,
                // If the app is initialized, set value based on user's gender
                initialized: (appConfig, serviceRegistryList) {
                  // Map gender options to their codes and find the code matching user's gender
                  return appConfig.appConfig!.appConfig?[0].genderOptions
                      .map((e) => e.code)
                      .firstWhere((element) => element == user?.gender,
                          // If user's gender is not found, default to an empty string
                          orElse: () => '');
                },
              ),
        ),
      });
    }

    return Scaffold(
      appBar: AppBar(),
      body:
          BlocBuilder<AppInitialization, InitState>(builder: (context, state) {
        final actionMap = state.entityActionMapping;
        return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DigitIconButton(
                icon: Icons.arrow_back,
                onPressed: () {
                  context.navigateBack();
                },
                iconText: localizations.translate(i18.common.coreCommonBack),
              ),
              ReactiveFormBuilder(
                form: () => buildForm(state),
                builder: (BuildContext context, FormGroup formGroup,
                        Widget? child) =>
                    DigitCard(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        DigitTextFormField(
                          formControlName: nameKey,
                          maxLength: 200,
                          label: localizations
                              .translate(i18.common.coreCommonName),
                          validationMessages: {
                            'required': (object) => localizations.translate(
                                  '${i18.individualDetails.nameLabelText}_IS_REQUIRED',
                                ),
                          },
                        ),
                        DigitTextFormField(
                          formControlName: mobileNoKey,
                          minLength: 10,
                          maxLength: 10,
                          label: localizations
                              .translate(i18.common.coreCommonMobileNumber),
                          validationMessages: {
                            'required': (object) => localizations.translate(
                                  '${i18.individualDetails.nameLabelText}_IS_REQUIRED',
                                ),
                          },
                        ),
                        BlocBuilder<AppInitialization, InitState>(
                          builder: (context, state) => state.maybeWhen(
                            orElse: () => const Offstage(),
                            // If the app is initialized, display the gender options
                            initialized: (appConfig, _) {
                              return Column(
                                children: [
                                  // Display label for gender options
                                  Row(
                                    children: [
                                      Text(
                                        localizations.translate(
                                            i18.common.coreCommonGender),
                                        style: theme.textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                  // Generate RadioListTiles for each gender option
                                  ...appConfig
                                      .appConfig!.appConfig![0].genderOptions
                                      .map((e) => ReactiveRadioListTile<String>(
                                            value: e.code,
                                            title: Text(
                                              localizations.translate(e.code),
                                            ),
                                            // Set form control name for reactive form handling
                                            formControlName: genderKey,
                                          ))
                                      .toList(),
                                ],
                              );
                            },
                          ),
                        ),
                        DigitTextFormField(
                          formControlName: emailIdKey,
                          label: localizations.translate(
                            i18.common.coreCommonEmailId,
                          ),
                          maxLength: 200,
                          validationMessages: {
                            'required': (object) => localizations.translate(
                                  '${i18.individualDetails.nameLabelText}_IS_REQUIRED',
                                ),
                          },
                        ),
                        DigitElevatedButton(
                          child: Text(
                            localizations.translate(i18.common.coreCommonSave),
                          ),
                          // Define onPressed callback function
                          onPressed: () {
                            // Extract user details from the state
                            UserModel? user = state.mapOrNull(
                              user: (value) => value.userModel,
                            );

                            // Create an updated user model with form data
                            final updatedUser = user!.copyWith(
                              gender:
                                  formGroup.control(genderKey).value as String,
                              mobileNumber:
                                  formGroup.control(mobileNoKey).value,
                              name: formGroup.control(nameKey).value as String,
                              emailId:
                                  formGroup.control(emailIdKey).value as String,
                            );

                            // Dispatch updateUser event to UserBloc with updated user details
                            context.read<UserBloc>().add(
                                  UserEvent.updateUser(
                                    actionMap: actionMap,
                                    user: updatedUser,
                                    olduser: user,
                                  ),
                                );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
      }),
    );
  }
}
