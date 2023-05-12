import 'package:ex7/view_model/SosViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelDialog extends StatefulWidget {
  const TelDialog({Key? key}) : super(key: key);

  @override
  State<TelDialog> createState() => _TelDialogState();
}

class _TelDialogState extends State<TelDialog> {
  final phoneController = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SosViewModel>(
      builder: (context, model, child) => AlertDialog(
        title: const Text("Manage your contacts SOS"),
        content: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: model.phones.length,
                  itemBuilder: (context, index) {
                    var phone = model.phones[index];
                    return ListTile(
                      title: Text(phone),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => model.removePhone(phone),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              const Text("Add a new phone number below:"),
              const SizedBox(height: 8),
              Form(
                key: key,
                child: Column(
                  children: [
                    TextFormField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter a new phone number",
                      ),
                      validator: (value) => (value == null || value == "")
                          ? "Phone number can't be empty"
                          : null,
                    ),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      model.addPhone(phoneController.text);
                      phoneController.clear();
                    }
                  },
                  child: const Text("submit")

              )
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              phoneController.clear();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}