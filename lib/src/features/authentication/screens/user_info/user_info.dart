import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/constants/image_strings.dart';
import 'package:flutter_application_1/src/features/authentication/model/user_model.dart';
import 'package:flutter_application_1/src/features/authentication/provider/auth_provider.dart';
import 'package:flutter_application_1/src/features/authentication/screens/contacts/contact_support.dart';
import 'package:flutter_application_1/src/features/core/controllers/navbar.dart';
import 'package:flutter_application_1/src/features/core/screens/profile/profile.dart';
import 'package:flutter_application_1/src/utils/utils.dart';
import 'package:flutter_application_1/src/constants/colors.dart';
import 'package:flutter_application_1/src/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  File? image;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
  }

  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider1>(context, listen: true).isLoading;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complete Profile"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child:
            isLoading == true
                ? const Center(
                  child: CircularProgressIndicator(color: tPrimaryColor),
                )
                : SingleChildScrollView(
                  padding: const EdgeInsets.all(tDefaultSize),
                  child: Center(
                    child: Column(
                      children: [
                        // Profile Picture
                        InkWell(
                          onTap: selectImage,
                          child: Stack(
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  border: Border.all(color: tSecondaryColor),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child:
                                    image == null
                                        ? Image.asset(tProfileImg)
                                        : ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                          child: Image.file(
                                            image!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: tPrimaryColor,
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: tFormHeight),

                        // Form Fields
                        Form(
                          child: Column(
                            children: [
                              // Name Field
                              TextFormField(
                                controller: nameController,
                                cursorColor: tPrimaryColor,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: tPrimaryColor,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Full Name",
                                  labelStyle: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.grey.shade600,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 18,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: tPrimaryColor,
                                      width: 2,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person_outline,
                                    color: tPrimaryColor,
                                  ),
                                ),
                              ),

                              const SizedBox(height: tFormHeight - 20),

                              // Email Field
                              TextFormField(
                                controller: emailController,
                                cursorColor: tPrimaryColor,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: tPrimaryColor,
                                ),
                                decoration: InputDecoration(
                                  labelText: "E-mail",
                                  labelStyle: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.grey.shade600,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 18,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: tPrimaryColor,
                                      width: 2,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: tPrimaryColor,
                                  ),
                                ),
                              ),
                              const SizedBox(height: tFormHeight - 20),

                              // Bio Field
                              TextFormField(
                                controller: bioController,
                                cursorColor: tPrimaryColor,
                                maxLines: 3,
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.black87,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Tell others about yourself",
                                  labelStyle: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                  prefixIcon: Icon(
                                    Icons.edit_outlined,
                                    color: tPrimaryColor,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 16,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: tPrimaryColor,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: tFormHeight - 15),

                              // Continue Button
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: OutlinedButton.styleFrom(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadiusGeometry.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    foregroundColor: tWhiteColor,
                                    backgroundColor: tPrimaryColor,
                                    side: const BorderSide(
                                      color: tSecondaryColor,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: tButtonHeight,
                                    ),
                                  ),
                                  onPressed: () => storeData(),
                                  child: const Text("CONTINUE"),
                                ),
                              ),
                              const SizedBox(height: tFormHeight - 15),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: TextButton(
                                  onPressed:
                                      () => Get.to(
                                        () => const ContactSupportScreen(),
                                      ),
                                  child: Text.rich(
                                    TextSpan(
                                      text: "Need help? ",
                                      style: TextStyle(color: Colors.grey[600]),
                                      children: const [
                                        TextSpan(
                                          text: "Contact Support",
                                          style: TextStyle(
                                            color: tPrimaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
      ),
    );
  }

  //store userdata to db
  void storeData() async {
    final ap = Provider.of<AuthProvider1>(context, listen: false);
    UserModel userModel = UserModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      bio: bioController.text.trim(),
      profilePic: "",
      createdAt: "",
      phoneNumber: "",
      uid: "",
    );
    if (image != null) {
      ap.saveUserDataToFirebase(
        context: context,
        userModel: userModel,
        profilePic: image!,
        onSuccess: () {
          //once data is saved we need to store it locally also
          ap.saveUserDataToSP().then(
            (value) => ap.setSignIn().then(
              (value) => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const NavBar()),
                (route) => false,
              ),
            ),
          );
        },
      );
    } else {
      showSnackBar(context, "Please upload your profile photo");
    }
  }
}
