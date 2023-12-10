import 'dart:async';
import 'package:books/geolocation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo - Arhan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LocationScreen(),  //const FuturePage(),  -> kode awal
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage ({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

// PRAKTIKUM 1
class _FuturePageState extends State<FuturePage> {
  String result = '';
  Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/xs-IDwAAQBAJ';
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }

  //PRAKTIKUM 2
  Future<int> returnOneAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future count() async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }

  // Praktikum 3
  late Completer completer;

  Future getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }

  Future calculate() async {
    try{
      await new Future.delayed(const Duration(seconds : 5));
      completer.complete(42);
    }
    catch(_){
      completer.completeError({});
    }
  }

  // Praktikum 4
  void returnFG() {
    final futures = Future.wait<int>([
      returnOneAsync(),
      returnTwoAsync(),
      returnThreeAsync(),
    ]);
    FutureGroup<int> futureGroup = FutureGroup<int>();
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();
    futureGroup.future.then((List <int> value) {
      int total = 0;
      for (var element in value){
        total += element;
      }
      setState(() {
        result = total.toString();
      });
    });
  }

  // Praktikum 5
  Future returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Something terrible happened!');
  }

  Future handleError() async {
    try {
      await returnError();
    }
    catch (error) {
      setState(() {
        result = error.toString();
      });
    }
    finally {
      print('Complete');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the Future - Arhan'),
      ),
      body: Center(
        child: Column(children: [
          const Spacer(),
          ElevatedButton(
            child: const Text('GO!'),
            onPressed: () {
              handleError();
              //returnError()
              //    .then((value) {
              //      setState(() {
              //        result = 'Success';
              //      });
              //    }).catchError((onError){
              //      setState(() {
              //        result = onError.toString();
              //      });
              //    }).whenComplete(() => print('Complete'));

              //returnFG();      praktikum 4

              //getNumber().then((value) {     praktikum_3
              //  setState(() {
              //    result = value.toString();
              //  });
              //}).catchError((e) {
              //  result = 'An error occurred';
              //});

              //count();    praktikum_2

              //setState(() {}); praktikum_1
              //getData()
              //.then((value) {
              //  result = value.body.toString().substring(0, 450);
              //  setState(() {});
              //}).catchError((_){
              //  result = 'An error occurred';
              //  setState(() {});
              //});
            }, 
          ),
          const Spacer(),
          Text(result),
          const Spacer(),
          const CircularProgressIndicator(),
          const Spacer(),
        ]),
      ),
    );
  }
}
