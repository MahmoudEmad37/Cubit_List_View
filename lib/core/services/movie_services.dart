import 'dart:convert';

import 'package:cubit_list_view/core/models/movie.dart';
import 'package:cubit_list_view/core/repository/movie_repository.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MoviesServices {
  final String apiKey = "80367895764221c114f8a230ba7d0e9b";
  static String mainUrl =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=80367895764221c114f8a230ba7d0e9b&language=en-US&page=1";

  Future<List<Movie>> getMovies() async {
    MoviesRepository moviesRepository;
    var url = Uri.parse(mainUrl);
    Response response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    moviesRepository =  MoviesRepository.fromJson(responsebody);
    return moviesRepository.movies ?? [];
    // if (response.statusCode == 200) {
    //   print(response.body);
    //   var responsebody = jsonDecode(response.body)['results'];
    //   for (var i in responsebody) {
    //     print(i);
    //     movies.add(Movie.fromJson(jsonDecode(i)));
    //     //   (
    //     //   id: i['id'],
    //     //   popularity: i['popularity'],
    //     //   overview: i['overview'],
    //     //   date: i['release_date'],
    //     //   title: i['original_title'],
    //     //   rating: i['vote_average'],
    //     //   votCount: i['vote_count'],
    //     //   name: i['title'],
    //     // ));
    //   }
    //   return movies;
    // } else {
    //   throw Exception('Failed to load movies');
    // }
  }
}
