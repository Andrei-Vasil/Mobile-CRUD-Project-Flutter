import 'package:crup_app_v2/model/repository.dart';
import 'package:crup_app_v2/cat_card.dart';
import 'package:flutter/material.dart';

import './database/database.dart';
import 'add_update_screen.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database =
      await $FloorAppDatabase.databaseBuilder('flutter_database.db').build();
  final dao = database.catDao;

  Repository.dao = dao;

  runApp(
    MaterialApp(
      routes: {
        '/': (context) => const MyApp(),
        '/add_update': (context) => const AddUpdateScreen()
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Repository feedRepository = repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Expanded(
            child: FutureBuilder(
                future: repository.catList,
                builder: (context, snapshot) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var currentCat = snapshot.data![index];
                        print("[========================================]");
                        print(index.toString() + " " + currentCat.id);
                        print("[========================================]");
                        return Dismissible(
                            onDismissed: (direction) {
                              setState(() {
                                repository.deleteCatById(currentCat.id);
                                feedRepository = repository;
                              });
                            },
                            key: UniqueKey(),
                            child: CatCard(
                              cat: currentCat,
                              onTap: () async {
                                await Navigator.pushNamed(
                                    context, '/add_update',
                                    arguments: {CAT_KEY: currentCat.id});
                                setState(() {
                                  feedRepository = repository;
                                });
                              },
                            ));
                      });
                }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add_update',
              arguments: {CAT_KEY: ""});
          setState(() {
            feedRepository = repository;
          });
        },
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
      ),
    );
  }
}
