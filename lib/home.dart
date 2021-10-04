import 'package:flightbooking/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  bool isMale = false;
  double highVal = 170;
  int weight = 55;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body mass index'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m1Expended(context, 'male'),
                    const SizedBox(
                      width: 15,
                    ),
                    m1Expended(context, 'female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m2Expended(context, 'Age'),
                    const SizedBox(
                      width: 15,
                    ),
                    m2Expended(context, 'Weight'),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              child: TextButton(
                onPressed: () {
                  var result = weight /pow(highVal/100,2) ;
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Result(age: age, isMale: isMale, result:result);
                    },
                  ));
                },
                child: Text(
                  'Calculate',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Expanded m1Expended(BuildContext context, String Type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (Type == 'male') ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (Type == 'male' && isMale) || (Type == 'female' && !isMale)
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Type == 'male' ? Icons.male : Icons.female, size: 90),
              const SizedBox(height: 15),
              Text(
                Type == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headline2,
              )
            ],
          ),
        ),
      ),
    );
  }
  Expanded m2Expended(BuildContext context, String Type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Type == 'Age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 15),
            Text(
              Type == 'Age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: Type == 'Age' ? 'age--' : 'weight--',
                  onPressed: () {
                    setState(() {
                      Type == 'Age' ? age-- : weight--;
                    });
                  },
                  child: const Icon(Icons.remove),
                  mini: true,
                ),
                SizedBox(width:8),
                FloatingActionButton(
                  heroTag: Type == 'Age' ? 'Age++' : 'Weight++',
                  onPressed: () {
                    setState(() {
                      Type == 'Age' ? age++ : weight++;
                    });
                  },
                  child: const Icon(Icons.add),
                  mini: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
