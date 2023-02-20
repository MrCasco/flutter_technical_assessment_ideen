import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String title,
      rating,
      plot,
      poster,
      release,
      genre,
      actors,
      director,
      boxOffice;

  const MovieDetailsScreen(
      {super.key,
      required this.title,
      required this.rating,
      required this.plot,
      required this.poster,
      required this.release,
      required this.genre,
      required this.actors,
      required this.director,
      required this.boxOffice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 0.0),
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(
                      poster,
                      height: 350,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 60.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _movieFact('Release Date', release),
                          _movieFact('Movie Plot', plot),
                          _movieFact('Director', director),
                          _movieFact('Actors', actors),
                          _movieFact('Rotten Tomatoes Rating', rating),
                          _movieFact('Genre', genre),
                          _movieFact('Box Office', boxOffice),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _movieFact(label, value) {
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: '$label:\n',
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          TextSpan(
              text: '$value\n',
              style:
                  const TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}
