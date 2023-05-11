import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String emergencyMessage = "I'm having an emergency at @loc, send help!";

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
                  builder: (context) => EmergencyMessageDialog(
                    initialMessage: emergencyMessage,
                    onSave: (newMessage) {
                      setState(() {
                        emergencyMessage = newMessage;
                      });
                    },
                  ),
                ),
                child: const Text("Change SOS Message"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class EmergencyMessageDialog extends StatefulWidget {
  final String initialMessage;
  final void Function(String newMessage) onSave;

  const EmergencyMessageDialog({
    Key? key,
    required this.initialMessage,
    required this.onSave,
  }) : super(key: key);

  @override
  _EmergencyMessageDialogState createState() => _EmergencyMessageDialogState();
}

class _EmergencyMessageDialogState extends State<EmergencyMessageDialog> {
  late TextEditingController messageController;

  @override
  void initState() {
    super.initState();
    messageController = TextEditingController(text: widget.initialMessage);
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Update SOS message"),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Write your new SOS message. You can fill in your actual location using @loc",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: messageController,
              style: const TextStyle(fontSize: 14),
              maxLines: null, // Display TextField on multiple lines
              decoration: const InputDecoration(
                labelText: "New message",
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSave(messageController.text);
            Navigator.pop(context);
          },
          child: const Text("Save"),
        ),
      ],
    );
  }
}