import 'package:addicts_movies/models/clase_Pelicula.dart';
import 'package:flutter/material.dart';

class DetalleWidget extends StatelessWidget {
  const DetalleWidget({
    this.pelicula,
    Key key,
  }) : super(key: key);

  final Pelicula pelicula;

  @override
  Widget build(BuildContext context) {
    // print(pelicula.popularity);
    return Scaffold(
      appBar: AppBar(
        //como ponerlo en el centro sin que se corra por la flecha
        title: Center(
          child: Text(
            '',
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
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 500,
                height: 281,
                child: FadeInImage(
                  placeholder: AssetImage(
                    'assets/images/loading.gif',
                  ),
                  image: pelicula.posterPath != ''
                      ? NetworkImage(
                          'https://www.themoviedb.org/t/p/w500' +
                              pelicula.backdropPath,
                          //  height: 120,
                        )
                      : AssetImage(
                          'assets/images/not_avaible.jpg',
                          // height: 90,
                        ),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pelicula.originalTitle,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      pelicula.releaseDate.year.toString(),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  pelicula.overview,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[350],
                  ),
                ),
              ),
              Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    size: 25,
                    color: Colors.amber,
                  ),
                  Text(
                    pelicula.voteAverage.toString(),
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
