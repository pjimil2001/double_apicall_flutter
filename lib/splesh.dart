// import 'dart:async';
// import 'package:api_double/main.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// void main() {
//   runApp(MyApp1());
// }

// class MyApp1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//     );
//   }
// }

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Timer(Duration(seconds: 6), () {
//       Navigator.of(context)
//           .pushReplacement(MaterialPageRoute(builder: (_) => MyApp()));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 0, 0, 0),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Lottie.network(
//                 "https://assets10.lottiefiles.com/packages/lf20_vgdylz17.json"
//                 ),
//             SizedBox(
//               height: 20,
//             ),
          
//           ],
//         ),
//       ),
//     );
//   }
// }









import 'package:flutter/material.dart';
import 'screens/api1.dart';
import 'screens/api2.dart';
import 'screens/api3.dart';
import 'screens/api4.dart';

// void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    const title = 'api demo';

    return const MaterialApp(
    debugShowCheckedModeBanner: false,

      title: title,
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: const Center(
          child: MyButton(),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    // The GestureDetector wraps the button.
    return Container(
       padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/bg.jpg"),
        fit: BoxFit.cover),
  ),
      
      child: Center(
        
        
        child: Row(
          
          children: [
            InkWell(
               onTap: () {
                 Navigator.push(context,MaterialPageRoute(builder: (context) =>  api1()),);
                 },
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text('api 1'),
              ),
            ),




            InkWell(
               onTap: () {
                 Navigator.push(context,MaterialPageRoute(builder: (context) =>  GenresScreen()),);
                 },
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text('api 2 '),
              ),
            ),



             InkWell(
               onTap: () {
                 Navigator.push(context,MaterialPageRoute(builder: (context) =>  GenresScreen2()),);
                 },
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text('api 3 '),
              ),
            ),



            InkWell(
               onTap: () {
                 Navigator.push(context,MaterialPageRoute(builder: (context) =>  GenresScreen3()),);
                 },
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text('api 4 '),
              ),
            ),

          ],
        ),
      ),
    );
  }
} 

