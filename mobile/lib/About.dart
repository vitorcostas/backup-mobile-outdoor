import 'package:flutter/material.dart';
import "package:flutter_about_page/flutter_about_page.dart";

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Sobre"),
          backgroundColor: Color.fromRGBO(134, 19, 194, 100),
          centerTitle: true,
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
