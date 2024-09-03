import 'package:flutter/material.dart';
import 'package:pookienews/api_service.dart';
import 'package:pookienews/model/news_model.dart';
import 'package:pookienews/news_item_list.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiService.getAllNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NewsModel> articleslist = snapshot.data ?? [];
            return ListView.builder(
              itemCount: articleslist.length,
              itemBuilder: (context, index) {
                return NewsItemList(newsModel: articleslist[index]);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
