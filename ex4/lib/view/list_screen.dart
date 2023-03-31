
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/article.dart';
import '../view_model/var_etat.dart';



class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
                      // TODO F07 get state from view model
                     // TODO F07 get state from view model
    return Scaffold(
      appBar: AppBar(
        title: const Text("Articles"),
        actions: [
          Consumer<VarEtat>(
              builder: (context, viewModel, _) =>
          IconButton(
            icon : viewModel.displayArticleLue
                ? const Icon(Icons.check_box)
                : const Icon(Icons.check_box_outline_blank),
            onPressed: () => viewModel.setArticleLue(), // TODO F07 show/hide read articles
          ),
          ),
          IconButton(icon: const Icon(Icons.abc), onPressed: () {}),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/form"), // TODO F06 go to create screen
        child: const Icon(Icons.add),
      ),
      body:
      Consumer<VarEtat>(
          builder: (context, viewModel, child) {
            var articles = viewModel.getListArticle();
      return   Padding(
        padding: const EdgeInsets.all(32.0),
        child: articles.isEmpty
            ? const Center(
                child: Text("There are no articles yet. Create one!"),
              )
            : ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  var article = articles[index];
                  return Column(
                    children: [
                      ListTile(
                        leading: IconButton(
                          icon: article.read
                              ? const Icon(Icons.check_box)
                              : const Icon(Icons.check_box_outline_blank),
                          onPressed: () => viewModel.changeRead(article), // TODO F07 mark as read
                        ),
                        title: Text(article.title),
                        subtitle: Text(article.author),
                        onTap: () => Navigator.pushNamed(context, "/article", arguments: article), // TODO F06 go to article
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => viewModel.deleteArticle(article), // TODO F07 delete article
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
      );
    }),
    );
  }
}
