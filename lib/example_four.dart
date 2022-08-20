import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'example_five.dart';

class examplefour extends StatefulWidget {
  const examplefour({Key? key}) : super(key: key);

  @override
  State<examplefour> createState() => _examplefourState();
}

class _examplefourState extends State<examplefour> {
  var data;
  Future<void>getapi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
     if(response.statusCode==200){
       data= jsonDecode(response.body.toString());
     }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text("Without plugin fetch Api") ,
      ),
      body: Column(
        children: [
          Expanded(child: FutureBuilder(
            future: getapi() ,
            builder: (context,/*AsyncSnapshot*/ snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Text("Loading");
              }

              return ListView.builder(
                  //itemCount: snapshot.data!.length,
                itemCount: data.length,
                  itemBuilder: (context,index){
                return Card(
                  child: Column(
                    children: [
                      reusable(title:'name', value: data[index]['name'].toString()),
                      reusable(title:'username', value: data[index]['username'].toString()),
                      reusable(title:'address', value: data[index]['address']['street'].toString()),
                      reusable(title:'address', value: data[index]['address']['geo'].toString()),

                    ],
                  ),
                );

              }

              );
            }

          )
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 17.80),
            child: Container(
                color: Colors.black,
                height:48,
                width: 100,
                alignment: Alignment.center,


                //  flex: 1,
                child: Column(
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LastExampleScreen()));
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                            backgroundColor: Colors.amber,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            fixedSize: Size(100,48)
                          // maximumSize: Size(100, 48)
                        )

                    ),

                  ],
                )),
          )

        ],
      ),

    );
  }
}
class reusable extends StatelessWidget {
  String title,value;
   reusable({Key? key, required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(value)
          ],
        ),
      ),
    );
  }
}

