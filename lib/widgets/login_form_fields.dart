import 'package:flutter/material.dart';

class LoginFormFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginFormFields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: 'Email veya Telefon',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen email veya telefon numaranızı giriniz';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: passwordController,
          decoration: const InputDecoration(labelText: 'Şifre'),
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen şifrenizi giriniz';
            }
            return null;
          },
        ),
      ],
    );
  }
}
