import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskem/src/common/text_field_validators.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/core/helpers/snack_bar_service.dart';
import 'package:taskem/src/core/widgets/custom_progress_indicator.dart';
import 'package:taskem/src/core/widgets/custom_text_field.dart';
import 'package:taskem/src/features/authorization/controllers/auth_bloc.dart';
import 'package:taskem/src/routes/routes.dart';
import 'package:taskem/src/routes/screen_route_builder.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    required this.emailController,
    required this.passwordController,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

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
            validator: (value) {
              if (!TextFieldValidators.email(value)) {
                return translation.validator.email;
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
            keyboardType: TextInputType.visiblePassword,
            controller: widget.passwordController,
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
              if (state is AuthSuccessLogin) {
                context.go(
                  ScreenRouteBuilder().path(ScreenRoutes.teams).build(),
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
                          AuthEvent.signIn(
                            email: widget.emailController.text,
                            password: widget.passwordController.text,
                          ),
                        );
                      }
                    },
                    child: Text(
                      translation.authorization.login,
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
                translation.authorization.noAccount,
                textAlign: TextAlign.center,
                style: theme.textTheme.labelMedium,
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  context.go(
                    ScreenRouteBuilder().path(ScreenRoutes.signUp).build(),
                  );
                },
                child: Text(
                  translation.authorization.registration,
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
