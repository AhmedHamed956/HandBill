import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:naouma/controller/auth_controller.dart';
import 'package:naouma/utils/common_functions.dart';
import 'package:naouma/utils/constants.dart';
import 'package:naouma/view/login/registercubit.dart';
import 'package:naouma/view/login/registerstates.dart';
import 'package:nb_utils/nb_utils.dart';

class RegisterView extends StatelessWidget {
  TextEditingController confirmpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final style = TextStyle(fontFamily: 'Almarai', fontSize: 16.0);

    return BlocProvider(
      create: (BuildContext context) => RegisterScreenCubit(),
      child: BlocConsumer<RegisterScreenCubit, RegisterAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    finish(context);
                  }),
              elevation: 0,
              backgroundColor: white,
            ),
            body: GetBuilder<AuthController>(
              init: Get.find(),
              builder: (controller) => ModalProgressHUD(
                  child: Form(
                    key: controller.signFormKey,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _sizedBox(height: 100),
                            Text('Create new\naccount',
                                style: boldTextStyle(size: 30)),
                            _sizedBox(height: 30),
                            CommonFunctions().nbAppTextFieldWidget(
                              controller.nameController,
                              'Name',
                              "Enter your name",
                              'Name is required',
                              TextFieldType.NAME,
                            ),
                            _sizedBox(height: 16),
                            CommonFunctions().nbAppTextFieldWidget(
                              controller.phoneNumberController,
                              'phone',
                              "Enter your phone",
                              'phone is required',
                              TextFieldType.PHONE,
                            ),
                            16.height,
                            CommonFunctions().nbAppTextFieldWidget(
                              controller.signPasswordController,
                              'Password',
                              "Enter your password",
                              'Password is required',
                              TextFieldType.PASSWORD,
                            ),
                            16.height,
                            CommonFunctions().nbAppTextFieldWidget(
                              confirmpasswordController,
                              'Confirm Password',
                              "Enter your confirm password",
                              'Password is confirm required',
                              TextFieldType.PASSWORD,
                            ),
                            36.height,
                            // CommonFunctions().nbAppButtonWidget(
                            //     context, 'Create Account', () {
                            //   if (controller.signFormKey.currentState
                            //       .validate()) {
                            //     RegisterScreenCubit.get(context).userlogin(
                            //       phone: controller.phoneNumberController.text,
                            //       password:
                            //           controller.signPasswordController.text,
                            //       name: controller.nameController.text,
                            //       confirmpassword:
                            //           confirmpasswordController.text,
                            //     );

                            //     // controller.signFormKey.currentState.save();
                            //     // // No any error in validation
                            //     // controller.name =
                            //     //     controller.nameController.text;
                            //     // controller.registerEmail =
                            //     //     controller.signEmailController.text;
                            //     // controller.password =
                            //     //     controller.signPasswordController.text;
                            //     // controller.signUp();
                            //   }
                            // }),
                            30.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Have an Account?',
                                    style: primaryTextStyle()),
                                Text(' Sign In',
                                        style:
                                            boldTextStyle(color: kPrimaryColor))
                                    .onTap(() {
                                  finish(context);
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  inAsyncCall: controller.isLoading,
                  // demo of some additional parameters
                  opacity: 0.5,
                  progressIndicator:
                      Center(child: CircularProgressIndicator())),
            ),
          );
        },
      ),
    );
  }

  Widget _sizedBox({double width, double height}) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
