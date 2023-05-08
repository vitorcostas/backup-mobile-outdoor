import 'package:flutter/material.dart';
import "package:flutter_about_page/flutter_about_page.dart";
import 'ProfilePage.dart';
import 'Login.dart';
import 'Services.dart';
class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {


    AboutPage ab = AboutPage();
    ab.customStyle(descFontFamily: "Roboto",listTextFontFamily: "RobotoMedium");

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Sobre',
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

          children: [

            ab.setImage("assets/images/logo.png"),
            ab.addDescription("Projeto desenvolvido por alunos da PUC MINAS, que tem como objetivo melhorar a relação cliente e prestador de serviços a partir de uma aplicação com versões para web e para mobile"),
            ab.addWidget(
              Text(
                "Version 1.0",
                style: TextStyle(
                    fontFamily: "RobotoMedium"
                ),
              ),
            ),
            ab.addGroup("Saiba Mais"),
            ab.addGithub("ICEI-PUC-Minas-PPLES-TI/"),


          ],
        )
    );
  }
}
