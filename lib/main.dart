
import 'package:flutter/services.dart';
import 'package:flutter_application_test/infrastructure/datasources/genre_db_datasource.dart';
import 'package:flutter_application_test/infrastructure/datasources/local_favorites_datasource_impl.dart';
import 'package:flutter_application_test/infrastructure/datasources/movies_db_datasource.dart';
import 'package:flutter_application_test/infrastructure/repositories/genre_repository_impl.dart';
import 'package:flutter_application_test/infrastructure/repositories/local_favorites_respository_impl.dart';
import 'package:flutter_application_test/infrastructure/repositories/movie_repository_impl.dart';

import 'package:flutter_application_test/presentation/config/app_router.dart';
import 'package:flutter_application_test/presentation/providers/local_favorites_provider.dart';

import 'package:flutter_application_test/presentation/providers/providers.dart';
import 'package:flutter_application_test/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';


/* La idea de hacer el main asincrono es que se pueda llamar la inicializacion de las preferencias */
void main() async {
  /* Sólo tiene que llamar a este método si necesita que la vinculación se inicialice antes de llamar a 
  runApp*/

  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {

    final purchaseHistoryRepository = MovieRepositoryImpl(MoviesDbDatasource());
    final genresRepository = GenreRepositoryImpl(GenreDbDatasource());
    final favoritesRepository = FavoritesRepositoryImpl(datasource: LocalFavoritesDatasourceImpl());
    //import


    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark)
    );

    SystemChrome.setPreferredOrientations([ 
      DeviceOrientation.portraitUp, 
      DeviceOrientation.portraitDown
    ]);

    return MultiProvider(
        providers: [
          //Provider para desplegar la lista completa de peliculas traida de la API
          ChangeNotifierProvider(
            lazy: false,
            create: (context) => MovieProvider(purchaseHistoryRepository: purchaseHistoryRepository)..loadTicketsPurchaseHistory()
           ),
           //Provider para desplegar la lista de generos traidos de la API
          ChangeNotifierProvider(
            lazy: true,
            create: (context) => GenresProvider(genresRepository: genresRepository)..loadGenreList()
          ),
          //Provider para filtrar la lista de peliculas por generos
          ChangeNotifierProvider(
            lazy: true,
            create: (context) => FilterMovieByGenreProvider(purchaseHistoryRepository)
          ),
          //Provider para la traer, marcar y desmarcar favoritos
          ChangeNotifierProvider(
            lazy: true,
            create: (context) => FavoritesProvider(favoritesRepository:favoritesRepository)
          )
        ],
        child: MaterialApp.router(
    
          builder: (context, child) {
            // Obtain the current media query information.
            final mediaQueryData = MediaQuery.of(context);
    
            return MediaQuery(
              // Set the default textScaleFactor to 1.0 for
              // the whole subtree.
              data: mediaQueryData.copyWith(
                textScaler: mediaQueryData.textScaler.clamp(minScaleFactor: 1.1, maxScaleFactor: 1.4),
              ),
              child: child!,
            );
          },
    
          debugShowCheckedModeBanner: false,
          title: 'Material App',

          routerConfig: router,
          
          theme: AppTheme.lightTheme
        ),
      );
  }
}