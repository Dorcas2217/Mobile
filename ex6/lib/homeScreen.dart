import 'package:ex6/models/photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum  FetchState { loading, error, done}

class _HomeScreenState extends State<HomeScreen> {
  List<Photo> listPic = [];
  String state = FetchState.loading.name;

  Future<List<dynamic>> _getPictures() async{

    var response = await Photo.fetchAllPhotos();

    if(response.isNotEmpty){
      listPic.addAll(response);
      print(listPic);

      state = FetchState.done.name;
      return listPic.reversed.toList();
    }else{
      state = FetchState.error.name;
      throw Exception('Failed to load data');
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(" Exercice 6 Photo")),
      body: FutureBuilder<List<dynamic>>( // la future builder n'est appelé qu'une seule fois
        future: Future.delayed(const Duration(seconds: 1 ), ()=> _getPictures() ),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, i) => PhotoRow(photo: snapshot.data?[i]),
            );
          } else if(snapshot.hasError){
           return Column(children: [Expanded(child: Center(child:  Text(snapshot.error.toString())))]);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },

      ),
    );
  }
}

class PhotoRow extends StatelessWidget {
  final Photo photo ;

  const PhotoRow({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Image.network(
             photo.thumbnailUrl,
             width: 150,
             height: 150,
             fit: BoxFit.cover,
           ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                    Text(
                      photo.id,
                      style: const TextStyle(fontSize: 10),
                    ),

                    const SizedBox(height: 15),
                    Text(photo.title,
                    style: const TextStyle(fontSize: 20),
                    )
                ],
              ))
        ],
      ),
    );
  }
}
