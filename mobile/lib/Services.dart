import 'package:flutter/material.dart';
import 'About.dart';
import 'ProfilePage.dart';
import 'Login.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}


class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    final title = 'Lista de Serviços';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: const Color(0xff8613c2),
        ),
        body: ListView(
            children: <Widget>[
        ListTile(
        leading: Icon(Icons.photo_album),
        title: Text('Serviço 1'),
        trailing:Icon(Icons.star),
      ),
      ListTile(
        leading: Icon(Icons.photo_album),
        title: Text('Serviço 2'),
        trailing:Icon(Icons.star),
      ),
      ListTile(
        leading: Icon(Icons.photo_album),
        title: Text('Serviço 3'),
        trailing:Icon(Icons.star),
      ),
      ListTile(
        leading: Icon(Icons.photo_album),
        title: Text('Serviço 4'),
        trailing:Icon(Icons.star),
      ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Serviço 6'),
                trailing:Icon(Icons.star),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Serviço 7'),
                trailing:Icon(Icons.star),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Serviço 8'),
                trailing:Icon(Icons.star),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Serviço 9'),
                trailing:Icon(Icons.star),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Serviço 10'),
                trailing:Icon(Icons.star),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Serviço 11'),
                trailing:Icon(Icons.star),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Serviço 12'),
                trailing:Icon(Icons.star),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Serviço 13'),
                trailing:Icon(Icons.star),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Serviço 14'),
                trailing:Icon(Icons.star),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Serviço 15'),
                trailing:Icon(Icons.star),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Serviço 16'),
                trailing:Icon(Icons.star),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Serviço 17'),
                trailing:Icon(Icons.star),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Serviço 18'),
                trailing:Icon(Icons.star),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Serviço 19'),
                trailing:Icon(Icons.star),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Serviço 20'),
                trailing:Icon(Icons.star),
              ),
        ],
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
    ),
    );
  }
}