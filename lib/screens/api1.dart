import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/data1_model.dart';

Future<List<Post>> fetchPost() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => Post.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class api1 extends StatefulWidget {
  @override
  _api1State createState() => _api1State();
}


class _api1State extends State<api1> {
  late Future<List<Post>> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch Data Example',
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
        title: Text('api 1'),
        backgroundColor: Colors.green,
        leading: InkWell(
          child: Icon( Icons.arrow_back_ios, color: Color.fromARGB(255, 241, 15, 15),  ),
          onTap: () {
            Navigator.pop(context);
          } ,
        ) ,
      ),
        body: FutureBuilder<List<Post>>(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  child: Container(
                    
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 4, 242, 123),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.s,paceAround,
                        //   children: [
                        //     Text("${snapshot.data![index].postId}"),
                            
                        //     Text("${snapshot.data![index].id}"),
                        //   ],
                        // ),
                            
                        Text("${snapshot.data![index].body}",style: TextStyle(fontSize: 8.0, fontWeight: FontWeight.bold,)), 
                        SizedBox(height: 20),
                        Text("${snapshot.data![index].id}",style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,)),
                        SizedBox(height: 20),
                        // Text("${snapshot.data![index].body}"),
                        
                        // Image.network('${snapshot.data![index].url}'),
                         
                      ],
                      
                    ),
                  ),
                ),
                
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}





