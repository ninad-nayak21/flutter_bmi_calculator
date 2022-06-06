import 'package:flutter/material.dart';
import 'package:fancyapp/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

double height = 149;
double weight = 70;
String bmi = "";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(60)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text("Height\n ${height.round()}",
                        style: TextStyle(fontSize: 32)),
                  ),
                  Slider(
                    value: height,
                    max: 210,
                    min: 100,
                    onChanged: (newValue) {
                      setState(() {
                        height = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(60)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Weight\n  ${weight}",
                        style: TextStyle(fontSize: 32)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.add,
                        ),
                        iconSize: 30,
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            weight ++;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.remove,
                        ),
                        iconSize: 30,
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            weight --;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 190,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(60)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Result", style: TextStyle(fontSize: 28)),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.double_arrow_rounded,
                      ),
                      iconSize: 50,
                      color: Colors.blue,
                      onPressed: () {
                        setState(() {
                          double x;
                          x = weight / ((height * height) / 10000);
                          //bmi = x.toStringAsFixed(2);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondScreen(bmi: x)));
                        });
                      }),
                ],
              ),

            ),

          ],
        ),
      ),
    );
  }
}

