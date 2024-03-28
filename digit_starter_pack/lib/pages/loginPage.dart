import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_digit_app/blocs/app_init.dart';
import 'package:new_digit_app/routes/routes.dart';
import 'package:new_digit_app/widget/localized.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../blocs/authbloc.dart';

class LoginScreen extends LocalizedStatefulWidget {
  LoginScreen({Key? key, super.appLocalizations}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends LocalizedState<LoginScreen> {
  final String _usernameController = 'username';
  final String _passwordController = 'password';

  bool _obscureText = true; // Initial state for password field visibility
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Function to build a IconButton for toggling password visibility
    Widget buildPasswordVisibility() {
      return IconButton(
        // Display appropriate icon based on password visibility state
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
        ),
        // Define onPressed callback function
        onPressed: () {
          // Toggle password visibility state
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );
    }

    return BlocBuilder<AppInitialization, InitState>(builder: (context, state) {
      final actionMap = state.entityActionMapping;
      return Scaffold(
        appBar: AppBar(),
        body: ReactiveFormBuilder(
            form: buildForm,
            builder: (context, form, child) => DigitCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        localizations.translate(
                          i18.login.labelText,
                        ),
                        style: theme.textTheme.displayMedium,
                      ),
                      DigitTextFormField(
                        label: localizations.translate(
                          i18.login.userIdPlaceholder,
                        ),
                        validationMessages: {
                          "required": (control) {
                            return localizations.translate(
                              '${i18.login.userIdPlaceholder}_IS_REQUIRED',
                            );
                          },
                        },
                        textCapitalization: TextCapitalization.none,
                        formControlName: _usernameController,
                        isRequired: true,
                        keyboardType: TextInputType.text,
                      ),
                      DigitTextFormField(
                        label: localizations.translate(
                          i18.login.passwordPlaceholder,
                        ),
                        validationMessages: {
                          "required": (control) {
                            return localizations.translate(
                              '${i18.login.passwordPlaceholder}_IS_REQUIRED',
                            );
                          },
                        },
                        formControlName: _passwordController,
                        keyboardType: TextInputType.text,
                        isRequired: true,
                        textCapitalization: TextCapitalization.none,
                        obscureText: !_obscureText,
                        suffix: buildPasswordVisibility(),
                      ),
                      const SizedBox(height: 20.0),
                      BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          state.maybeWhen(
                              orElse: () {},
                              error: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Error Occured when login')));

                                Future.delayed(const Duration(seconds: 2), () {
                                  context
                                      .read<AuthBloc>()
                                      .add(const AuthEvent.logout());
                                });
                              },
                              unauthenticated: () {},
                              authenticated: (a, b, c) {
                                // AutoRouter.of(context)
                                //     .navigate(const HomeRoute());
                                AutoRouter.of(context).pushNamed('/home');
                                // AutoRouter.of(context).pushNamed('/projects');
                              });
                        },
                        builder: (context, state) => DigitElevatedButton(
                          child: Text(
                            localizations.translate(i18.login.labelText),
                          ),
                          // Define onPressed callback function
                          onPressed: () {
                            // Mark all form fields as touched
                            form.markAllAsTouched();
                            // Check if the form is valid
                            if (form.valid) {
                              // Dispatch login event to AuthBloc with entered username and password
                              context.read<AuthBloc>().add(
                                    AuthEvent.login(
                                      // Extract and trim username from form control
                                      username: (form
                                              .control(_usernameController)
                                              .value as String)
                                          .trim(),
                                      // Extract and trim password from form control
                                      password: (form
                                              .control(_passwordController)
                                              .value as String)
                                          .trim(),
                                      // Pass action map if needed
                                      actionMap: actionMap,
                                    ),
                                  );
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextButton(
                        onPressed: () => DigitDialog.show(
                          context,
                          options: DigitDialogOptions(
                            titleText: localizations.translate(
                              i18.forgotPassword.labelText,
                            ),
                            contentText: localizations.translate(
                              i18.forgotPassword.contentText,
                            ),
                            primaryAction: DigitDialogActions(
                              label: localizations.translate(
                                i18.forgotPassword.primaryActionLabel,
                              ),
                              action: (ctx) =>
                                  Navigator.of(context, rootNavigator: true)
                                      .pop(),
                            ),
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          minimumSize: const Size(0, 0),
                        ),
                        child: Center(
                          child: Text(
                            localizations.translate(
                              i18.forgotPassword.actionLabel,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
      );
    });
  }

  FormGroup buildForm() => fb.group(<String, Object>{
        _usernameController: FormControl<String>(
          value: 'SMZ45',
          validators: [Validators.required],
        ),
        _passwordController: FormControl<String>(
          validators: [Validators.required],
          value: 'eGov@1234',
        ),
      });
}
