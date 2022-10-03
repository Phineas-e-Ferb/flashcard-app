import 'package:flashcard/widgets/default_button.widget.dart';
import 'package:flashcard/widgets/default_input.widget.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool showPassword = false;

  void changePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
          child: ListView(
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
              const DefaultInput(
                placeholder: "Nome de usuário",
                prefixIcon: Icons.person,
              ),
              const SizedBox(
                height: 12,
              ),
              DefaultInput(
                placeholder: "Senha",
                prefixIcon: Icons.lock,
                suffixIcon:
                    !showPassword ? Icons.visibility : Icons.visibility_off,
                obscureText: !showPassword,
                onSuffixIconPressed: changePasswordVisibility,
              ),
              const SizedBox(
                height: 12,
              ),
              DefaultButtonWidget(
                label: "Entrar",
                onPressed: () => {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Não possui conta?",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () => {},
                    child: const Text(
                      "Registre-se",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
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
