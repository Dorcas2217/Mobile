import 'package:ex6/models/photo.dart';
import 'package:ex6/view_model/photo_view.dart';
import 'package:flutter_loading_animation_kit/flutter_loading_animation_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum  FetchState { loading, error, done}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<PhotoView>(context, listen: false).getListPicture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(" Exercice 6 Photo")),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/photo"),
        child: const Icon(Icons.add),
      ),
      body: Consumer<PhotoView>(
          builder: (context, viewModel, child) {
            var getPictures = viewModel.getListPicture();
    return FutureBuilder<List<dynamic>>( // la future builder n'est appelé qu'une seule fois
    future: Future.delayed(const Duration(seconds: 4 ), ()=> getPictures),
    builder: (context, snapshot) {
        if(snapshot.hasData){
        return ListView.builder(
        itemCount: snapshot.data?.length,
        itemBuilder: (context, i) => PhotoRow(photo: snapshot.data?[i]),
        );
        } else if(snapshot.hasError){
        return Column(children: [Expanded(child: Center(
            child: Text(snapshot.error.toString())))]);
        } else {
        return const Center(
          child: FourCirclePulse(
            circleColor: Colors.blue, //The color of the circles
            dimension: 48.0, // The size of the widget.
            turns: 2, //Turns in each loop
            loopDuration: Duration(seconds: 1), // Duration of each loop
            curve: Curves.linear, //Curve of the animation
          ),
        );
        }
        },
    );
    }),
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
          Flexible(child:
           Image.network(
             photo.thumbnailUrl ?? "null",
             width: 150,
             height: 150,
             fit: BoxFit.cover,
           )
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                    Text(
                      photo.id.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 15),
                    Text(photo.title ?? "null",
                    style: const TextStyle(fontSize: 20),
                    )
                ],
              ))
        ],
      ),
    );
  }
}
