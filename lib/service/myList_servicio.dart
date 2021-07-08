import 'dart:convert';

import 'package:addicts_movies/models/clase_Pelicula.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyListProvider extends ChangeNotifier {
  List<String> _myList = [];

  List<Pelicula> listaPelis = [];

  List<String> get myList => _myList;

  MyListProvider() {
    setPreference();
  }

  Future<void> setId(Pelicula pelicula) async {
    //SharedPreferences preferences = await SharedPreferences.getInstance();

    if (_myList.contains(pelicula.id)) {
      _myList.removeWhere((element) => element == pelicula.id);
      listaPelis.removeWhere((element) => element == pelicula);
      // preferences.setStringList(
      //     'myList', listaPelis.map((e) => jsonEncode(e)).toList());
    } else {
      _myList.add(pelicula.id);
      listaPelis.add(pelicula);
      // preferences.setStringList(
      //     'myList', listaPelis.map((e) => jsonEncode(e)).toList());
    }
    notifyListeners();
  }

  Icon myListIcon(String id) {
    IconData icon;

    if (_myList.contains(id)) {
      icon = Icons.bookmark;
    } else {
      icon = Icons.bookmark_border;
    }
    return Icon(icon);
  }

  Future<void> setPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences?.getStringList('myList')?.isEmpty ?? true) {
      preferences.setStringList('myList', []);
    } else {
      listaPelis = preferences.getStringList('myList').map(
        (e) {
          return Pelicula.fromMyJson(jsonDecode(e));
        },
      ).toList();
    }
  }

  // crear() {
  //   _myList.map(
  //     (e) {
  //       listaPelis.contains(e)
  //           ? listaPelis.add(obtenerPorId(e))
  //           : listaPelis = listaPelis;
  //     },
  //   );
  // }

  // obtenerPorId(id) {
  //   // dio
  //   // return Pelicula
  // }
}
