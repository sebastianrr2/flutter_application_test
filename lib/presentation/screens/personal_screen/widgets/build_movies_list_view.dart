import 'package:flutter/material.dart';
import 'package:flutter_application_test/presentation/screens/personal_screen/widgets/recomendations.dart';
import 'package:flutter_application_test/presentation/theme/app_theme.dart';
import 'package:provider/provider.dart';

import '../../../providers/providers.dart';
import '../../../theme/theme.dart';

class BuildMovieListView extends StatelessWidget {
  const BuildMovieListView({super.key});



  //MODIFICACIONES REALIZADAS EN ESTE WIDGET PARA MOSTRAR LOS DATOS CORRESPONDIENTES A LAS PELICULAS

  @override
  Widget build(BuildContext context) {

    final purchaseHistory = context.read<MovieProvider>();

    return ListView.builder(
      physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
      itemCount: 10,
      itemBuilder: ((context, index) {
        if (purchaseHistory.ticketsList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );

        }
        final ticket = purchaseHistory.ticketsList[index];

        final date = "${ticket.releaseDate.year.toString().padLeft(4, '0')}-${ticket.releaseDate.month.toString().padLeft(2, '0')}-${ticket.releaseDate.day.toString().padLeft(2, '0')}";

        return Stack(
          children:[
          Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(ticket.backdropPath),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.darken),
                      
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          color: Colors.transparent,
                          //SvgPicture.asset('assets/imagesEvents/drakeLogo.svg',
                          height: 160,
                          width: 180,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              ticket.posterPath,
                              fit: BoxFit.cover,
                            ),
                          )
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: double.infinity,
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ticket.title.toUpperCase(),
                                style: ThemeStylesSettings.secondaryTitle,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '4441 Collins Ave, Miami Beach, FL 33140',
                                style: ThemeStylesSettings.primaryText,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                date,
                                style: ThemeStylesSettings.primaryText,
                              ),
                             const SizedBox(height: 5),
                                  // MODIFICACION REALIZADA PARA MOSTRAR RECOMENDACIONES AL USUARIO
                                    Recommendations(adult: ticket.adult, popularity: ticket.popularity)
                                ],
                              )
                          ),
                        ),
                    ],
                  ),
                ),
              Positioned(
              right: 5,
              top: 5,
              child: IconButton(
                onPressed:(){
                },
                icon: const Icon(Icons.star_border, color: AppTheme.dullGold,),
                )
              )
            ]);      
      }),
    );
  }
}