import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_task_game/model.dart';
import 'package:http/http.dart' as http;


class QuestionAnswerPage extends StatefulWidget {
  const QuestionAnswerPage({Key? key}) : super(key: key);

  @override
  State<QuestionAnswerPage> createState() => _QuestionAnswerPageState();
}

class _QuestionAnswerPageState extends State<QuestionAnswerPage> {
  late Questions questions;
  bool isDataLoaded=false;
  String errorMessage='';
  
  Future<Questions?> getDataFromApi()async{
    Uri uri=Uri.parse('https://herosapp.nyc3.digitaloceanspaces.com/quiz.json');
    var response = await http.get(uri);

    if(response.statusCode==200){
      Questions? questions = questionsFromJson(response.body);
      setState(() {
        isDataLoaded=true;
      });
      return questions;
    }
    else{
      errorMessage = '${response.statusCode}: ${response.body}';
      return Questions(questions: []);
    }
  }
  callAPIandAssignData()async{
    questions=(await getDataFromApi())!;
  }
   @override
   void initState(){
    callAPIandAssignData();
    super.initState();
   }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz"),backgroundColor: Color(0xFF01072A),
      centerTitle: true,
      ),
      body: isDataLoaded ? errorMessage.isNotEmpty ? Text(errorMessage)
     // : questions.questions.isEmpty ? Text('No Data')
      : ListView.builder(
              itemCount: questions.questions?.length,
          itemBuilder: (context, index)=> getRow(index),
      ) : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
  Widget getRow(int index){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:<Widget> [
          Row(children: [
            Container(
                padding:EdgeInsets.only(left: 53,top: 30),
                child: Text('Question: ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            Container(
                padding:EdgeInsets.only(left: 80,top: 30),
                child: Text('Score: ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
          ],),
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color:Color(0xFF101721), ),
            // color: Color(0xFFB3F5F0),
            height: 350,
            width: 350,
            child: Card(
              child: Column(
                children: [
                 // Text('$score Point',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                  SizedBox(height: 10,),
                  Text("${questions.questions![index]?.score} Point",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xFF101721) ), ),
                 // Spacer(),
                  SizedBox(height: 30,),
                  SizedBox(height: 100,width: 100,
                      child: Image.network("${questions.questions![index]?.questionImageUrl ?? 'Null' }",fit: BoxFit.fill,)),
                 // ),
                  // Image.network(item?.questionImageUrl ?? 'Null'),
                  SizedBox(height: 50,width: 300,),
                 // Text("${item?.question ?? ''}")
                  // Text("${item?.question![index]}")
                  Text("${questions.questions![index]?.question}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xFF101721),)),
                ],
              ),
            ),
          ),
          SizedBox(height: 50,),
          Column(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color:Color(0xFF101721), ),
                  // color: Color(0xFFB3F5F0),
                  height: 40,
                  width: 320,
                  child: Center(child: Text('${questions.questions![index]?.answers?.a}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,)))),
              SizedBox(height: 10,),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color:Color(0xFF101721), ),
                  height: 40,
                  width: 320,
                  child: Center(child: Text('${questions.questions![index]?.answers?.b}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,)))),
              SizedBox(height: 10,),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color:Color(0xFF101721), ),
                  height: 40,
                  width: 320,
                  child: Center(child: Text('${questions.questions![index]?.answers?.c}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,)))),
              SizedBox(height: 10,),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color:Color(0xFF101721), ),
                  height: 40,
                  width: 320,
                  child: Center(child: Text('${questions.questions![index]?.answers?.d}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,)))),
            ],
          )
        ],
      ),
    );

    //   Card(
    //   child: Center(
    //     child: ListTile(
    //       leading: questions.questions![index]?.questionImageUrl == null ?
    //       Icon(Icons.cabin): Image.network("${questions.questions![index]?.questionImageUrl}",fit: BoxFit.fill,),
    //       // leading:  Image.network("${questions.questions![index]?.questionImageUrl}",fit: BoxFit.fill,),
    //       title: Text("${questions.questions![index]?.question}"),
    //       subtitle: Text("${questions.questions![index]?.correctAnswer}"),
    //     ),
    //   ),
    // );
  }
}
