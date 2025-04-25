import 'package:flutter/material.dart';

class RegisterFormFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final DateTime? selectedDate;
  final String? selectedGender;
  final String? selectedNationality;
  final Function(BuildContext) onDateSelect;
  final Function(String?) onGenderChange;
  final Function(String?) onNationalityChange;

  const RegisterFormFields({
    super.key,
    required this.nameController,
    required this.surnameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.selectedDate,
    required this.selectedGender,
    required this.selectedNationality,
    required this.onDateSelect,
    required this.onGenderChange,
    required this.onNationalityChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Ad'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen adınızı giriniz';
            }
            return null;
          },
        ),
        TextFormField(
          controller: surnameController,
          decoration: const InputDecoration(labelText: 'Soyad'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen soyadınızı giriniz';
            }
            return null;
          },
        ),
        ListTile(
          title: Text(
            selectedDate == null
                ? 'Doğum Tarihi Seçin'
                : 'Doğum Tarihi: ${selectedDate!.toString().split(' ')[0]}',
          ),
          trailing: const Icon(Icons.calendar_today),
          onTap: () => onDateSelect(context),
        ),
        DropdownButtonFormField<String>(
          value: selectedGender,
          decoration: const InputDecoration(labelText: 'Cinsiyet'),
          items: const [
            DropdownMenuItem(value: 'Erkek', child: Text('Erkek')),
            DropdownMenuItem(value: 'Kadın', child: Text('Kadın')),
          ],
          onChanged: onGenderChange,
        ),
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(labelText: 'Email'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen email adresinizi giriniz';
            }
            return null;
          },
        ),
        TextFormField(
          controller: phoneController,
          decoration: const InputDecoration(
            labelText: 'Telefon Numarası',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen telefon numaranızı giriniz';
            }
            return null;
          },
        ),
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
        TextFormField(
          controller: confirmPasswordController,
          decoration: const InputDecoration(
            labelText: 'Şifreyi Tekrar Giriniz',
          ),
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen şifrenizi tekrar giriniz';
            }
            return null;
          },
        ),
        DropdownButtonFormField<String>(
          value: selectedNationality,
          decoration: const InputDecoration(labelText: 'Uyruk'),
          items: const [
            DropdownMenuItem(value: 'Türk', child: Text('Türk')),
            DropdownMenuItem(value: 'Diğer', child: Text('Diğer')),
          ],
          onChanged: onNationalityChange,
        ),
      ],
    );
  }
}
