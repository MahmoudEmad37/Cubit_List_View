import 'package:cubit_list_view/core/models/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  Movie movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      shadowColor: Colors.blue,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            HeaderRow(movieName: movie.originalTitle.toString()),
            const Divider(color: Colors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextColumn(title1:"ID", text1: movie.id.toString(), title2: "Vote Count", text2: movie.voteCount.toString()),
                const SizedBox(width: 8,),
                TextColumn(title1:"Date Time", text1: movie.date.toString(), title2: "Title", text2: movie.title.toString()),
              ],
            )

          ],
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  const HeaderRow({
    Key? key,
    required this.movieName,
  }) : super(key: key);

  final String movieName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.local_movies,
          color: Colors.blue,
          size: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          movieName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }
}

class TextColumn extends StatelessWidget {
  const TextColumn({
    Key? key,
    required this.title1,
    required this.text1,
    required this.title2,
    required this.text2,
  }) : super(key: key);

  final String title1;
  final String text1;
  final String title2;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderSub(title:title1,text:text1),
        HeaderSub(title:title2,text:text2),
      ],
    );
  }

  Column HeaderSub({required String title,required String text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12,color: Colors.grey),
          ),
          const SizedBox(width: 5,),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      );
  }
}
