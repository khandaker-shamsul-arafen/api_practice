import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled4/example_three.dart';

import 'model/Post_Model.dart';

class homescreen extends StatefulWidget {
  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  List<PostModel> postlist = [];

  Future<List<PostModel>> getPostapi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      //  var json =response.body;
      for (Map i in data) {
        postlist.add(PostModel.fromJson(i));
      }

      return postlist;
//return postModelFromJson(json);
    } else {
      return postlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Api"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: FutureBuilder(
              future: getPostapi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("loading");
                } else {
                  return ListView.builder(
                    itemCount: postlist.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(postlist[index].userId.toString()),
                            Text(postlist[index].title.toString())
                          ],
                        ),
                      ));
                    },
                  );
                }
              },
            ),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ExampleThree()));
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
