

import 'package:flutter/material.dart';

import 'package:flutter_application_test/infrastructure/models/genres_model.dart';
import 'package:flutter_application_test/presentation/providers/providers.dart';
import 'package:flutter_application_test/presentation/theme/app_theme.dart';
import 'package:flutter_application_test/presentation/theme/theme.dart';
import 'package:provider/provider.dart';


class BuildGenresListView extends StatefulWidget {


  static const String routerName = 'edit_profile_screen';

  const BuildGenresListView({super.key});

  @override
  State<BuildGenresListView> createState() => BuildGenresListViewState();
}

class BuildGenresListViewState extends State<BuildGenresListView> {


  @override
  Widget build(BuildContext context) {

    final genres = context.read<GenresProvider>();
    final List<Genre> genreList = genres.genreList;

    return PopupMenuButton(
              itemBuilder: (context) => [
                for (var genre in genreList)
                  PopupMenuItem(
                    value: genre.id,
                    child: Text(
                      genre.name, 
                      style: ThemeStylesSettings.primaryText
                      ),
                  )
              ],
            icon: const Icon(Icons.arrow_drop_down, color: AppTheme.dullGold),
            color: AppTheme.jet,
            offset: const Offset(0, 50),
            onSelected: (value) {}
            );
  }
}