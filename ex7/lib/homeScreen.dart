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
                  builder: (context) => UrgenceMessageDialog(
                  message: Provider.of<SosViewModel>(context, listen: false).getMessage,
                  ),
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
  final String message;

  const UrgenceMessageDialog({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  _UrgenceMessageDialogState createState() => _UrgenceMessageDialogState();
}

class _UrgenceMessageDialogState extends State<UrgenceMessageDialog> {
  final messageController = TextEditingController();
  final key = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
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
        IconButton(
          onPressed: () {
            if(key.currentState!.validate()){
              var provider = Provider.of<SosViewModel>(context, listen: false);
              provider.updateMessage(messageController.text);
              Navigator.pop(context);
            }
          },
          icon: const Icon(Icons.subdirectory_arrow_right),
          color: Colors.pinkAccent,
        ),
      ],
    );
  }
}