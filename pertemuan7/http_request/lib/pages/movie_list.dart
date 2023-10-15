import 'package:flutter/material.dart';
import 'package:http_request/pages/movie_detail.dart';
import 'package:http_request/service/http_service.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int? moviesCount;
  List? movies;
  HttpService? service;

  Future initialize() async {
    movies = [];
    movies = await service?.getPopularMovies();
    setState(
      () {
        moviesCount = movies?.length;
        movies = movies;
      },
    );
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // service!.getPopularMovies().then(
    //       (value) => {
    //         setState(
    //           () {
    //             result = value!;
    //           },
    //         )
    //       },
    //     );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: ListView.builder(
        itemCount: (moviesCount == null) ? 0 : moviesCount,
        itemBuilder: (context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              title: Text(movies?[position].title),
              subtitle: Text(
                'Rating = ${movies?[position].voteAverage}',
              ),
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (_) => MovieDetail(movies?[position]),
                );
                Navigator.push(context, route);
              },
            ),
          );
        },
      ),
    );
  }
}
