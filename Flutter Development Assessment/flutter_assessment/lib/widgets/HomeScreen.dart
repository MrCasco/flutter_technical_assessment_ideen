import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assessment/screens/MovieDetailsScreen.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('MOVIE DETAILS APP');
  Widget movieInfo = const Text('Search movies!');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);
                  customSearchBar = ListTile(
                    // ignore: prefer_const_constructors
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: TextField(
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: 'Go search a movie!',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      textInputAction: TextInputAction.search,
                      onSubmitted: (movie) async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MovieDetailsScreen(
                                    title: 'Ratatouille',
                                    plot:
                                        'Im a plot loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooool',
                                    rating: '96%',
                                    poster:
                                        'https://www.imdb.com/title/tt0382932/mediaviewer/rm937921792/?ref_=tt_ov_i',
                                    release: 'June 2007',
                                    genre: 'Action',
                                    director: 'John McTiernan',
                                    actors:
                                        'Bruce Willis, Alan Rickman, Bonnie Bedelia',
                                    boxOffice: '\$83,844,093',
                                  )),
                        );
                        /*
                          final res = await _searchMovie(movie);
                          if (res["Title"] != "No movie found!") {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetailsScreen(
                                        title: res["Title"],
                                        plot: res["Plot"],
                                        rating: res["Ratings"][1]["Value"],
                                        poster: res["Poster"],
                                        release: res["Released"],
                                      )),
                            );
                          }
                          */
                      },
                    ),
                  );
                } else {
                  customIcon = const Icon(Icons.search);
                  customSearchBar = const Text('MOVIE DETAILS APP');
                }
              });
            },
            icon: customIcon,
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: movieInfo,
            ),
          ],
        ),
      ),
    );
  }
}

Future<Map<String, dynamic>> _searchMovie(movie) async {
  final response = await http
      .get(Uri.parse('http://www.omdbapi.com/?apikey=2b43933c&t=${movie}'));
  final body = jsonDecode(response.body);

  if (response.statusCode == 200) {
    return body['Response'] == "False" ? {"Title": "No movie found!"} : body;
  } else {
    throw Exception('Failed to load movie');
  }
}
