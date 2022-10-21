import 'dart:async';
import 'dart:html';
import 'package:movie_app/model/Media.dart';
import 'package:movie_app/common/HttpHandler.dart';

abstract class MediaProvider {
  Future<List<Media>> fetchMedia();
}

class MoviesProvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia() {
    return _client.fetchMovies();
  }
}

class SeriesProvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia() {
    return _client.fetchSeries();
  }
}

enum MediaType { movie, serie }
