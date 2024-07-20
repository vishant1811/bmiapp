import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var weight=TextEditingController();
var feet=TextEditingController();
var inch=TextEditingController();
var result=" ";
var bg=Colors.deepOrange.shade100;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.deepOrangeAccent.shade400,
        title: Center(child: Text(" BMI ")),
      ),
      body:Container(
        color: bg,
        child: Center(
          child: Container(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                    child: Text("WELCOME TO BMI ",style: TextStyle(fontSize: 40),)),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller:weight,
                  decoration: InputDecoration(
                    label: Text("Enter your weight in kg "),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(
                  height: 20,
                ),

                TextField(
                  controller: feet,
                  decoration: InputDecoration(
                    label: Text("enter your height in feets"),
                    prefixIcon:Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(
                  height: 20,
                ),

                TextField(
                  controller: inch,
                  decoration: InputDecoration(
                    label: Text("enter your height in inch"),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),

                ElevatedButton(onPressed: (){
                  var in1=weight.text.toString();
                  var in2=feet.text.toString();
                  var in3=inch.text.toString();

                  if(in1!=""&&in2!=""&&in3!=""){
                    var iweight=int.parse(in1);
                    var ifeet=int.parse(in2);
                    var iinch=int.parse(in3);

                    //for calculating total inch
                    var tinch=(ifeet*12)+iinch;
                     // for centimeter
                    var tcm=tinch*2.54;
                    //for meter
                    var tm=tcm/100;
                    //for bmi
                    var bmi=iweight/(tm*tm);
                    var msg="";
                    if(bmi>25){
                      msg="you are overweight ";
                      bg=Colors.red;
                    }
                    else if(bmi<18){
                      msg ="you are underweight";
                      bg=Colors.yellow;
                    }
                    else{
                      msg="you are healthy ";
                      bg=Colors.green;
                    }
                    result="  $msg \n your bmi is ${bmi.toStringAsFixed(2)}";
                    setState(() {

                    });


                  }
                  else{

                    setState(() {
                      result="please fill all detail";
                    });
                  }



                },

                    child:Text("CALCULATE")),

                Text(result,style: TextStyle(fontSize: 25),),

              ],
            ),
          ),
        ),
      )
    );
  }
}

