
import 'package:cubit_list_view/core/cubits/movies_cubit.dart';
import 'package:cubit_list_view/core/cubits/movies_state.dart';
import 'package:cubit_list_view/presentation/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    BlocProvider.of<MoviesCubit>(context).getMovies();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Movies App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        leading: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(
            Icons.movie_outlined,
            size: 20,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 20,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            if (state is MoviesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MoviesSuccess) {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: MovieCard(movie:state.movies[index]),
                    );
                  },
                ),
              );
            } else if (state is MoviesFailure){
              return Center(
                child:Text(state.message),
              );
            }else {
              return const Center(
                child: Text("The End"),
              );
            }
          },
        ),
      ),
    );
  }
}
