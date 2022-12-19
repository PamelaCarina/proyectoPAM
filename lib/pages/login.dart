import 'package:cool_alert/cool_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'listado.dart';
import 'package:democlase3/global.dart';
import 'package:democlase3/services/loginService.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  late final pref;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> validarDatos(String email, String password) async {
    final response = await LoginService().validar(email, password);
    if (response.statusCode == 200) {
      final jsonData= json.decode(response.body);
      await pref.setString('email', email);
      Global.id_usuario= jsonData['id'];
      Global.login = email;
      Global.nombre=jsonData['nombre'];
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => listadowakalas()));
    } else {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: 'Oops...',
        text: 'El usuario y contraseña no son correctos',
        loopAnimation: false,
      );
    }
  }

  String login_guardado = '';

  @override
  void cargaPreferencia() async {
    pref = await SharedPreferences.getInstance();
    login_guardado = pref.getString("email");
    emailController.text = login_guardado == null ? "" : login_guardado!;
  }

  void initState() {
    super.initState();
    cargaPreferencia();
  }

  Widget build(BuildContext context) {
    const sizedBox = const SizedBox(height: 30);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              const Text('Wakala 1.0'),
              sizedBox,
              SizedBox(
                width: 400,
                height: 200,
                child: Image.asset('assets/capi.png', fit: BoxFit.fill),
              ),
              sizedBox,
              TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                      hintText: "Ingrese su email",
                      labelText: "Email",
                      suffixIcon:
                      const Icon(Icons.email, color: Colors.black54))),
              sizedBox,
              TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                      hintText: "Ingrese su password",
                      labelText: "password",
                      suffixIcon: const Icon(Icons.remove_red_eye))),
              sizedBox,
              sizedBox,
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.indigo, shape: StadiumBorder()),
                      onPressed: () {
                        if (emailController.text.length == 0) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('El usuario no puede estar vacio')));
                        }else {
                          validarDatos(
                              emailController.text, passwordController.text);
                        }
                      },
                      child: Text("Ingresar"))),
              sizedBox,
              GestureDetector(
                  onLongPress: () {

                  },
                  onTap: () {

                  },
                  child: Text(
                    "¿Olvido su password?",
                    style: TextStyle(color: Colors.blue),
                  )),
              sizedBox,
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    const Text('by'),
                    Column(
                      children:[
                      const Text('Pamela Pinilla'),
                      const Text('Carlos Venegas')
                      ]
                    )
                  ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
