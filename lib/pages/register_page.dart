import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/widgets/my_button.dart';
import 'package:chat_app/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context) {
    AuthService authService = AuthService();

    try {
      if (_passwordController.text == _confirmpasswordController.text) {
        authService.signUpWithEmailPassword(
          _usernameController.text,
          _emailController.text,
          _passwordController.text,
        );
        print('register');
      } else {
        showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(title: Text("Password doesn't match")),
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 50),
            Text(
              "Lets Create An Account",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),
            MyTextFieldWidget(
              hint: "username",
              obscure: false,
              controller: _usernameController,
            ),
            const SizedBox(height: 25),
            MyTextFieldWidget(
              hint: "Email",
              obscure: false,
              controller: _emailController,
            ),
            const SizedBox(height: 25),
            MyTextFieldWidget(
              hint: "Password",
              obscure: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 25),
            MyTextFieldWidget(
              hint: "Confirm Password",
              obscure: true,
              controller: _confirmpasswordController,
            ),
            const SizedBox(height: 25),
            MyButton(buttonText: 'Register', onTap: () => register(context)),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Have an Account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login Instead",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
