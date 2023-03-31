import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/article.dart';
import '../view_model/var_etat.dart';



class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;
    final widget =  Provider.of<VarEtat>(context, listen : false);
// TODO F06 get article from route argument
    return Scaffold(
      appBar: AppBar(
        title: const Text("Article"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // TODO F06 go back
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: article.read
            ? const Icon(Icons.check_box)
            :const Icon(Icons.check_box_outline_blank) ,

        onPressed: () => widget.changeRead(article) , // TODO F07 mark as read
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              article.author,
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Text(article.content, textAlign: TextAlign.justify),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
