import 'package:flutter/material.dart';
import 'package:profile/profile.dart';
import 'About.dart';
import 'DataBaseHelper.dart';
import 'Services.dart';
import 'Login.dart';
import 'SharedPreferenceClass.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'globals.dart';
import 'package:outdoor/SharedPreferenceClass.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //final name = SharedPreference().getStringValuesSF('name');
  //final email = SharedPreference().getStringValuesSF('email');
  //final userType = SharedPreference().getStringValuesSF('userType');

  // void teste() async{
  //
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   name = prefs.getString('name') ?? '';
  //   // Future name = SharedPreferences().getStringValuesSF('name');
  //   // name.then((data) async {
  //   //   nameStr = data;
  //   // });
  //
  //   email = prefs.getString('email') ?? '';
  //   // Future email= SharedPreference().getStringValuesSF('email');
  //   // email.then((data) async {
  //   //   emailStr = data;
  //   // });
  //
  //   userType = prefs.getString('userType') ?? '';
  //
  //   // Future userType= SharedPreference().getStringValuesSF('userType');
  //   // userType.then((data) async {
  //   //   userTypeStr = data;
  //   // });
  // }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Perfil',
        ),
        backgroundColor: const Color(0xff8613c2),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xff8613c2),
              ),
              child: Text('Menu Navegação'),
            ),
            ListTile(
              leading: Icon(
                Icons.work,
              ),
              title: const Text('Serviços'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Services()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person,
              ),
              title: const Text('Perfil'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ProfilePage()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.question_mark,
              ),
              title: const Text('Sobre'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Example()));
              },
            ),
    SizedBox(
    height: 500,
    ),
    ListTile(
    leading: Icon(
    Icons.lock,
    ),
    title: const Text('Logout'),
    onTap: () {
    Navigator.push(
    context, MaterialPageRoute(builder: (_) => LoginDemo()));
    },
    ),
      ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          FutureBuilder<Map<String, dynamic>>(
          future: getSharedPreferences(),
          builder: (context, snapshot){
            List<Widget> children;
            if (snapshot.hasData){
              return
                Container(
                height: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.purple.shade300],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.5, 0.9],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white70,
                          minRadius: 60.0,
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundImage:
                            NetworkImage(''),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      snapshot.data!['Name'],
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Experiencia em eletrica e manutenção',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              );

            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          ),
          FutureBuilder<Map<String, dynamic>>(
            future: getSharedPreferences(),
            builder: (context, snapshot){
              List<Widget> children;
              if (snapshot.hasData){
                return
                  Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              color: Colors.deepPurple.shade300,
                              child: ListTile(
                                title: Text(
                                  '5000',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                subtitle: Text(
                                  'Trabalhos realizados',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.purple,
                              child: const ListTile(
                                title: Text(
                                  '4,7',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                subtitle: Text(
                                  'Nota',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );

              }else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          FutureBuilder<Map<String, dynamic>>(
            future: getSharedPreferences(),
            builder: (context, snapshot){
              List<Widget> children;
              if (snapshot.hasData){
                return
                  Column(
                    children: <Widget>[
                      ListTile(
                        title: const Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data!['Email'],
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const Divider(),
                      const ListTile(
                        title: Text(
                          'Telefone',
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '(31)31313131',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const Divider(),
                      const ListTile(
                        title: Text(
                          'Quantidade de serviços cadastrados',
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '0',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      )]);
              }else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          FutureBuilder<Map<String, dynamic>>(
            future: getSharedPreferences(),
            builder: (context, snapshot){
              List<Widget> children;
              if (snapshot.hasData){
                return
                  Container(
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(134, 19, 194, 100), borderRadius: BorderRadius.circular(20)),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (_) => Services()));
                              },
                              child: const Text(
                                'Adicionar Serviço',
                                style: TextStyle(color: Colors.white, fontSize: 25),
                              ),
                            ),
                          );
              }else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],// AQUIII
      ),
    );
  }
}


Future<Map<String, dynamic>> getSharedPreferences() async{
  final prefs = await SharedPreference.instance;

  final name = await prefs.getStringValuesSF("Name");
  final email = await prefs.getStringValuesSF("Email");
  final id = await prefs.getStringValuesSF("Id");
  Map<String, dynamic> value = {
    "Name": name,
    "Email": email,
    "Id": id
  };
  return value;
}