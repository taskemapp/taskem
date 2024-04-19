import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/features/authorization/widgets/sign_in/sign_in_form.dart';

part '../widgets/sign_in/sign_in_large.dart';
part '../widgets/sign_in/sign_in_medium.dart';
part '../widgets/sign_in/sign_in_small.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController loginController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    loginController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    loginController.dispose();
    passwordController.dispose();
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
              builder: (context) => _SignInSmall(
                emailController: loginController,
                passwordController: passwordController,
              ),
            ),
            Breakpoints.medium: SlotLayout.from(
              key: UniqueKey(),
              builder: (context) => _SignInMedium(
                emailController: loginController,
                passwordController: passwordController,
              ),
            ),
            Breakpoints.large: SlotLayout.from(
              key: UniqueKey(),
              builder: (context) => _SignInLarge(
                emailController: loginController,
                passwordController: passwordController,
              ),
            ),
          },
        ),
      ),
    );
  }
}
