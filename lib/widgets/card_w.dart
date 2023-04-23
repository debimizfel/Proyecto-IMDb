import 'package:addicts_movies/models/clase_Pelicula.dart';
import 'package:flutter/material.dart';

import 'myList_button.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({required this.pelicula, Key? key}) : super(key: key);

  final Pelicula pelicula;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff2b4056),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 70,
            child:  FadeInImage(
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
                    )as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
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
          ),
          SizedBox(),
          MyListBtn(
            pelicula: pelicula,
          ),
        ],
      ),
    );
  }
}
