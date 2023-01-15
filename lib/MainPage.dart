import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'QuestionAnswerPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gorgeous Bangladesh"),
        centerTitle: true,
        backgroundColor: Color(0xFF01072A),
      ),
      body: Column(
        children: [
          Center(
            child: Text("High Score: ",
              style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 20,color: Color(0xFF01072A)),),
          ),
          OutlinedButton(onPressed: (){
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return QuestionAnswerPage();
                  },
                ),
              );
            };
          },
              child: Text("Start New Game"))
        ],
      ),
    );
  }
}
