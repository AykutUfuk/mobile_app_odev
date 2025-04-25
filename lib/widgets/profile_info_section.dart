import 'package:flutter/material.dart';
import 'profile_info_row.dart';

class ProfileInfoSection extends StatelessWidget {
  final String name;
  final String surname;
  final String email;
  final String phone;
  final String gender;
  final String birthDate;
  final String nationality;

  const ProfileInfoSection({
    super.key,
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
    required this.gender,
    required this.birthDate,
    required this.nationality,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(radius: 50, child: Text('nullnull')),
        const SizedBox(height: 24),
        ProfileInfoRow(label: 'Ad', value: name),
        ProfileInfoRow(label: 'Soyad', value: surname),
        ProfileInfoRow(label: 'E-posta', value: email),
        ProfileInfoRow(label: 'Telefon Numarası', value: phone),
        ProfileInfoRow(label: 'Cinsiyet', value: gender),
        ProfileInfoRow(label: 'Doğum Tarihi', value: birthDate.split('T')[0]),
        ProfileInfoRow(label: 'Uyruk', value: nationality),
      ],
    );
  }
}
