import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviesapp/models/Movie.dart';

const APIKEY = "<Your api key here>";

Future<List<Movie>> searchMovies(keyword) async {
  final response =
      await http.get('http://www.omdbapi.com/?apikey=$APIKEY&s=$keyword');

  if (response.statusCode == 200) {
    Map data = json.decode(response.body);

    if (data['Response'] == "True") {
      var list = (data['Search'] as List)
          .map((item) => new Movie.fromJson(item))
          .toList();
      return list;
    } else {
      throw Exception(data['Error']);
    }
  } else {
    throw Exception('Something went wrong !');
  }
}

Future<Movie> getMoviw(movieId) async {
  final response =
      await http.get('http://www.omdbapi.com/?apikey=$APIKEY&i=$movieId');

  if (response.statusCode == 200) {
    Map data = json.decode(response.body);
    if (data['Response'] == "True") {
      return null;
    } else {
      throw Exception(data['Error']);
    }
  } else {
    throw Exception('Something went wrong !');
  }
}
