import 'package:flashcard/services/user_service.dart';
import 'package:flashcard/utils/catch_exception.dart';
import 'package:flashcard/utils/default_alert_dialog.dart';
import 'package:flashcard/utils/save_user_id.dart';
import 'package:flashcard/widgets/default_button.widget.dart';
import 'package:flashcard/widgets/default_input.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late UserService userService;
  bool showPassword = false;
  bool isLoading = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    userService = context.read<UserService>();
    super.initState();
  }

  void changePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  void handleUserLogin() {
    setState(() {
      isLoading = true;
    });
    userService
        .signin(usernameController.text, passwordController.text)
        .then((response) => {
              handleSigninResponse(response),
              setState(() {
                isLoading = false;
              }),
            })
        .catchError(
          (error) => {
            setState(() {
              isLoading = false;
            }),
            ResponseException.showError(context, error),
          },
        );
  }

  bool shouldDisableButton() {
    return usernameController.text == "" || passwordController.text == "";
  }

  void handleSigninResponse(dynamic response) {
    if (response["error"] != null) {
      showDefaultAlertDialog("Erro", response["message"], context);
    } else {
      saveUserId(response["user"]["_id"]);
      Navigator.pushNamed(context, '/home');
    }
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
              DefaultInput(
                placeholder: "Nome de usu??rio",
                prefixIcon: Icons.person,
                controller: usernameController,
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
                controller: passwordController,
              ),
              const SizedBox(
                height: 12,
              ),
              DefaultButtonWidget(
                label: "Entrar",
                onPressed: handleUserLogin,
                showLoading: isLoading,
                disableButton: shouldDisableButton(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "N??o possui conta?",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, "/signup")},
                      child: const Text(
                        "Registre-se",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
