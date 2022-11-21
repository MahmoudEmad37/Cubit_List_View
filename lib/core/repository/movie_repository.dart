
import 'package:cubit_list_view/core/models/movie.dart';


class MoviesRepository {
  int? page;
  int? totalMovies;
  int? totalPages;
  List<Movie>? movies;

  MoviesRepository({this.page, this.totalMovies, this.totalPages, this.movies});

  MoviesRepository.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalMovies = json['total_results'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      movies = [];
      json['results'].forEach((v) {
        movies!.add(new Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_results'] = this.totalMovies;
    data['total_pages'] = this.totalPages;
    if (this.movies != null) {
      data['results'] = this.movies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
