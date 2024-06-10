import 'package:flutter/material.dart';

// ignore: must_be_immutable
class person extends StatelessWidget {
  String name;
  String num;
  String num2;
  person(
      {super.key, required this.name, required this.num, required this.num2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          radius: 10.0,
          backgroundImage: AssetImage('images/download.jpeg'),
        ),
        actions: [
          Row(
            children: [
              Icon(Icons.video_call_rounded),
              SizedBox(
                width: 20,
              ),
              Icon(Icons.call),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.search),
              SizedBox(
                width: 10,
              ),
            ],
          )
        ],
        // automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            name,
          ),
        ),
      ),
      body: Container(
        color: Colors.green[200],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${num2} Messages ',
                style: const TextStyle(fontSize: 30, fontFamily: 'NotoSerif'),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Home', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
