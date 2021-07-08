import 'package:addicts_movies/models/clase_Pelicula.dart';
import 'package:addicts_movies/widgets/detalles_w.dart';
import 'package:addicts_movies/widgets/myList_button.dart';
import 'package:flutter/material.dart';

class MyListWidget extends StatelessWidget {
  MyListWidget(this.pelicula);

  final Pelicula pelicula;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
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
            child: Container(
              width: 160,
              child: Column(
                children: [
                  pelicula.posterPath != ''
                      ? Image.network(
                          'https://www.themoviedb.org/t/p/w200' +
                              pelicula.posterPath,
                          //  height: 120,
                        )
                      : Image.asset(
                          'assets/images/no_disponible.jpg',
                          // height: 90,
                        ),
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                    child: Container(
                      width: 202,
                      color: Color(0xff445a6f),
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
                              ),
                            ),
                            SizedBox(
                              height: 6,
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          MyListBtn(
            pelicula: pelicula,
          ),
        ],
      ),
    );
  }
}
