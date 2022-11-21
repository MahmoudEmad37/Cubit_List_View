import 'package:cubit_list_view/core/models/movie.dart';


abstract class MoviesState{
  const MoviesState();
}

class MoviesInitial extends MoviesState {}
class MoviesLoading extends MoviesState {}
class MoviesSuccess extends MoviesState {
  List<Movie> movies;
  MoviesSuccess(this.movies);
}
class MoviesFailure extends MoviesState {
  final String message ="Something went wrong please try again";
  MoviesFailure(e){
    print("Errors is : "+e);
  }
}

