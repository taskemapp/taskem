part of '../../screens/sign_up_screen.dart';

class _SignUpLarge extends StatelessWidget {
  const _SignUpLarge({
    super.key,
    required this.emailController,
    required this.userNameController,
    required this.passwordController,
    required this.repeatPasswordController,
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
          child: SizedBox(
            width: 400,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
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
        ),
      ),
    );
  }
}
