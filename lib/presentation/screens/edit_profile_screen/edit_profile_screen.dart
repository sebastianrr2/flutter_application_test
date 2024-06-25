

import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routerName = 'edit_profile_screen';

  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: AppTheme.appBarTitle,
      ),

      body: const Center(child: Text('Edit Profile')
      )
    );
  }
}