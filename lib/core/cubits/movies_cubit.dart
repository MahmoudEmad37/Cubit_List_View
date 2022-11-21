import 'package:cubit_list_view/core/cubits/movies_state.dart';
import 'package:cubit_list_view/core/models/movie.dart';
import 'package:cubit_list_view/core/services/movie_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({required this.repository}) : super(MoviesInitial());
  final MoviesServices repository;
  List<Movie>? movies;

  void getMovies() async {
    emit(MoviesLoading());
    try {
       movies= await repository.getMovies();
      emit(MoviesSuccess(movies!));
    } on Exception catch (e) {
      emit(MoviesFailure(e));
    }
  }
}
