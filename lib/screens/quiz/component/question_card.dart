import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constents.dart';
import '../../../moduls/Question.dart';
import '../../../moduls/queston_controller.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Expanded(
          child: Column(
            children: [
              Text(
                question.question,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: kBlackColor),
              ),
              const SizedBox(height: kDefaultPadding / 2),
              ...List.generate(
                question.options.length,
                (index) => Option(
                  index: index,
                  text: question.options[index],
                  press: () => controller.checkAns(question, index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
