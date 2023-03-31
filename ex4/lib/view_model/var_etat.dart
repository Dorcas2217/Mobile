import 'dart:collection';
import 'dart:html';
import 'dart:js_util';

import 'package:flutter/material.dart';

import '../model/article.dart';

class VarEtat extends ChangeNotifier{
  var articles = defaultArticles;

 // UnmodifiableListView<Article> get articles => UnmodifiableListView(_articles);

  bool _displayReadArticle = true;

  bool get displayArticleLue => _displayReadArticle;

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
   _displayReadArticle = !_displayReadArticle;
   notifyListeners();
  }

  void changeRead(Article article ){
    for(Article a in  articles) {
      if(a.id == article.id) a.read =!a.read;
    }
    notifyListeners();
  }

  List<Article> getListArticle(){
    List<Article> list = [];

      for(Article a in articles) {
        if(a.read ){
          list.add(a);
        }
      }

    return (_displayReadArticle) ? articles : list ;
  }


}