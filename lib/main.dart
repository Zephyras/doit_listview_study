import 'package:flutter/material.dart';
import 'package:doit_listview_example/sub/firstPage.dart';
import 'package:doit_listview_example/sub/secondPage.dart';

import 'animalItem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  //탭선언
  TabController controller;

  //동물정보 리스트
  List<Animal> animalList = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);

    animalList.add(
        Animal(animalName: "벌", kind: "곤충", imagePath: "repo/images/bee.png"));
    animalList.add(
        Animal(animalName: "고양이", kind: "포유류", imagePath: "repo/images/cat.png"));
    animalList.add(
        Animal(animalName: "젓소", kind: "포유류", imagePath: "repo/images/cow.png"));
    animalList.add(
        Animal(animalName: "강아지", kind: "포유류", imagePath: "repo/images/dog.png"));
    animalList.add(
        Animal(animalName: "여우", kind: "포유류", imagePath: "repo/images/fox.png"));
    animalList.add(
        Animal(animalName: "원숭이", kind: "영장류", imagePath: "repo/images/monkey.png"));
    animalList.add(
        Animal(animalName: "돼지", kind: "포유류", imagePath: "repo/images/pig.png"));
    animalList.add(
        Animal(animalName: "늑대", kind: "포유류", imagePath: "repo/images/wolf.png"));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Example'),
      ),
      body: TabBarView(
        children: <Widget>[
          FirstApp(list: animalList),
          SecondApp(list: animalList),
        ],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        tabs: <Tab>[
          Tab(
            icon: Icon(Icons.looks_one, color: Colors.blue),
          ),
          Tab(
            icon: Icon(Icons.looks_two, color: Colors.blue),
          ),
        ],
        controller: controller,
      ),
    );
  }

  //생명주기 객체 소멸 함수
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

