import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/profile_info_section.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = '';
  String _surname = '';
  String _email = '';
  String _phone = '';
  String _gender = '';
  String _nationality = '';
  String _birthDate = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? '';
      _surname = prefs.getString('surname') ?? '';
      _email = prefs.getString('email') ?? '';
      _phone = prefs.getString('phone') ?? '';
      _gender = prefs.getString('gender') ?? '';
      _nationality = prefs.getString('nationality') ?? '';
      _birthDate = prefs.getString('birthDate') ?? '';
    });
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profil'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(icon: const Icon(Icons.logout), onPressed: _logout),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ProfileInfoSection(
            name: _name,
            surname: _surname,
            email: _email,
            phone: _phone,
            gender: _gender,
            birthDate: _birthDate,
            nationality: _nationality,
          ),
        ),
      ),
    );
  }
}
