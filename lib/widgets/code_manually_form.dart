import 'package:fest_outdoor/localization/app_localizations.dart';
import 'package:fest_outdoor/views/ticket_detail.dart';
import 'package:flutter/material.dart';

class CodeManuallyForm extends StatefulWidget {
  const CodeManuallyForm({super.key});

  @override
  State<CodeManuallyForm> createState() => _CodeManuallyFormState();
}

class _CodeManuallyFormState extends State<CodeManuallyForm> {
  final TextEditingController _codeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            width: 250,
            child: TextFormField(
              controller: _codeController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: AppLocalizations.of(context)!.codeLabel,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.codeRequired;
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        TicketDetail(code: _codeController.value.text)));
              }
            },
            child: Text(AppLocalizations.of(context)!.codeManually),
          )
        ],
      ),
    );
  }
}
