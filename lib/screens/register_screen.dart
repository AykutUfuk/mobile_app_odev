import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/register_form_fields.dart';
import '../widgets/error_message.dart';
import '../widgets/register_button.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  DateTime? _selectedDate;
  String? _selectedGender;
  String? _selectedNationality;
  String? _errorMessage;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text != _confirmPasswordController.text) {
        setState(() {
          _errorMessage = "Şifreler eşleşmiyor!";
        });
        return;
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', _nameController.text);
      await prefs.setString('surname', _surnameController.text);
      await prefs.setString('email', _emailController.text);
      await prefs.setString('phone', _phoneController.text);
      await prefs.setString('password', _passwordController.text);
      await prefs.setString('gender', _selectedGender ?? '');
      await prefs.setString('nationality', _selectedNationality ?? '');
      await prefs.setString(
        'birthDate',
        _selectedDate?.toIso8601String() ?? '',
      );

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kayıt Ol')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              RegisterFormFields(
                nameController: _nameController,
                surnameController: _surnameController,
                emailController: _emailController,
                phoneController: _phoneController,
                passwordController: _passwordController,
                confirmPasswordController: _confirmPasswordController,
                selectedDate: _selectedDate,
                selectedGender: _selectedGender,
                selectedNationality: _selectedNationality,
                onDateSelect: _selectDate,
                onGenderChange: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                onNationalityChange: (value) {
                  setState(() {
                    _selectedNationality = value;
                  });
                },
              ),
              if (_errorMessage != null) ErrorMessage(message: _errorMessage!),
              const SizedBox(height: 20),
              RegisterButton(onPressed: _register),
            ],
          ),
        ),
      ),
    );
  }
}
