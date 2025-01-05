import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/widgets/app_social_button.dart';
import 'package:flutter_complete_project/features/onboarding/widgets/doc_logo_and_name.dart';
import 'package:flutter_complete_project/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:flutter_complete_project/features/sign_up/ui/widgets/sign_up_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../login/ui/widgets/terms_and_conditions_text.dart';
import '../logic/sign_up_cubit.dart';
import 'widgets/already_have_account_text.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DocLogoAndName(),
                Text(
                  'SignUp',
                  style: TextStyles.font24BlackBold,
                ),
                verticalSpace(10),

                Column(
                  children: [
                    const SignupForm(),
                    verticalSpace(40),
                    AppTextButton(
                      buttonHeight: 55,
                      borderRadius: 50,
                      buttonWidth: ScreenUtil.defaultSize.width/1.5,
                      buttonText: "SignUp",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
                    ),
                    verticalSpace(30),

                    Text(
                      'or signup with',
                    ),
                    verticalSpace(30),

                    AppSocialButton(
                      icon:Icon(Icons.apple,color: Colors.black,size: 35,),
                      buttonText: "Continue with Apple",
                      buttonHeight: 50,borderRadius: 5,
                      horizontalPadding: 1,
                      verticalPadding: 1,
                      buttonWidth: ScreenUtil.defaultSize.width/1.5,

                      textStyle: TextStyles.font16Black,
                      onPressed: () {
                      },
                    ),
                    verticalSpace(5),

                    Text(
                      'or',
                    ),
                    verticalSpace(5),
                    AppSocialButton(
                      icon:Image.asset('assets/images/google.png',height: 30,),
                      buttonText: "Continue with Google",
                      buttonHeight: 50,borderRadius: 5,
                      horizontalPadding: 1,
                      verticalPadding: 1,
                      buttonWidth: ScreenUtil.defaultSize.width/1.5,

                      textStyle: TextStyles.font16Black,
                      onPressed: () {
                      },
                    ),
                    verticalSpace(50),
                    verticalSpace(30),
                    const AlreadyHaveAccountText(),
                    const SignupBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}