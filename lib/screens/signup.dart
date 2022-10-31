import 'dart:io';

import 'package:flashcard/services/user_service.dart';
import 'package:flashcard/utils/catch_exception.dart';
import 'package:flashcard/utils/default_alert_dialog.dart';
import 'package:flashcard/utils/save_user_id.dart';
import 'package:flashcard/widgets/default_button.widget.dart';
import 'package:flashcard/widgets/default_input.widget.dart';
import 'package:flashcard/widgets/image_picker_preview.widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late UserService userService;
  bool showPassword = false;
  bool isLoading = false;
  File? _image;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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

  void handleAddImage() async {
    ImageSource source = ImageSource.gallery;
    XFile? pickedFile = await ImagePicker().pickImage(
      source: source,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void handleUserRegister() {
    setState(() {
      isLoading = true;
    });
    userService
        .signup(usernameController.text, passwordController.text, _image!)
        .then((response) => {
              setState(() {
                isLoading = false;
              }),
              handleRegisterResponse(response),
            })
        .catchError((error) => {
              setState(() {
                isLoading = false;
              }),
              ResponseException.showError(context, error),
            });
  }

  void handleRegisterResponse(dynamic response) {
    saveUserId(response["user"]["id"])
        .then((_) => Navigator.pushReplacementNamed(context, "/home"));
  }

  bool shouldDisableButton() {
    return usernameController.text == "" ||
        passwordController.text == "" ||
        confirmPasswordController.text == "" ||
        passwordController.text != confirmPasswordController.text ||
        _image == null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.95,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'images/signup_image.png',
                        width: MediaQuery.of(context).size.width * 0.45,
                      ),
                      Text(
                        "Torne-se um mago!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: handleAddImage,
                      child: ImagePickerPreviewWidget(
                        image: _image,
                      ),
                    ),
                  ),
                  const Text(
                    "Adicione uma foto",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  DefaultInput(
                    placeholder: "Nome de usuário",
                    prefixIcon: Icons.person,
                    controller: usernameController,
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
                  DefaultInput(
                    placeholder: "Confirme a senha",
                    prefixIcon: Icons.lock,
                    suffixIcon:
                        !showPassword ? Icons.visibility : Icons.visibility_off,
                    obscureText: !showPassword,
                    onSuffixIconPressed: changePasswordVisibility,
                    controller: confirmPasswordController,
                  ),
                  DefaultButtonWidget(
                    label: "Cadastrar",
                    onPressed: handleUserRegister,
                    showLoading: isLoading,
                    disableButton: shouldDisableButton(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Já possui uma conta?",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            {Navigator.pushNamed(context, "/signin")},
                        child: const Text(
                          "Entre aqui",
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
        ),
      ),
    );
  }
}
