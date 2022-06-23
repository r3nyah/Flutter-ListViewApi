import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:listview_api/Src/HomePage.dart';
import 'package:listview_api/Src/Data.dart';

void main(){
  runApp(MultiProvider(providers:[
    ChangeNotifierProvider(create: (_)=>Data())
  ],child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List View',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: ChangeNotifierProvider(
        create: (context) => Data(),
        builder: (context,child){
          return ListViewPage();
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {
              ChangeNotifierProvider(
                create: (context) => Data(),
                builder: (context,child){
                  return ListViewPage();
                },
              );
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> const ListViewPage()));
            },

            child: const Text('List View'),
          )

      ),
    );
  }
}