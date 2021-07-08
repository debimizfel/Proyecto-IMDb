import 'package:flutter/material.dart';

import '../mantenimiento.dart';

class PantallaPrincipalW extends StatefulWidget {
  @override
  _PantallaPrincipalState createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipalW> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey[900],
      // decoration: BoxDecoration(
      //   //degrade de colores en el background
      //   gradient: LinearGradient(
      //     colors: [
      //       Colors.grey[900],
      //       Colors.black,
      //     ],
      //     begin: const FractionalOffset(1, 0.1),
      //     end: const FractionalOffset(1.0, 1.0),
      //   ),
      // ),

      //EFECTO DEL APPBAR
      child: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   //NO LOGRE PONER LA FOTO MAS GRANDE
          //   floating: true,
          //   title: Center(
          //     child: Image.asset(
          //       'assets/images/Logo.png',
          //       height: 70,
          //     ),
          //   ),
          //   backgroundColor: Colors.transparent,
          // ),

          //LA LISTA DE FOTOS + LA FUNCION DEL APPBAR
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  //NO FUNCIONAN  LOS AXIS...??
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 20,
                    ),

                    //METODOS PARA CREAR LAS IMAGENES
                    plataformas('assets/images/Netflix1.jpg'),
                    SizedBox(height: 20),
                    plataformas('assets/images/DisneyPlus.jpg'),
                    SizedBox(height: 20),
                    plataformas('assets/images/PrimeVideo.png'),
                    SizedBox(height: 20),
                    plataformas('assets/images/HBO.png'),
                    SizedBox(height: 20),
                    plataformas('assets/images/hulu.jpg'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//METODO DE LAS FOTOS
  plataformas(String imagen) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Mantenimiento(),
              ),
            );
          },
          child: Image.asset(
            imagen,
          ),
        ),
      ),
    );
  }
}
