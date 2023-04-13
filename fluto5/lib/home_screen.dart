import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'models/film.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum FetchState { loading, error, done }

class _HomeScreenState extends State<HomeScreen> {
  var state = FetchState.loading;
  var message = "Loading…";
  Film? film;

  Future<void> _initFilm() async {
    try {
      var response = await Film.fetchFilm(2);
      setState(() {
        state = FetchState.done;
        film = response;
      });
    } catch (error) {
      setState(() {
        state = FetchState.error;
        message = error.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _initFilm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tutoriel 5")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: state != FetchState.done
            ? Column(children: [Center(child: Text(message))])
            : FilmRow(film: film!),
      ),
    );
  }
}



class FilmRow extends StatelessWidget {
  final Film film;

  const FilmRow({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(film.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Directed by ${film.director} - ${film.duration} minutes"),
          InkWell(
            onTap: () => launchUrl(Uri.parse(film.link)),
            child: Text(film.link),
          )
        ],
      ),
    );
  }
}

