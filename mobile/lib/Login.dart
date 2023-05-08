import 'dart:convert';
import 'package:flutter/material.dart';
import 'Services.dart';
import 'Signup.dart';
import 'package:http/http.dart' as http;
import 'package:outdoor/User.dart';
import 'package:outdoor/SharedPreferences.dart';
import 'globals.dart';

const urlPrefix = 'https://localhost:7221';
class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

Future<void> _Login(String email, String senha, context) async {
  final url = Uri.parse('$urlPrefix/api/users/login');
  final headers = {"Content-type": "application/json"};
  final json = '{"password": "$senha", "email": "$email"}';
  final response = await http.post(url, headers: headers, body: json);
  if (response.statusCode == 200){

    Map<String, dynamic> value = jsonDecode(response.body);
    User usuario = User.fromJson(value);

    usuario_global = usuario;

    SharedPreference().addStringToSF('id', usuario.id);
    SharedPreference().addStringToSF('email', usuario.email);
    SharedPreference().addStringToSF('userType', usuario.userType);
    SharedPreference().addStringToSF('name', usuario.name);
    SharedPreference().addBoolToSF('login', true);

    Navigator.push(
        context, MaterialPageRoute(builder: (_) => Services()));
  }else{
    throw Exception(response.body);
  }
}

class _LoginDemoState extends State<LoginDemo> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Login',
        ),
        backgroundColor: const Color(0xff8613c2),
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
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: _email,
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
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
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
                    labelText: 'Senha',
                    hintText: 'Coloque uma senha segura'),
              ),
            ),
            TextButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(134, 19, 194, 100), borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  if(_formkey.currentState!.validate()){
                    _Login(_email.text, _password.text, context).catchError((error) => 'Erro Cadastro: $error');
                  }
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => Services()));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(134, 19, 194, 100), borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SignupDemo()));
                },
                child: const Text(
                  'Cadastrar',
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
