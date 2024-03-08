import 'dart:io';
import 'package:flutter/material.dart';
import 'package:smart_journal/db_functions/registration_function.dart';
import 'package:smart_journal/companymodels/registration_model.dart';
import 'package:smart_journal/screens/authentication/buttonwidget.dart';
import 'package:smart_journal/screens/authentication/loginscreen.dart';
import 'package:smart_journal/screens/authentication/textfieldwidget.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final chittyNameController = TextEditingController();

  final contactNumController = TextEditingController();

  final whatsappLinkController = TextEditingController();

  final userIdSignupController = TextEditingController();

  final passwordSignupController = TextEditingController();
  BuildContext? _context;
  @override
  void initState() {
    super.initState();
    _context = context; // Store context in state variable
  }

  final formKeys = GlobalKey<FormState>();
  var imagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background_image/loginbak.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: formKeys,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: FileImage(File(imagePath)),
                            backgroundColor:
                                const Color.fromRGBO(199, 245, 245, 1),
                            radius: 50,
                            child: IconButton(
                                onPressed: () {
                                  pickAndSaveImage(context);
                                },
                                icon: const Icon(
                                  Icons.add_a_photo,
                                  color: Color.fromARGB(150, 0, 0, 0),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Register Your Chitty',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 20),
                      textField(
                          hintText: 'Enter Chitty Name',
                          icons: Icons.domain,
                          controller: chittyNameController,
                          validator: (name) => name!.length < 3
                              ? 'Name should be 3 character'
                              : null),
                      const SizedBox(height: 20),
                      textField(
                          keyboardtype: TextInputType.phone,
                          hintText: 'Enter Contact Number',
                          icons: Icons.contacts,
                          controller: contactNumController,
                          validator: (contact) => contact!.length < 10
                              ? 'Contact should be 10 character'
                              : null),
                      const SizedBox(height: 20),
                      textField(
                          hintText: 'Whatsapp Group Link',
                          icons: Icons.chat,
                          controller: whatsappLinkController,
                          validator: (link) => link!.length < 3
                              ? 'Whatsapp Link should be 3 character'
                              : null),
                      const SizedBox(height: 20),
                      textField(
                          hintText: 'Enter User id',
                          icons: Icons.account_box,
                          controller: userIdSignupController,
                          validator: (userId) => userId!.length < 3
                              ? 'User Id should be 4 character'
                              : null),
                      const SizedBox(height: 20),
                      textField(
                          hintText: 'Enter password',
                          icons: Icons.lock,
                          controller: passwordSignupController,
                          validator: (password) => password!.length < 3
                              ? 'Name should be 3 character'
                              : null),
                      const SizedBox(height: 20),
                      buttons(
                        buttonAction: () {
                          if (formKeys.currentState!.validate()) {
                            collectDataOnclick(context);
                          }
                        },
                        buttonName: 'Register',
                        color: const Color.fromRGBO(0, 205, 255, 1),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'All ready Register account?',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginScreen()),
                                (Route<dynamic> route) => false,
                              );
                            },
                            child: const Text(
                              'Sign In',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pickAndSaveImage(BuildContext context) async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imagePath = pickedImage.path;
      });
      ScaffoldMessenger.of(_context!).showSnackBar(
        const SnackBar(
          content: Text('Image saved successfully!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(_context!).showSnackBar(
        const SnackBar(
          content: Text('No image selected.'),
        ),
      );
    }
  }

  void collectDataOnclick(context) async {
    // values from textfield is add to a variable
    final chittyName = chittyNameController.text.trim();
    final contactNum = contactNumController.text.trim();
    final whatsapplink = whatsappLinkController.text.trim();
    final userId = userIdSignupController.text.trim();
    final password = passwordSignupController.text.trim();
// cheching value is empty
    if (chittyName.isEmpty &&
        contactNum.isEmpty &&
        whatsapplink.isEmpty &&
        userId.isEmpty &&
        password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Text field Can\'t Empty'),
          duration: Duration(seconds: 2),
        ),
      );
    }
    // converting the variable value from textfield to a modelclass format
    final data = RegistrationModel(
        companyName: chittyName,
        password: password,
        phoneNumber: contactNum,
        userId: userId,
        whatsappLink: whatsapplink,
        imagePath: imagePath);
    // passing and adding data from textfield to hive
    insertData(data);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Registration Successful'),
        duration: Duration(seconds: 2),
      ),
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => LoginScreen(),
      ),
    );
  }
}
