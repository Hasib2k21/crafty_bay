
import 'package:flutter/material.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController reviewController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Create Review',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                customTextFormField(
                  hintText: 'First Name',
                  controller: firstNameController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  theme: theme,
                  validator: (String? value){
                    if(value?.isEmpty?? true){
                      return "*Enter your first name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                customTextFormField(
                  hintText: 'Last Name',
                  controller: lastNameController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  theme: theme,
                  validator: (String? value){
                    if(value?.isEmpty?? true){
                      return "*Enter your last name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                customTextFormField(
                  hintText: 'Enter Review',
                  controller: reviewController,
                  maxLength: 10,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  theme: theme,
                  validator: (String? value){
                    if(value?.isEmpty?? true){
                      return "*Enter your review";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate() == false) {
                        return;
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField customTextFormField({
    required TextEditingController controller,
    required ThemeData theme,
    required String hintText,
    required TextInputType keyboardType,
    required TextInputAction textInputAction,
    required String? Function(String?) validator,
    int maxLength = 1,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: theme.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: theme.primaryColor),
        ),
      ),
      maxLines: maxLength,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
    );
  }
}
