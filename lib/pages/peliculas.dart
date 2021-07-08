import 'package:addicts_movies/service/masVistas_servicio.dart';
import 'package:addicts_movies/service/upcoming_servicio.dart';
import 'package:flutter/material.dart';
import 'package:addicts_movies/service/populares_servicio.dart';
import 'package:addicts_movies/widgets/pelicula_w.dart';
import 'package:provider/provider.dart';

//https://api.themoviedb.org/3/movie/upcoming?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US&page=1

class PeliculaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'MDb',
            style: TextStyle(
              color: Colors.grey[400],
            ),
          ),
        ),
        backgroundColor: Color(0xff445a6f),
      ),
      backgroundColor: Color(0xff223344),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Coming soon',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            //color: Color(0xff445a6f),
            height: 305,
            child: Consumer<UpcomingProvider>(
              builder: (context, value, child) => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.peliculas.length,
                itemBuilder: (context, index) => PeliculaWidget(
                  pelicula: value.peliculas[index],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Top rated',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            //color: Color(0xff445a6f),
            height: 305,
            child: Consumer<MasVistasProvider>(
              builder: (context, value, child) => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.peliculas.length,
                itemBuilder: (context, index) => PeliculaWidget(
                  pelicula: value.peliculas[index],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'More populars',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            //color: Color(0xff445a6f),
            height: 305,
            child: Consumer<PopularesProvider>(
              builder: (context, value, child) => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.peliculas.length,
                itemBuilder: (context, index) => PeliculaWidget(
                  pelicula: value.peliculas[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
