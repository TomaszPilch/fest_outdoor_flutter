import 'package:fest_outdoor/localization/app_localizations.dart';
import 'package:flutter/material.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ElevatedButton(
          onPressed: () {
            print('Name: ${_nameController.text}');
            print('Content: ${_contentController.text}');
            print('Rating: $_rating');
          },
          child: Text(AppLocalizations.of(context)!.sendButton),
        ),
      ],
    );
  }
}
