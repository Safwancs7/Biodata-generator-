import 'package:flutter/material.dart';

void main() {
  runApp(const BiodataApp());
}

class BiodataApp extends StatelessWidget {
  const BiodataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BiodataForm(),
    );
  }
}

class BiodataForm extends StatefulWidget {
  @override
  State<BiodataForm> createState() => _BiodataFormState();
}

class _BiodataFormState extends State<BiodataForm> {
  final _formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final ageCtrl = TextEditingController();
  final genderCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final skillsCtrl = TextEditingController();

  bool showBiodata = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Biodata Generator")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildField("Full Name", nameCtrl),
              buildField("Age", ageCtrl, isNumber: true),
              buildField("Gender", genderCtrl),
              buildField("Email", emailCtrl),
              buildField("Phone", phoneCtrl),
              buildField("Skills (comma separated)", skillsCtrl),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() => showBiodata = true);
                  }
                },
                child: const Text("Generate Biodata"),
              ),

              const SizedBox(height: 30),

              if (showBiodata) biodataCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField(String label, TextEditingController controller,
      {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        validator: (value) =>
            value == null || value.isEmpty ? "Required" : null,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget biodataCard() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "BIODATA",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            biodataRow("Name", nameCtrl.text),
            biodataRow("Age", ageCtrl.text),
            biodataRow("Gender", genderCtrl.text),
            biodataRow("Email", emailCtrl.text),
            biodataRow("Phone", phoneCtrl.text),
            biodataRow("Skills", skillsCtrl.text),
          ],
        ),
      ),
    );
  }

  Widget biodataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text("$label : $value"),
    );
  }
}
