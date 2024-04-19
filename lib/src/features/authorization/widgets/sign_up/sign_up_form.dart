import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskem/src/common/text_field_validators.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/core/helpers/snack_bar_service.dart';
import 'package:taskem/src/core/widgets/custom_progress_indicator.dart';
import 'package:taskem/src/core/widgets/custom_text_field.dart';
import 'package:taskem/src/features/authorization/controllers/auth_bloc.dart';
import 'package:taskem/src/routes.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    required this.emailController,
    required this.userNameController,
    required this.passwordController,
    required this.repeatPasswordController,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final TextEditingController repeatPasswordController;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  String? passwordValidate(
    String password,
    String emptyErrorMessage,
    String passErrorMessage,
  ) {
    if (widget.passwordController.text !=
        widget.repeatPasswordController.text) {
      return passErrorMessage;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final translation = context.translation;
    final theme = context.theme;
    final authBloc = context.read<AuthBloc>();

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            title: translation.authorization.field.email,
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            maxLength: 32,
            validator: (value) {
              if (!TextFieldValidators.email(value)) {
                return translation.validator.email;
              }
              return null;
            },
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            title: translation.authorization.field.userName,
            controller: widget.userNameController,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (!TextFieldValidators.userName(value)) {
                return translation.validator.userName;
              }
              return null;
            },
            maxLength: 32,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField.password(
            title: translation.authorization.field.password,
            controller: widget.passwordController,
            keyboardType: TextInputType.visiblePassword,
            maxLength: 32,
            validator: (value) => passwordValidate(
              value,
              translation.validator.empty,
              translation.validator.passwordMatch,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField.password(
            title: translation.authorization.field.repeatPassword,
            controller: widget.repeatPasswordController,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) => passwordValidate(
              value,
              translation.validator.empty,
              translation.validator.passwordMatch,
            ),
            maxLength: 32,
          ),
          const SizedBox(height: 24),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (BuildContext context, AuthState state) {
              if (state is AuthError) {
                SnackBarService.error(
                  context,
                  state.errorMessage,
                );
              }
              if (state is AuthSuccessSignUp) {
                context.go(ScreenRoutes.signIn.path);
                SnackBarService.info(
                  context,
                  translation.authorization.accountCreated,
                );
              }
            },
            builder: (context, state) {
              return switch (state) {
                AuthLoading() => const FilledButton.tonal(
                    onPressed: null,
                    child: CustomProgressIndicator(),
                  ),
                _ => FilledButton.tonal(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authBloc.add(
                          AuthEvent.signUp(
                            email: widget.emailController.text,
                            userName: widget.emailController.text,
                            password: widget.passwordController.text,
                          ),
                        );
                      }
                    },
                    child: Text(
                      translation.authorization.registration,
                      textAlign: TextAlign.center,
                    ),
                  ),
              };
            },
          ),
          const SizedBox(height: 12),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              Text(
                translation.authorization.haveAccount,
                textAlign: TextAlign.center,
                style: theme.textTheme.labelMedium,
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  context.go(ScreenRoutes.signIn.path);
                },
                child: Text(
                  translation.authorization.login,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.surfaceTint,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
