import 'package:flutter/material.dart';
import 'package:study_base_flutter/api.dart';
import 'package:study_base_flutter/models/featuredmoviemodel.dart';
import 'package:study_base_flutter/models/genremodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<FeaturedMovieModel>> featuredMovies;
  late Future<List<GenreModel>> genreList;
  late Api _api;

  @override
  void initState() {
    super.initState();
    _api = Api();
    featuredMovies = _api.getFeaturedMovies();
    genreList = _api.getGenreList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "MouseFlix",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Text('Profile Screen'),
            ),
          ],
        ),
      ),
    ));
  }
}
