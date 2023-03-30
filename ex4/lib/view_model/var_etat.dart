import 'package:flutter/material.dart';

import '../model/article.dart';

class VarEtat extends ChangeNotifier{
  var articles = defaultArticles;

  bool _displayArticles = false;

  bool get displayArticlesLues => _displayArticles;

  Article getArticle(id){
    return articles[id];
  }

  void addArticle(Article article){
    articles.add(article);
    notifyListeners();
  }

  void deleteArticle(Article article){
    articles.delete(article);
    notifyListeners();
  }

  void setArticleLue(){
   _displayArticles = !_displayArticles;
   notifyListeners();
  }

  List getListArticle(){

    return articles;
  }


}