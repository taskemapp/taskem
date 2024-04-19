part of '../../screens/sign_in_screen.dart';

class _SignInSmall extends StatelessWidget {
  const _SignInSmall({
    required this.emailController,
    required this.passwordController,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 400,
            child: Padding(
              padding: const EdgeInsets.all(48),
              child: SignInForm(
                emailController: emailController,
                passwordController: passwordController,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
