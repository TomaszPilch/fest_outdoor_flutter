import 'package:fest_outdoor/localization/app_localizations.dart';
import 'package:fest_outdoor/widgets/feedback_form.dart';
import 'package:flutter/material.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Center(
          child: Text(
            AppLocalizations.of(context)!.feedbackTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const FeedbackForm(),
      ],
    );
  }
}
