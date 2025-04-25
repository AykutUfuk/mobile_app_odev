import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/login_form_fields.dart';
import '../widgets/error_message.dart';
import '../widgets/login_button.dart';
import '../widgets/register_link_button.dart';
import 'profile_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();

      final savedEmail = prefs.getString('email') ?? '';
      final savedPassword = prefs.getString('password') ?? '';

      if (_emailController.text == savedEmail &&
          _passwordController.text == savedPassword) {
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
      } else {
        setState(() {
          _errorMessage = 'Email veya şifre hatalı!';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giriş Yap'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginFormFields(
                emailController: _emailController,
                passwordController: _passwordController,
              ),
              if (_errorMessage != null) ErrorMessage(message: _errorMessage!),
              const SizedBox(height: 24),
              LoginButton(onPressed: _login),
              const RegisterLinkButton(),
            ],
          ),
        ),
      ),
    );
  }
}
