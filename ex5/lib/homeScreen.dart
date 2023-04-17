import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/film.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum  FetchState { loading, error, done}

class _HomeScreenState extends State<HomeScreen> {
//var expected = "Loading, please wait...";
List<Film> listFilm = [];
 String  state = FetchState.loading.name;


  Future<void> _initDonnes() async{
    try{
      var reponse = await Film.fetchAllFilms();
      setState(() {
        state = FetchState.done.name;
        listFilm.addAll(reponse);
      });
    } catch(error){
      setState(() {
      //  expected = error.toString();
        state = error.toString();

        print(listFilm);
      });
    }
  }

  @override
  void initState(){
    super.initState();
    _initDonnes();
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text("Tutoriel 5")),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: state == FetchState.done.name ?
       ListView.separated(
        itemCount: listFilm.length,
        itemBuilder: (context, i) => FilmRowww(film: listFilm[i]),
        separatorBuilder: (context, i) => const Divider(),
      ):
      Column(children: [Expanded(child: Center(child:  Text(state)))])
      ,
    ),
  );
}
}


class FilmRowww extends StatelessWidget {
  final Film film ;

  const FilmRowww({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            film.movieBanner,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  film.title,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 8),
                Text(
                  'release in : ${film.releaseDate}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Text(
                  film.rtScore,
                   selectionColor: Colors.deepPurple,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 8),
                Text(
                  'Directed by : ${film.director}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                Text(
                  film.description,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );


  }
}

