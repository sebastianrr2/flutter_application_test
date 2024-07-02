import 'package:flutter/material.dart';
import 'package:flutter_application_test/presentation/screens/edit_profile_screen/widgets/build_favorite_list_view.dart';

import '../../theme/app_theme.dart';
 // Asegúrate de tener la ruta correcta

class FavoritesScreen extends StatefulWidget {
  static const String routerName = 'edit_profile_screen';

  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: AppTheme.appBarTitle,
      ),
      body: const BuildFavoriteListView(),
    );
  }
}
