import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var res,name;

  @override
  void initState() {
     super.initState();
    //print("We Reached");
    fetchdata();
  }

  fetchdata() async {
    print("In Fetch");
    res =await http.get(Uri.parse("https://margincalculator.angelbroking.com/OpenAPI_File/files/OpenAPIScripMaster.json"));
    name = jsonDecode(res.body);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OWN API"),
      ),
      body: res!=null ? ListView.builder(
          itemCount: name.length,
          itemBuilder: (context,index){
            return
                Text("${name[index]["name"]}");
          }
      ) : CircularProgressIndicator(),

    );
  }
}
