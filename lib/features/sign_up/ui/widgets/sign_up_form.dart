import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/app_regex.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/features/sign_up/logic/sign_up_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../login/ui/widgets/password_validations.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: ColorsManager.lightGray,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Form(
        key: context.read<SignupCubit>().formKey,
        child: Column(
          children: [
            AppTextFormField(
              backgroundColor: ColorsManager.lightGray,
              prefixIcon:Icon(Icons.person,color: Colors.white,) ,

              hintText: 'Name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid name';
                }
              },
              controller: context.read<SignupCubit>().nameController,
              hintStyle: TextStyle(color: Colors.white),

            ),
            AppTextFormField(
              backgroundColor: ColorsManager.lightGray,
              prefixIcon:Icon(Icons.phone_android,color: Colors.white,) ,

              hintText: 'Phone number',
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isPhoneNumberValid(value)) {
                  return 'Please enter a valid phone number';
                }
              },
              controller: context.read<SignupCubit>().phoneController,
              hintStyle: TextStyle(color: Colors.white),

            ),
            AppTextFormField(
              backgroundColor: ColorsManager.lightGray,
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon:Icon(Icons.email_rounded,color: Colors.white,) ,

              hintText: 'Email',
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
                  return 'Please enter a valid email';
                }
              },
              controller: context.read<SignupCubit>().emailController,
            ),
            AppTextFormField(
              backgroundColor: ColorsManager.lightGray,
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon:Icon(Icons.lock_rounded,color: Colors.white,) ,

              controller: context.read<SignupCubit>().passwordController,
              hintText: 'Password',
              isObscureText: isPasswordObscureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordObscureText = !isPasswordObscureText;
                  });
                },
                child: Icon(
                  isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid password';
                }
              },
            ),
            AppTextFormField(
              backgroundColor: ColorsManager.lightGray,
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon:Icon(Icons.lock_rounded,color: Colors.white,) ,

              controller:
                  context.read<SignupCubit>().passwordConfirmationController,
              hintText: 'Password Confirmation',
              isObscureText: isPasswordConfirmationObscureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordConfirmationObscureText =
                        !isPasswordConfirmationObscureText;
                  });
                },
                child: Icon(
                  isPasswordConfirmationObscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid password';
                }
              },
            ),
            // PasswordValidations(
            //   hasLowerCase: hasLowercase,
            //   hasUpperCase: hasUppercase,
            //   hasSpecialCharacters: hasSpecialCharacters,
            //   hasNumber: hasNumber,
            //   hasMinLength: hasMinLength,
            // ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}