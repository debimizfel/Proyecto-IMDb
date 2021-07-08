import 'package:flutter/material.dart';

import 'models/clase_Pelicula.dart';

//llego desde la pantalla principal apretando alguna plataforma
class Mantenimiento extends StatelessWidget {
  const Mantenimiento({
    this.pelicula,
    Key key,
  }) : super(key: key);

  final Pelicula pelicula;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('mantenimiento'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/triangulo.jpg',
              height: 90,
            ),
            Text(
              'En mantenimiento',
              style: TextStyle(fontSize: 20),
            ),
            //MyListBtn(id: pelicula.id.toString()),
          ],
        ),
      ),
    );
  }

  Widget appbar() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          //NO LOGRE PONER LA FOTO MAS GRANDE
          floating: true,
          title: Center(
            child: Image.asset(
              'assets/images/Logo.png',
              height: 70,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}

// card con list tile
//return Container(
  //     height: 100,
  //     child: Card(
  //       color: Color(0xff2b4056),
  //       child: ListTile(
  //         leading: FadeInImage(
  //           placeholder: AssetImage(
  //             'assets/images/loading.gif',
  //           ),
  //           image: pelicula.posterPath != ''
  //               ? NetworkImage(
  //                   'https://www.themoviedb.org/t/p/w200' + pelicula.posterPath,
  //                   //  height: 120,
  //                 )
  //               : AssetImage(
  //                   'assets/images/no_disponible.jpg',
  //                   // height: 90,
  //                 ),
  //         ),
  //         title: Text(
  //           pelicula.originalTitle,
  //           overflow: TextOverflow.ellipsis,
  //           style: TextStyle(
  //             color: Colors.grey[400],
  //             fontSize: 20,
  //           ),
  //         ),
  //         subtitle: Row(
  //           children: [
  //             Text(
  //               pelicula.releaseDate.year.toString(),
  //               style: TextStyle(
  //                 color: Colors.grey[400],
  //                 fontSize: 16,
  //               ),
  //             ),
  //             SizedBox(
  //               width: 10,
  //             ),
  //             Row(
  //               children: [
  //                 Icon(
  //                   Icons.star,
  //                   size: 16,
  //                   color: Colors.amber,
  //                 ),
  //                 Text(
  //                   pelicula.voteAverage.toString(),
  //                   style: TextStyle(
  //                     color: Colors.grey[400],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //         trailing: MyListBtn(
  //           pelicula: pelicula,
  //         ),
  //       ),
  //     ),
  //   );
  // }