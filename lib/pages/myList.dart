import 'package:addicts_movies/pages/peliculas.dart';
import 'package:addicts_movies/service/myList_servicio.dart';
import 'package:addicts_movies/widgets/myList_w.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyListProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'My List',
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ),
          backgroundColor: Color(0xff445a6f),
        ),
        backgroundColor: Color(0xff2b4056),
        body: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 25.0,
                //crossAxisAlignment: WrapCrossAlignment.end,
                //alignment: WrapAlignment.end,
                children: List.generate(
                  value.listaPelis.length,
                  (index) => MyListWidget(
                    value.listaPelis[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// itemCount: value.listaPelis.length,
//   itemBuilder: (context, index) =>
//    MyListWidget(value.listaPelis[index]),