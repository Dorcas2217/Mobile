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
        state = FetchState.error.name;
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
    return  ListTile(
      title: Text(film.title),
      subtitle: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text("${film.movieBanner} - Director by ${film.director}"
             "\n release in ${film.releaseDate} - running time : ${film.runningTime} "
             "\score : ${film.rtScore} ")
       ],
      ),
       tileColor: Colors.cyan,
    );
  }
}

