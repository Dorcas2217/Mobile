import 'package:ex7/TelDialog.dart';
import 'package:ex7/view_model/SosViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SoSapP")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => UrgenceMessageDialog(),
                ),
                child: const Text("Change SOS Message"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => const TelDialog(),
                ),
                child: const Text("Manage your contacts SOS"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  var provider = Provider.of<SosViewModel>(context, listen: false);
                  await provider.sendSOS();
                },
                child: const Text("Send message to evreyone !"),
              )

            ],
          ),
        ),
      ),
    );
  }
}


class UrgenceMessageDialog extends StatefulWidget {

  const UrgenceMessageDialog({
    Key? key,
  }) : super(key: key);

  @override
  _UrgenceMessageDialogState createState() => _UrgenceMessageDialogState();
}

class _UrgenceMessageDialogState extends State<UrgenceMessageDialog> {
  final messageController = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    messageController.text = Provider.of<SosViewModel>(context,listen: false).getMessage;
    return AlertDialog(
      title: const Text("Update SOS message"),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Write your new SOS message.",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Form(
              key: key,
              child: Column(
                children: [
                  TextFormField(
                  controller: messageController,
                  style: const TextStyle(fontSize: 14),
                  decoration: const InputDecoration(
                      labelText: "New message",
                    ),
                    validator: (value) => (value == null || value == "")
                        ? "message can not be empty "
                        : null,
                  )
                ],),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            if(key.currentState!.validate()){
              var provider = Provider.of<SosViewModel>(context, listen: false);
              provider.updateMessage(messageController.text);
              Navigator.pop(context);
            }
          },
          child: const Text("Save"),
        ),
      ],
    );
  }
}