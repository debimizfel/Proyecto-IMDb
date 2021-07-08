import 'package:addicts_movies/service/masVistas_servicio.dart';
import 'package:addicts_movies/service/myList_servicio.dart';
import 'package:addicts_movies/service/populares_servicio.dart';
import 'package:addicts_movies/service/search_service.dart';
import 'package:addicts_movies/service/upcoming_servicio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/pantalla_principal.dart';

// -------- PROYECTO DE NIVELACION -----

void main() {
  runApp(MyApp());
}

//provider
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PopularesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MasVistasProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UpcomingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyListProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'Home',
        routes: {
          'Home': (BuildContext context) => PantallaPrincipal(),
        },
      ),
    );
  }
}

//simple prueba de cambio de pantalla
class Pantalla1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOLAAA'),
      ),
      body: Center(
        child: InkWell(
          child: Image.asset('assets/images/Logo.png'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => PantallaPrincipal()),
            );
          },
        ),
      ),
    );
  }
}
