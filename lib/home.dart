import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_app/media_list.dart';
import 'package:movie_app/common/MediaProvider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final MediaProvider movieProvider = new MoviesProvider();
  final MediaProvider serieProvider = new SeriesProvider();

  MediaType mediaType = MediaType.movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Movie App 180017",
          style: TextStyle(fontFamily: "Oswald"),
        ),
        backgroundColor: Colors.black12,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      drawer: new Drawer(
          child: new ListView(
        children: <Widget>[
          new DrawerHeader(child: new Material()),
          new ListTile(
            title: new Text("Peliculas"),
            selected: mediaType == MediaType.movie,
            trailing: new Icon(Icons.local_movies),
            onTap: () {
              _changeMediaType(MediaType.movie);
              Navigator.of(context).pop;
            },
          ),
          new Divider(
            height: 5.0,
          ),
          new ListTile(
            title: new Text("Televisión"),
            selected: mediaType == MediaType.serie,
            trailing: new Icon(Icons.live_tv),
            onTap: () {
              _changeMediaType(MediaType.serie);
              Navigator.of(context).pop;
            },
          ),
          new Divider(
            height: 5.0,
          ),
          new ListTile(
            title: new Text("Cerrar"),
            trailing: new Icon(Icons.close),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      )),
      body: new PageView(
        children: <Widget>[new MediaList()],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: _getFooterItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> _getFooterItems() {
    return [
      new BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up), label: ("Populares")),
      new BottomNavigationBarItem(
          icon: Icon(Icons.update), label: ("Proximamente")),
      new BottomNavigationBarItem(
          icon: Icon(Icons.star), label: ("Mejor Valoradas")),
    ];
  }

  void _changeMediaType(MediaType type) {
    if (mediaType != type) {
      setState(() {
        mediaType = type;
      });
    }
  }
}
