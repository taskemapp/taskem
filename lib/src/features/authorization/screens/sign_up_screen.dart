import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/features/authorization/widgets/sign_up/sign_up_form.dart';

part '../widgets/sign_up/sign_up_large.dart';
part '../widgets/sign_up/sign_up_medium.dart';
part '../widgets/sign_up/sign_up_small.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController emailController;
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;
  late final TextEditingController repeatPasswordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    repeatPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Theme(
      data: theme.copyWith(
        textTheme: GoogleFonts.notoSansMonoTextTheme(theme.textTheme),
      ),
      child: AdaptiveLayout(
        body: SlotLayout(
          config: {
            Breakpoints.small: SlotLayout.from(
              key: UniqueKey(),
              builder: (context) => _SignUpSmall(
                emailController: emailController,
                passwordController: passwordController,
                userNameController: userNameController,
                repeatPasswordController: repeatPasswordController,
              ),
            ),
            Breakpoints.medium: SlotLayout.from(
              key: UniqueKey(),
              builder: (context) => _SignUpMedium(
                emailController: emailController,
                passwordController: passwordController,
                userNameController: userNameController,
                repeatPasswordController: repeatPasswordController,
              ),
            ),
            Breakpoints.large: SlotLayout.from(
              key: UniqueKey(),
              builder: (context) => _SignUpLarge(
                emailController: emailController,
                passwordController: passwordController,
                userNameController: userNameController,
                repeatPasswordController: repeatPasswordController,
              ),
            ),
          },
        ),
      ),
    );
  }
}
