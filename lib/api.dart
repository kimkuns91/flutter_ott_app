import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:study_base_flutter/models/featuredmoviemodel.dart';
import 'package:study_base_flutter/models/moviemodel.dart';

import 'models/genremodel.dart';

class Api {
  var httpClient = http.Client();

  static const url = "api.themoviedb.org";
  static const apiKey = "7d6e4fe2b9ff796e960c86590ca5a1bc";

  Future<List<GenreModel>> getGenreList() async {
    final response = await http.get(
      Uri.https(
        url,
        '/3/genre/movie/list?api_key=$apiKey',
      ),
    );

    if (response.statusCode == 200) {
      final parsed =
          json.decode(response.body)['genres'].cast<Map<String, dynamic>>();

      return parsed
          .map<GenreModel>((json) => GenreModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<List<FeaturedMovieModel>> getFeaturedMovies() async {
    final response = await http.get(
      Uri.https(
        url,
        '/3/trending/movie/day?api_key=$apiKey',
      ),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final parsed =
          json.decode(response.body)['results'].cast<Map<String, dynamic>>();
      print(parsed);
      return parsed
          .map<FeaturedMovieModel>((json) => FeaturedMovieModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load featured movies');
    }
  }

  Future<MovieModel> getMovieInfo(int movieId) async {
    final response = await http.get(
      Uri.https(
        url,
        '/3/movie/$movieId?api_key=$apiKey',
      ),
    );

    if (response.statusCode == 200) {
      return MovieModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Movie Information');
    }
  }
}
