import 'package:addicts_movies/models/clase_Pelicula.dart';
import 'package:addicts_movies/service/myList_servicio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyListBtn extends StatefulWidget {
  const MyListBtn({Key? key, required this.pelicula}) : super(key: key);
  final Pelicula pelicula;

  @override
  _MyListBtnState createState() => _MyListBtnState();
}

class _MyListBtnState extends State<MyListBtn> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyListProvider>(context);
    return IconButton(
      icon: provider.myListIcon(widget.pelicula.id),
      color: Color(0xff8e9ca8),
      iconSize: 40.0,
      onPressed: () {
        provider.setId(widget.pelicula);
      },
    );
  }
}
