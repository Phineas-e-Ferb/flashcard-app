import 'dart:io';

import 'package:flashcard/widgets/default_button.widget.dart';
import 'package:flashcard/widgets/default_input.widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool showPassword = false;
  File? _image;

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
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'images/signup_image.png',
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
                Text(
                  "Torne-se um mago!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      var source = ImageSource.gallery;
                      XFile? pickedFile = await ImagePicker().pickImage(
                        source: source,
                        imageQuality: 50,
                      );
                      if (pickedFile != null) {
                        setState(() {
                          _image = File(pickedFile.path);
                        });
                      }
                    },
                    child: _image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(106),
                            child: Image.file(
                              _image!,
                              width: 104,
                              height: 104,
                              fit: BoxFit.fitWidth,
                            ),
                          )
                        : Container(
                            width: 104,
                            height: 104,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(106))),
                            child: const Icon(
                              Icons.image,
                              size: 36,
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Adicione uma foto",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 12,
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
                  onSuffixIconPressed: () => changePasswordVisibility(),
                ),
                const SizedBox(
                  height: 12,
                ),
                DefaultInput(
                  placeholder: "Confirme a senha",
                  prefixIcon: Icons.lock,
                  suffixIcon:
                      !showPassword ? Icons.visibility : Icons.visibility_off,
                  obscureText: !showPassword,
                  onSuffixIconPressed: () => changePasswordVisibility(),
                ),
                const SizedBox(
                  height: 12,
                ),
                DefaultButtonWidget(
                  label: "Cadastrar",
                  onPressed: () => {},
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
                      onPressed: () => {},
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
    );
  }
}
