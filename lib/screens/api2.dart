import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import '../model/data2_model.dart';
import '../detail page/detail_2.dart';
import '../detail page/detail_3.dart';



class GenresScreen extends StatefulWidget {
  const GenresScreen({Key? key}) : super(key: key);

  @override
  State<GenresScreen> createState() => _GenresScreenState();
}

class _GenresScreenState extends State<GenresScreen> {
  List<GenresDetails> data = [];

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  getUsers() async {
    if (await ApiManager.checkInternet()) {
      // progress visible
      var request;

      GenresResponse response = GenresResponse.fromJson(
        await ApiManager(context).getCall(
          url: AppStrings.allGenres,
          request: request,
        ),
      );

      //progress hide

      print(response.msg!);

      if (!response.error!) {
        print(response.resultAllGenres!.length);
        data = response.resultAllGenres!;
        if (mounted) setState(() {});
      }
    } else {
      print("No Internet");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 0, 58, 205),
        title: Center(child: Text("episode")),
         actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.home,
        color: Colors.white,
      ),
      onPressed: () {
        // do something
      },
    )
  ],
      ),
      body: body(),
    );
  }

  Widget body() {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        // return GenresItemView(data: data[index]);
        return itemView(index);
      },
    );
  }

  // Widget itemView(int index) {
  //   return Container(
    
  //     child:Card(
  //       color: Color.fromARGB(255, 207, 13, 13),
  //       margin: new EdgeInsets.symmetric(horizontal: 20.0),
        
  //       child: Column(
  //         children: [
  //           Text(data[index].name!),
  //         ],
  //       ),
  //     ) ,
  //   );
  // }















 Widget itemView(int index) {
    return Container(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
    
      child:Card(
        color: Color.fromARGB(255, 84, 172, 201),
        margin:  EdgeInsets.symmetric(horizontal: 20.0),
        child: InkWell(
          child: ListTile(
            
           onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => detail2(catalog: data[index]),
              ),
            ),
            leading: Text(data[index].name!),
          
          ),
         
        ),
      ) , 
    );
  }

}



























class ApiManager {
  BuildContext? context;

  ApiManager(BuildContext context) {
    this.context = context;
  }

  static Future<bool> checkInternet() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  postCall({@required String? url, @required Map? request}) async {
    http.Response response = await http.post(Uri.parse(url!), body: request!);
    return await json.decode(response.body);
  }

  deleteCall({@required String? url}) async {
    http.Response response = await http.delete(Uri.parse(url!));
    return await jsonDecode(response.body);
  }

  getCall(
      {@required String? url, @required Map<String, dynamic>? request}) async {
    var uri = Uri.parse(url!);
    uri = uri.replace(queryParameters: request);
    http.Response response = await http.get(uri);
    return await jsonDecode(response.body);
  }
}
class AppStrings {
  static String BASE_URL = "http://157.245.111.180/public/api/";
  static String allGenres = BASE_URL + "all_genres";
}
