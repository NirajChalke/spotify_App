
import 'dart:ui';

import 'package:spotify_app/models/Music.dart';
import 'package:spotify_app/models/category.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/pages/settings.dart';
import 'package:spotify_app/services/Music_operation.dart';
import 'package:spotify_app/services/category_operation.dart';
import 'package:spotify_app/pages/settings.dart';

class Home extends StatelessWidget {
  Function _miniPlayer;
  Home(this._miniPlayer);

  Widget createcategory(Category category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blueGrey.shade700),
        child: Row(
          children: [
            Image.network(
              category.imageURL,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category.name,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> createListOfCategory() {
    List<Category> categoryList = CategoryOperation.getcategories();
    List<Widget> categories = categoryList
        .map((Category category) => createcategory(category))
        .toList();
    return categories;
  }

  creatAppbar(String message, BuildContext context) {
    return AppBar(
      title: Text(
        message,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      actions: [IconButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>settings()));
      }, icon: Icon(Icons.settings))],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  creatgrid() {
    return Padding(
      padding: const EdgeInsets.only(left: 11, right: 11),
      child: SizedBox(
        height: 240,
        child: GridView.count(
          childAspectRatio: 5 / 2,
          crossAxisCount: 2,
          crossAxisSpacing: 0.4,
          mainAxisSpacing: 0.4,
          children: createListOfCategory(),
        ),
      ),
    );
  }

  Widget createMusic(Music music) {
    return Padding(
      padding: const EdgeInsets.only(right: 11, left: 11),
      child: Container(
        height: 320,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                _miniPlayer(music,stop:true);
              },
              child: Image.network(
                music.imageURL,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              music.name,
              style: TextStyle(color: Colors.white,fontSize: 15),
            ),
            Text(
              music.desc,
              style: TextStyle(color: Colors.grey.shade600),
            )
          ],
        ),
      ),
    );
  }

  Widget createListOfMusic() {
    List<Music> musiclist = MusicOperation.getmusic();
    return Container(
      height: 200,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return createMusic(musiclist[index]);
        },
        itemCount: musiclist.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff537895),
          Color(0xff09203f),
          Color(0xff09203f),
          Color(0xff09203f)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: ListView(children: [
          Column(
            children: [
              creatAppbar("Good morning",context),
              SizedBox(
                height: 0.001,
              ),
              creatgrid(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Made For You",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              createListOfMusic(),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Popular Playlist",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
             createListOfMusic(),
              
            ],
          ),
        ]));
  }
}
