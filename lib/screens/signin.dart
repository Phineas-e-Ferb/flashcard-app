import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'images/signin_image.png',
                  width: MediaQuery.of(context).size.width * 0.7,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Seja bem vindo!",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Entre na sua conta para virar um mago nos estudos",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Nome de usuário",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Senha",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () => {},
                      icon: Icon(Icons.visibility),
                    )),
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () => {},
                child: Text("Entrar"),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Não possui conta?"),
                  TextButton(
                    onPressed: () => {},
                    child: const Text("Registre-se"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
