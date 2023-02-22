import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class Formvalidation extends StatefulWidget {
  const Formvalidation({super.key});

  @override
  State<Formvalidation> createState() => _FormvalidationState();
}

class _FormvalidationState extends State<Formvalidation> {
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (GetUtils.isUsername(value!)) {
                    return null;
                  }
                  return "Enter valid username";
                },
                decoration: const InputDecoration(
                    hintText: "Username",
                    labelText: "Username",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                //  autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (GetUtils.isEmail(value!)) {
                    return null;
                  }
                  return "Enter valid email";
                },
                decoration: const InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.phone,
                maxLength: 15,
                validator: (value) {
                  if (GetUtils.isPhoneNumber(value!)) {
                    return null;
                  }
                  return "Enter valid phone number";
                },
                decoration: const InputDecoration(
                    hintText: "Mobile Number",
                    labelText: "Mobile Number",
                    border: OutlineInputBorder()),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      // all correct
                    } else {
                      // error
                    }
                  },
                  child: const Text("Sign Up"))
            ],
          ),
        ),
      ),
    );
  }
}
