

import 'package:flutter_application_test/presentation/screens/personal_screen/widgets/build_movies_list_view.dart';
import 'package:flutter_application_test/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';

///import 'widgets/build_custom_tabbar.dart';
//import 'widgets/build_follow_column.dart';
import 'widgets/build_custom_searchbar.dart';

class PersonalScreen extends StatelessWidget {
  static const String routerName = 'personalprofile';
   
  const PersonalScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: AppTheme.appBarTitle
        ),
    
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.tune, color: AppTheme.lightGray,),
            splashColor: AppTheme.dullGold,
            hoverColor: AppTheme.lightGray,
            splashRadius: 25,
            enableFeedback: true,
          ),
        ],
      ),

      //MODIFICACION PARA CAMBIAR LA VISTA DEL USUARIO Y LOS BOTONES,
      //DE ESTA FORMA SOLO SE DESPLIEGA LA LISTVIEW CORRESPONDIENTE A LAS PELICULAS
      body: const Column(
        children: [
          BuildCustomSearchBar(),
          
          //Expanded(child: BuildCustomTabBar())
          Expanded(child: BuildMovieListView(),)
        ],
      )
    );
  }
}