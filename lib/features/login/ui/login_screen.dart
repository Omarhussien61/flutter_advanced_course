import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/widgets/app_social_button.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../onboarding/widgets/doc_logo_and_name.dart';
import 'widgets/dont_have_account_text.dart';
import 'widgets/email_and_password.dart';
import 'widgets/login_bloc_listener.dart';
import 'widgets/terms_and_conditions_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DocLogoAndName(),
                verticalSpace(10),
                Text(
                  'Login',
                  style: TextStyles.font24BlackBold,
                ),
                verticalSpace(10),
                Column(
                  children: [
                    const EmailAndPassword(),
                    verticalSpace(10),

                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles.font10Black,
                      ),
                    ),
                    verticalSpace(30),
                    AppTextButton(
                      buttonWidth: ScreenUtil.defaultSize.width/1.5,

                      buttonText: "Login",
                      buttonHeight: 50,borderRadius: 50,
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(30),

                    Text(
                      'Or Login with',
                    ),
                    verticalSpace(30),

                    AppSocialButton(
                      buttonWidth: ScreenUtil.defaultSize.width/1.5,

                      icon:Icon(Icons.apple,color: Colors.black,size: 35,),
                      buttonText: "Continue with Apple",
                      buttonHeight: 50,borderRadius: 5,
                      horizontalPadding: 1,
                      verticalPadding: 1,
                      textStyle: TextStyles.font16Black,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(5),

                    Text(
                      'Or',
                    ),
                    verticalSpace(5),
                    AppSocialButton(
                      buttonWidth: ScreenUtil.defaultSize.width/1.5,

                      icon:Image.asset('assets/images/google.png',height: 30,),
                      buttonText: "Continue with Google",
                      buttonHeight: 50,borderRadius: 5,
                      horizontalPadding: 1,
                      verticalPadding: 1,
                      textStyle: TextStyles.font16Black,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(50),

                    const DontHaveAccountText(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
