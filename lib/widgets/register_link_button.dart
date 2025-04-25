import 'package:flutter/material.dart';

class RegisterLinkButton extends StatelessWidget {
  const RegisterLinkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/register');
      },
      child: const Text('Hesabınız yok mu? Kayıt olun'),
    );
  }
}
