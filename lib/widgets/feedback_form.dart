import 'package:fest_outdoor/localization/app_localizations.dart';
import 'package:fest_outdoor/providers/feedback_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _rating = 0;
  bool sent = false;

  @override
  Widget build(BuildContext context) {
    if (sent) {
      return Center(
        child: Text(AppLocalizations.of(context)!.thankYouForFeedback),
      );
    }

    return Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              width: 250,
              child: Row(
                children: [
                  for (var i = 1; i <= 5; i++)
                    IconButton(
                      icon: Icon(
                        i <= _rating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                      ),
                      onPressed: () {
                        setState(() {
                          _rating = i;
                        });
                      },
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 250,
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: AppLocalizations.of(context)!.nameLabel,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.nameIsRequired;
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 250,
              child: TextFormField(
                maxLines: 4,
                controller: _contentController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: AppLocalizations.of(context)!.contentLabel,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.contentIsRequired;
                  }
                  return null;
                },
              ),
            ),
            Consumer(builder: (context, ref, child) {
              return ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ref.read(feedbackProvider.notifier).addFeedback(
                        _nameController.text,
                        _contentController.text,
                        _rating * 10);
                    _formKey.currentState!.reset();
                    setState(() {
                      sent = true;
                    });
                  }
                },
                child: Text(AppLocalizations.of(context)!.sendButton),
              );
            })
          ],
        ));
  }
}
