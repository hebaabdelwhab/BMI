import 'package:flutter/material.dart';

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
              Icon(Type == 'male' ? Icons.male : Icons.female),
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
}
