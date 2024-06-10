import 'package:flutter/material.dart';
import 'package:login_page/screens/login.dart';
import 'package:login_page/screens/person.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            color: Colors.white,
            onPressed: () {
              logout(context);
            },
          ),
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            int ind = index + 1;
            if (index % 2 == 0) {
              return ListTile(
                title: Text(
                  'Person $ind',
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: const Text(
                  'Messages',
                  style: TextStyle(fontFamily: 'NotoSerif'),
                ),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('images/download.png'),
                ),
                trailing: CircleAvatar(
                  backgroundColor: Colors.green[400],
                  radius: 15,
                  child: Text(
                    '${ind + 1} ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                tileColor: Colors.green[100],
                onTap: () {
                  String name = 'person $ind';
                  String name2 = '$ind';
                  String num2 = '${ind + 1}';
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => person(
                        name: name,
                        num: name2,
                        num2: num2,
                      ),
                    ),
                  );
                },
              );
            } else {
              return ListTile(
                  title: Text(
                    'Person $ind',
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: const Text(
                    ' Messages',
                    style: TextStyle(fontFamily: 'NotoSerif'),
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset(
                      'images/download.jpeg',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.green[400],
                    radius: 15,
                    child: Text(
                      '${ind + 1} ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  tileColor: Colors.green[100],
                  onTap: () {
                    String name = 'person $ind';
                    String name2 = '$ind';
                    String num2 = '${ind + 1}';
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => person(
                            name: name,
                            num: name2,
                            num2: num2,
                          ),
                        ));
                  });
            }
          },
          separatorBuilder: (context, index) => const Divider(
                height: 5,
              ),
          itemCount: 20),
    );
  }

  void logout(BuildContext ctx) async {
    showDialog(
      context: ctx,
      builder: (ctx) => AlertDialog(
        title: Text('Confirm Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            child: Text('No'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
          TextButton(
            child: Text('yes'),
            onPressed: () async {
              final sharedPref = await SharedPreferences.getInstance();
              await sharedPref.clear();
              Navigator.of(ctx).pushAndRemoveUntil(
                MaterialPageRoute(builder: (ctx) => LoginPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
