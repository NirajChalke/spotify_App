import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/models/Music.dart';
import 'package:spotify_app/pages/Liberary.dart';
import 'package:spotify_app/pages/home.dart';
import 'package:spotify_app/pages/search.dart';

class app extends StatefulWidget {
  const app({super.key});

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  
  
 var Tabs = [];
  AudioPlayer _audioplayer = new AudioPlayer();
  bool isplaying = false;
  int currentTabIndex = 0;
  Music? music;
  Widget miniPlayer(Music? music, {bool stop = false}) {
    this.music = music;
    
   

    if (music == null) {
      return SizedBox();
    }
    if (stop) {
      isplaying=false;
      _audioplayer.stop();
    }
     setState(() {});

    Size devicesize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.pink.shade900,
            Colors.pink.shade900,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      height: 70,
      width: devicesize.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.network(
          music.imageURL,
          fit: BoxFit.contain,
        ),
        Text(
          music.name,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        IconButton(
          onPressed: () async {
            isplaying = !isplaying;
            UrlSource source = UrlSource(music.audioURL);
            await _audioplayer.setSource(source);
            if (isplaying) {
              await _audioplayer.play(source);
            } else {
              await _audioplayer.pause();
            }
            setState(() {});
          },
          icon: isplaying
              ? Icon(Icons.pause, color: Colors.white)
              : Icon(Icons.play_arrow_sharp, color: Colors.white),
        ),
      ]),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Tabs = [
      Home(miniPlayer),
      search(),
      Liberary(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Tabs[currentTabIndex],
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              miniPlayer(music),
              BottomNavigationBar(
                  currentIndex: currentTabIndex,
                  onTap: (currenttIndex) {
                    print('Currentindex is $currenttIndex');
                    currentTabIndex = currenttIndex;
                    setState(() {});
                  },
                  selectedItemColor: Colors.white,
                  backgroundColor: Colors.blueGrey.shade700,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home,
                        ),
                        label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.search,
                        ),
                        label: 'Search'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.library_music_outlined,
                        ),
                        label: 'Your Liberary'),
                  ]),
            ],
          ),
        ));
  }
}
