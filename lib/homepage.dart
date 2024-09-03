import 'package:flutter/material.dart';
import 'package:pookienews/all_news.dart';
import 'package:pookienews/breaking_news.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Pookie News",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.deepOrangeAccent,
            bottom: const TabBar(tabs: [
              Tab(
                text: "Breaking News",
              ),
              Tab(text: "All News"),
            ]),
          ),
          body: const TabBarView(children: [
            BreakingNews(),
            AllNews(),
          ]),
        ));
  }
}
