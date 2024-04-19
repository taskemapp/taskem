part of '../../screens/sign_in_screen.dart';

class _SignInMedium extends StatelessWidget {
  const _SignInMedium({
    super.key,
    required this.emailController,
    required this.passwordController,
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
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
      ),
    );
  }
}
