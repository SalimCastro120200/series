import 'package:movie_app/common/Util.dart';

class Media {
  int id;
  double voteAverage;
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDate;
  List<dynamic> genreIds;

  String getPosterUrl() => getMediumPictureUrl(posterPath);
  String getBackDropUrl() => getLargePictureUrl(backdropPath);
  String getGenres() => getGenreValues(genreIds);

  factory Media(Map jsonMap) {
    try {
      return new Media.deserealize(jsonMap);
    } catch (ex) {
      throw ex;
    }
  }

  Media.deserealize(Map json)
      : id = json["id"].toInt(),
        voteAverage = json["vote_average"].toDouble(),
        title = json["name"],
        posterPath = json["poster_path"] ?? "",
        backdropPath = json["backdrop_path"] ?? "",
        overview = json["overview"],
        releaseDate = json["first_air_date"],
        genreIds = json["genre_ids"].toList();
  // Media.deserealize(Map json)
  //     : id = json["id"].toInt(),
  //       voteAverage = json["vote_average"].toDouble(),
  //       title = json["title"],
  //       posterPath = json["poster_path"] ?? "",
  //       backdropPath = json["backdrop_path"] ?? "",
  //       overview = json["overview"],
  //       releaseDate = json["release_date"],
  //       genreIds = json["genre_ids"].toList();
}