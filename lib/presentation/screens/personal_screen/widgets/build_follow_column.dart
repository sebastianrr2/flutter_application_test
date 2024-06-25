import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../../../theme/theme.dart';

class BuildFollowColumn extends StatelessWidget {

  final themeStyle = ThemeStylesProfiles(color: AppTheme.lightGray);

  BuildFollowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.transparent,
        height: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 80,
                    child: Column(
                      children: [
                        Text('0', style: themeStyle.primaryNumber),
                        Text('followers', style: themeStyle.tertiaryTitle,)
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.people_alt, color: AppTheme.dullGold, size: 50,)
                ],
              ),
            ),
    
            SizedBox(
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 80,
                    child: Column(
                      children: [
                        Text('0', style: themeStyle.primaryNumber),
                        Text('following', style: themeStyle.tertiaryTitle,)
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.person, color: AppTheme.dullGold, size: 50,)
                ],
              ),
            ),
    
            SizedBox(
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 3),
                      width: 80,
                      child: Column(
                        children: [
                          Text('0', style: themeStyle.primaryNumber),
                          Text('friends', style: themeStyle.tertiaryTitle,)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(child: Icon(Icons.groups_rounded, color: AppTheme.dullGold, size: 60,))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}