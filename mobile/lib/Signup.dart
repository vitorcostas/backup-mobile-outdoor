import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:outdoor/DataBaseHelper.dart';
import 'package:outdoor/Validators.dart';
import 'package:outdoor/Login.dart';
import 'dart:convert';
import 'dart:convert';
import 'package:crypto/crypto.dart';

const urlPrefix = 'https://localhost:7221';
class SignupDemo extends StatefulWidget {

  const SignupDemo({super.key});
  @override
  SignupDemoState createState() => SignupDemoState();
}

Future<void> makePostRequest(String nome, String email, String senha, context, DatabaseHelper instance) async {
  final url = Uri.parse('$urlPrefix/api/users');
  final headers = {"Content-type": "application/json"};
  final senhaCriptografada = textToMd5(senha);

  Map<String, dynamic> row = {
    "Name": nome,
    "Password": senhaCriptografada,
    "Email": email,
    "UserType": "client"
  };
  final id = await instance.insert(row, "User");
  print('linha inserida id: $id');
  Navigator.push(
      context, MaterialPageRoute(builder: (_) => LoginDemo()));

  //final response = await http.post(url, headers: headers, body: json);
  //if (response.statusCode == 201){
  //  Navigator.push(
  //      context, MaterialPageRoute(builder: (_) => LoginDemo()));
  //}else{
  //  throw Exception(response.body);
  //}
}

class SignupDemoState extends State<SignupDemo> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordCheck = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _nome = TextEditingController();
  final dbHelper = DatabaseHelper.instance;

  @override
  void dispose() {
    _password.dispose();
    _passwordCheck.dispose();
    _email.dispose();
    _nome.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Tela da Cadastro"),
        backgroundColor: const Color.fromRGBO(134, 19, 194, 100),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
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
              child: TextFormField(
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
                  //onChanged: (text) => setState(() => _name = text),
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
                  if(value == null || value.isEmpty)
                  {
                    return 'Esse campo é obrigatório';
                  }if (value.length < 6) {
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
                    makePostRequest(_nome.text, _email.text, _password.text, context, dbHelper).catchError((error) => 'Erro Cadastro: $error');

                  }
                },
                child: const Text(
                  'Confirmar Cadastro',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
      ),
        ),
      ),
    );
  }
}


String textToMd5 (String text) {
  return md5.convert(utf8.encode(text)).toString();
}

void _inserInto(Map<String, dynamic> row,String table){

}