import 'package:addicts_movies/models/clase_Pelicula.dart';
import 'package:addicts_movies/widgets/detalles_w.dart';
import 'package:addicts_movies/widgets/card_w.dart';
import 'package:flutter/material.dart';

import 'myList_button.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key key, this.pelicula});

  final Pelicula pelicula;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetalleWidget(
                        pelicula: pelicula,
                      ),
                    ),
                  );
                },
                child: CardWidget(
                  pelicula: pelicula,
                ),
              ),
              Divider(
                color: Colors.grey[350],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget tarjeta() {
    return Card(
      color: Color(0xff2b4056),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 70,
            child: FadeInImage(
              placeholder: AssetImage(
                'assets/images/loading.gif',
              ),
              image: pelicula.posterPath != ''
                  ? NetworkImage(
                      'https://www.themoviedb.org/t/p/w200' +
                          pelicula.posterPath,
                      //  height: 120,
                    )
                  : AssetImage(
                      'assets/images/no_disponible.jpg',
                      // height: 90,
                    ),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pelicula.originalTitle,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      pelicula.releaseDate.year.toString(),
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amber,
                        ),
                        Text(
                          pelicula.voteAverage.toString(),
                          style: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          MyListBtn(
            pelicula: pelicula,
          ),
        ],
      ),
    );
  }
}
