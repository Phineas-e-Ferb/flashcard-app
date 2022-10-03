import 'package:flashcard/widgets/default_button.widget.dart';
import 'package:flutter/material.dart';

class FeedbackScreenArguments {
  final String listName;
  final double correctAnswerPercentage;
  FeedbackScreenArguments(this.listName, this.correctAnswerPercentage);
}

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int count = 0;

  void incrementCount() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as FeedbackScreenArguments;
    bool needStudy = args.correctAnswerPercentage < 0.6;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.listName,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, right: 24, left: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              child: Image.asset(
                needStudy ? "images/study_more.png" : "images/congrats.png",
                width: MediaQuery.of(context).size.width * 0.4,
              ),
            ),
            Text(
              needStudy
                  ? "Para se tornar um mago completo talvez seja necessário revisar esse conteúdo novamente"
                  : "Ih ala, tu é brabo mermo hein",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Você acertou ${args.correctAnswerPercentage * 100}% das questões",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
              ),
            ),
            DefaultButtonWidget(label: "Continuar", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
