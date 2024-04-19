part of '../../screens/sign_up_screen.dart';

class _SignUpSmall extends StatelessWidget {
  const _SignUpSmall({
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(48),
            child: SignUpForm(
              emailController: emailController,
              passwordController: passwordController,
              userNameController: userNameController,
              repeatPasswordController: repeatPasswordController,
            ),
          ),
        ),
      ),
    );
  }
}
