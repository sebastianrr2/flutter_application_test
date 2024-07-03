import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_test/presentation/screens/edit_profile_screen/favorites_screen.dart';
import 'package:flutter_application_test/presentation/screens/personal_screen/widgets/build_genres_list_view.dart';
import 'package:flutter_application_test/presentation/theme/theme_styles.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/app_theme.dart';
//import '../../../theme/theme.dart';
//import 'build_attending_list_view.dart';

class BuildCustomSearchBar extends StatefulWidget {

  
  const BuildCustomSearchBar({super.key});
  static const String routerName = 'personalprofile';

  @override
  State<BuildCustomSearchBar> createState() => _BuildCustomSearchBarState();
}

class _BuildCustomSearchBarState extends State<BuildCustomSearchBar> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final textController = TextEditingController();
    final focusNode = FocusNode();
    const themeStyleTextFormField = ThemeStyles.primaryTextFormFieldJosefin;


    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide( color: Colors.transparent),
      borderRadius: BorderRadius.circular(30) 
    );

    final inputDecoration = InputDecoration(
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        fillColor: AppTheme.jet,
        
        filled: true,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Icono de la estrella para ir a la pantalla de favoritos 
            IconButton(
              onPressed: (){
                //Ruta para ir a la pantalla de favoritos
                HapticFeedback.selectionClick();
                context.pushNamed(FavoritesScreen.routerName);
               }, 
              icon: const Icon( Icons.star, color: AppTheme.dullGold)),
            //Genres DropDownList
            const Padding(
            padding: EdgeInsets.only(right: 10),
            child: BuildGenresListView() 
            )// Add closing parenthesis here
        ],),
        prefixIcon: const Icon(
          Icons.search,
          color: AppTheme.dullGold
        )
      );
    return Column(
      children: [
        TextFormField(
        onTapOutside: (event){
        focusNode.unfocus();
      },
      style: themeStyleTextFormField,
      focusNode: focusNode,
      controller: textController,   
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        //change the background color of the textfield to battleshipGray
      },),
      
      ],
    );
  }
}