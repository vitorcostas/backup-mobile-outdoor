import 'package:flutter/material.dart';
import 'About.dart';
import 'Services.dart';
import 'Login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Pagina Inicial',
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
                Icons.home,
              ),
              title: const Text('Página Inicial'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomePage()));
              },
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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}