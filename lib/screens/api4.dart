import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:api_double/model/data4_model.dart';


class GenresScreen3 extends StatefulWidget {
  const GenresScreen3({Key? key}) : super(key: key);

  @override
  State<GenresScreen3> createState() => _GenresScreen3State();
}

class _GenresScreen3State extends State<GenresScreen3> {
  List<Data> data4 = [];

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  getUsers() async {
    if (await ApiManager.checkInternet()) {
      // progress visible

      book3 response = book3.fromJson(
        await ApiManager(context).getCall(
          url: AppStrings.allGenres,
        ),
      );

      //progress hide

      print(response.msg!);

      if (!response.error!) {
        print(response.data!.length);
        data4 = response.data!;
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
         backgroundColor: Color.fromARGB(255, 238, 28, 140),
        title: Center(child: Text("reqres")),
        actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.gite_rounded,
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
      itemCount: data4.length,
      itemBuilder: (context, index) {
        // return GenresItemView(data: data[index]);
        return itemView(index);
      },
    );
  }

  Widget itemView(int index) {
    return Container(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
    
      child:Card(
        color: Color.fromARGB(255, 47, 188, 235),
        margin: new EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Text(data4[index].email!),
          ],
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
  static String BASE_URL = "https://reqres.in/";
  static String allGenres = BASE_URL + "api/users?page=2";
}
