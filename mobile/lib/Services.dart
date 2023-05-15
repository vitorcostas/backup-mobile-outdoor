import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'About.dart';
import 'DataBaseHelper.dart';
import 'ProfilePage.dart';
import 'Login.dart';
import 'SharedPreferenceClass.dart';
import 'globals.dart';
import 'package:http/http.dart' as http;
import 'ServicosCadastrados.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

Future<void> deleteDadosUsuario(
    DatabaseHelper instance,
    context) async {
  // final url = Uri.parse('$urlPrefix/api/users');
  // final headers = {"Content-type": "application/json"};
  SharedPreference instancia = await SharedPreference.instance;
  final identificador = await instancia.getStringValuesSF("Id");
  final intId = int.parse(identificador);
  instance.delete(intId, 'User');

  await instancia.removeValue('Email');
  await instancia.removeValue('Name');
  await instancia.removeValue('UserType');
  await instancia.removeValue('Id');
  await instancia.addBoolToSF('Login', false);

  print("Dados alterado");

  Navigator.push(
      context, MaterialPageRoute(builder: (_) => LoginDemo()));
}

Future<Map<String, dynamic>> getServicos() async{
  final url = Uri.parse('$urlPrefix/api/post');
  final response = await http.get(url);

  var responseData = jsonDecode(response.body);

  // List<ServicosCadastrados> servicos = [];
  // print(responseData);
  // for (var servico in responseData){
  //   servicos.add(ServicosCadastrados.fromJson(servico));
  // }
  // print(servicos);
  return responseData;
}

class Servicos {
}


class _ServicesState extends State<Services> {

  @override
  Widget build(BuildContext context) {
    final title = 'Lista de Serviços';
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
            const SizedBox(
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
            future: getServicos(),
            builder: (context, snapshot){
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(
                    child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              else{
                print('\n\n\n\n\n\n\n\n\n\n\n');
                print(snapshot.data);
                print('\n\n\n\n\n\n\n\n\n\n\n');

                return
                  ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (ctx, index) => ListTile(
                      title: Text(snapshot.data![index]['title']),
                      subtitle: Text(snapshot.data![index]['description']),
                      contentPadding: EdgeInsets.only(bottom: 20.0),
                    ),
                  );
            }
                },
          ),
        ],// AQUIII
      ),
    );
  }
}