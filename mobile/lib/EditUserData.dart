import 'package:flutter/material.dart';
import 'package:outdoor/DataBaseHelper.dart';
import 'package:outdoor/ProfilePage.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

import 'SharedPreferenceClass.dart';

const urlPrefix = 'https://localhost:7221';
class EditUserData extends StatefulWidget {

  const EditUserData({super.key});
  @override
  EditUserDataState createState() => EditUserDataState();
}

Future<void> putNewUserData(
    String nome,
    String email,
    String senha,
    context,
    DatabaseHelper instance,
    String? tipoUsuario) async {
  final url = Uri.parse('$urlPrefix/api/users');
  final headers = {"Content-type": "application/json"};
  final senhaCriptografada = textToMd5(senha);
  SharedPreference instancia = await SharedPreference.instance;
  final identificador = await instancia.getStringValuesSF("Id");
  final intId = int.parse(identificador);
  print(tipoUsuario);

  Map<String, dynamic> row = {
    "Id": intId,
    "Name": nome,
    "Password": senhaCriptografada,
    "Email": email,
    "UserType": tipoUsuario
  };
  print("MAPEADA A ROW");
  final id = await instance.update(row, "User");
  print("Dados alterados");

  await instancia.addStringToSF('Email', email);
  await instancia.addStringToSF('Name', nome);
  await instancia.addStringToSF('UserType', tipoUsuario!);
  print("Dados alterado");

  print('linha modificada id: $id');
  Navigator.push(
      context, MaterialPageRoute(builder: (_) => ProfilePage()));
}

class EditUserDataState extends State<EditUserData> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordCheck = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _nome = TextEditingController();
  final dbHelper = DatabaseHelper.instance;
  String? _myActivity;

  @override
  void dispose() {
    _password.dispose();
    _passwordCheck.dispose();
    _email.dispose();
    _nome.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _myActivity = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Editar dados do Perfil"),
        backgroundColor: const Color.fromRGBO(134, 19, 194, 100),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[

                      Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 60.0),
                              child: Center(
                                child: Container(
                                    width: 200,
                                    height: 150,
                                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                                    child: Image.asset('assets/images/logo.png')),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0, top: 15, bottom: 0),
                              //padding: EdgeInsets.symmetric(horizontal: 15),
                              child: DropDownFormField(
                                titleText: 'Tipo de usuário',
                                hintText: 'Favor escolher um tipo',
                                value: _myActivity,
                                onSaved: (value) {
                                  setState(() {
                                    _myActivity = value;
                                  });
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _myActivity = value;
                                  });
                                },
                                dataSource: const [
                                  {
                                    "display": "Cliente",
                                    "value": "client",
                                  },
                                  {
                                    "display": "Prestador de Serviço",
                                    "value": "provider",
                                  },
                                ],
                                textField: 'display',
                                valueField: 'value',
                              ),

                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0, top: 15, bottom: 0),
                              //padding: EdgeInsets.symmetric(horizontal: 15),
                              child: TextFormField(
                                // initialValue: snapshot.data!['Name'],
                                controller: _nome,
                                obscureText: false,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Esse campo é obrigatório';
                                  }
                                  if (text.length < 4) {
                                    return 'Tamanho mínimo 4 letras.';
                                  }
                                  return null;
                                },

                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Nome *',
                                    hintText: 'Informe seu nome'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0, top: 15, bottom: 0),
                              //padding: EdgeInsets.symmetric(horizontal: 15),
                              child: TextFormField(
                                obscureText: false,
                                controller: _email,
                                keyboardType: TextInputType.emailAddress,
                                validator: (String? value){
                                  final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                                  if(value == null || value.isEmpty)
                                  {
                                    return 'Esse campo é obrigatório';
                                  }
                                  else if(!emailRegExp.hasMatch(value)){
                                    return 'Favor inserir um email válido.';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Email *',
                                    hintText: 'Informe um email valido: abc@abc.com'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0, top: 15, bottom: 0),
                              //padding: EdgeInsets.symmetric(horizontal: 15),
                              child: TextFormField(
                                controller: _password,
                                validator: (String? value){
                                  // if(value == null || value.isEmpty)
                                  // {
                                  //   return 'Esse campo é obrigatório';
                                  if (value!.length < 6) {
                                    return 'Senha deve conter no mínimo 6 caracteres.';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Senha *',
                                    hintText: 'Sua senha de acesso'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0, top: 15, bottom: 0),
                              //padding: EdgeInsets.symmetric(horizontal: 15),
                              child: TextFormField(
                                controller: _passwordCheck,
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                validator: (String? value){
                                  if(value == null || value.isEmpty)
                                  {
                                    return 'Esse campo é obrigatório';
                                  }
                                  if(_passwordCheck.text!=_password.text){
                                    return "Senhas não são iguais";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Confirmar senha *',
                                    hintText: 'Repita sua senha de acesso'),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              height: 50, decoration: BoxDecoration(
                                color: const Color.fromRGBO(134, 19, 194, 100), borderRadius: BorderRadius.circular(20)),
                              child: ElevatedButton(
                                onPressed: () {
                                  if(_formkey.currentState!.validate()){
                                    putNewUserData(_nome.text, _email.text, _password.text, context, dbHelper, _myActivity).catchError((error) => 'Erro Cadastro: $error');

                                  }
                                },
                                child: const Text(
                                  'Editar dados',
                                  style: TextStyle(color: Colors.white, fontSize: 25),
                                ),
                              ),
                            ),
                          ]
                      ),
            ],
          ),
        ),
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


String textToMd5 (String text) {
  return md5.convert(utf8.encode(text)).toString();
}