import 'package:dio/dio.dart';
import 'package:addicts_movies/models/clase_Pelicula.dart';
import 'package:flutter/cupertino.dart';

class PopularesProvider extends ChangeNotifier {
  List<Pelicula> _peliculas = [];

  List<Pelicula> get peliculas => _peliculas;

  void setPeliculas(List<Pelicula> peliculas) {
    _peliculas = peliculas;
    notifyListeners();
  }

  PopularesProvider() {
    obtenerPopulares();
  }

  Future<List<Pelicula>> obtenerPopulares() async {
    try {
      var response = await Dio().get(
          'https://api.themoviedb.org/3/movie/popular?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US&page=1');

      final json = response.data['results'];
      var listadoPeliculas =
          json.map((peliculaJson) => Pelicula.fromJson(peliculaJson)).toList();
      print('SI SE PUDO DE POPULARES');
      var listPeliculas = List<Pelicula>.from(listadoPeliculas);
      setPeliculas(listPeliculas);
      return listPeliculas;
    } catch (e) {
      print('HUBO UN ERROR DE POPULARES');
      print(e);
      return [];
    }
  }
}
