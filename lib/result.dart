import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double result;
  final bool isMale ;
  final int age ;
  const Result({Key? key,required this.result,required this.isMale,required this.age}) : super(key: key);
  String get resultPhases{
    String resultText = "";
    if(result >=30) {
      resultText = "obese";
    } else if(result >25&& result<30) {
      resultText = "Overweight";
    } else if(result >=18.5 && result <=24.9) {
      resultText = "Normal";
    } else {
      resultText = 'Thin';
    }
   return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result' ) ,centerTitle: true,),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Gender : ${isMale?'male':'female'}' , style: Theme.of(context).textTheme.headline1),
              Text('Result : ${result.toStringAsFixed(2)}' , style: Theme.of(context).textTheme.headline1),
              Text('Healthiness : $resultPhases' , style: Theme.of(context).textTheme.headline2,textAlign: TextAlign.center,),
              Text('Age : $age' , style: Theme.of(context).textTheme.headline2),
            ],
          ),
        ),
      ),
    );
  }
}
