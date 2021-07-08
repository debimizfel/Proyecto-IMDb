import 'package:addicts_movies/models/clase_Pelicula.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class SearchProvider extends ChangeNotifier {
  List<Pelicula> _searchMovie = [];

  List<Pelicula> get searchmovie => _searchMovie;

  void setsearchMovie(List<Pelicula> searchMovie) {
    _searchMovie = searchMovie;
    notifyListeners();
  }

  SearchProvider() {
    // getPelicula(_searchMovie.toString());
  }

  Future<List<Pelicula>> getPelicula(String originalTitle) async {
    try {
      var response = await Dio().get(
          'https://api.themoviedb.org/3/search/movie?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US&query=$originalTitle');

      final json = response.data['results'];
      var listadoPeliculas =
          json.map((peliculaJson) => Pelicula.fromJson(peliculaJson)).toList();
      List<Pelicula> listaBusqueda = List<Pelicula>.from(listadoPeliculas);
      setsearchMovie(listaBusqueda);
      return List<Pelicula>.from(listadoPeliculas);
    } catch (e) {
      return [];
    }
  }
}
