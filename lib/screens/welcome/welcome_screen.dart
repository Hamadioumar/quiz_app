import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constents.dart';
import '../../moduls/animated_text.dart';
import '../quiz/quiz_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  late String userName;
  @override
  void dispose() {
    // Don't forget to dispose the TextEditingController when the widget is removed from the tree.
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/moon.jpg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 2), //2/6

                  AnimatedText(
                    text: "Let's Play Thaji,",
                  ),

                  const Text(
                    "Enter your name to start the game",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 100,
                  ), // 1/6
                  TextField(
                    controller: _textEditingController,
                    onChanged: (value) {
                      userName = value;

                      // This callback will be triggered whenever the text in the TextField changes.
                      // You can perform your input validation or manipulation here.
                      // For example, you can restrict the input to only allow certain characters or format the input.
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Full Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: _handleSubmit,
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding:
                          const EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Lets Start Thaji",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  const Spacer(flex: 1), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmit() {
    String inputText = _textEditingController.text;
    if (inputText.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please enter some text.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Perform the desired action with the input text
      // For example, submit it to a backend server.
      Get.to(() => const QuizScreen());
      print('Submitted text: $inputText');
    }
  }
}
