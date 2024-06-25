import 'package:go_router/go_router.dart';

import '../screens/screens.dart';

final router = GoRouter(
  initialLocation: '/profile',
  routes: [
    
    GoRoute(
      path: '/profile',
      name: PersonalScreen.routerName,
      builder: (context, state) => const PersonalScreen(),
      routes: [
        GoRoute(
          path: 'edit_profile',
          name: EditProfileScreen.routerName,
          builder: (context, state) => const EditProfileScreen()
        ),
      ]
    ),
    
  ]
);