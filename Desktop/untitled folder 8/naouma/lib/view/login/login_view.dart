import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:naouma/controller/auth_controller.dart';
import 'package:naouma/network/local/cache_Helper.dart';
import 'package:naouma/utils/common_functions.dart';
import 'package:naouma/utils/constants.dart';
import 'package:naouma/view/home/home_screen.dart';
import 'package:naouma/view/login/logincubit.dart';
import 'package:naouma/view/login/register_view.dart';
import 'package:naouma/view/login/loginstates.dart';
import 'package:nb_utils/nb_utils.dart';

class LoginView extends StatelessWidget {
  GlobalKey<FormState> fomrkey = GlobalKey();

  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    // transformConfig.translate(-10.0);
    return BlocProvider(
      create: (BuildContext context) => LoginScreenCubit(),
      child: BlocConsumer<LoginScreenCubit, LoginAppStates>(
        listener: (context, state) {
          if (state is ShopLoginSuccessStates) {
            CacheHelper.saveData(
                    key: 'token', value: state.authModel.accessToken)
                .then((value) {
              print(state.authModel);
              Get.to(HomeScreen());
              // Navigator.pushReplacementNamed(context, "/home");
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: fomrkey,
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    // height: size.height,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _sizedBox(height: 100),
                        Text('Welcome to\n Na3oma',
                            style: boldTextStyle(size: 30)),
                        _sizedBox(height: 60),
                        CommonFunctions().nbAppTextFieldWidget(
                          phoneController,
                          'phone',
                          "Enter your phone",
                          'phone is required',
                          TextFieldType.PHONE,
                        ),
                        _sizedBox(height: 20),
                        CommonFunctions().nbAppTextFieldWidget(
                          passwordController,
                          'Password',
                          "Enter your password",
                          'Password is required',
                          TextFieldType.PASSWORD,
                        ),
                        _sizedBox(height: 28),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingState,
                          builder: (context) => CommonFunctions()
                              .nbAppButtonWidget(context, 'Sign In', () {
                            if (fomrkey.currentState.validate()) {
                              LoginScreenCubit.get(context).userlogin(
                                  mobile: phoneController.text,
                                  password: passwordController.text);
                            }
                            // controller.loginFormKey.currentState.save();
                            // // No any error in validation
                            // controller.loginEmail =
                            //     controller.phoneNumberController.text;
                            // controller.password =
                            //     controller.passwordController.text;

                            // controller.login();
                          }),
                          fallback: (context) => Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        _sizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t have an account?',
                                style: primaryTextStyle()),
                            Text(' Sign Up',
                                    style: boldTextStyle(color: kPrimaryColor))
                                .onTap(() {
                              Get.to(RegisterView());
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // demo of some additional parameters
          );
        },
      ),
    );
  }
}

// Widget build(BuildContext context) {
//   GlobalKey<FormState> fomrkey = GlobalKey();
//   var phoneController = TextEditingController();
//   var passwordController = TextEditingController();
//   FocusNode emailFocus = FocusNode();
//   FocusNode passwordFocus = FocusNode();

//   return BlocProvider(
//     create: (BuildContext context) => LoginScreenCubit(),
//     child: BlocConsumer<LoginScreenCubit, LoginAppStates>(
//       listener: (context, state) {
//         if (state is ShopLoginSuccessStates) {
//           CacheHelper.saveData(key: 'token', value: state.authModel.accessToken)
//               .then((value) {
//             token = state.authModel.accessToken;
//             print(token);
//             Navigator.pushReplacementNamed(context, "/home");
//           });
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//           body: Form(
//             key: fomrkey,
//             child: SingleChildScrollView(
//               child: Center(
//                 child: Container(
//                   // height: size.height,
//                   padding: const EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _sizedBox(height: 100),
//                       Text('Welcome to\n Na3oma',
//                           style: boldTextStyle(size: 30)),
//                       _sizedBox(height: 60),
//                       CommonFunctions().nbAppTextFieldWidget(
//                         phoneController,
//                         'phone',
//                         "Enter your phone",
//                         'Email is required',
//                         TextFieldType.PHONE,
//                       ),
//                       _sizedBox(height: 20),
//                       CommonFunctions().nbAppTextFieldWidget(
//                         passwordController,
//                         'Password',
//                         "Enter your password",
//                         'Password is required',
//                         TextFieldType.PASSWORD,
//                       ),
//                       _sizedBox(height: 28),
//                       ConditionalBuilder(
//                         condition: state is! ShopLoginLoadingState,
//                         builder: (context) => CommonFunctions()
//                             .nbAppButtonWidget(context, 'Sign In', () {
//                           if (fomrkey.currentState.validate()) {
//                             LoginScreenCubit.get(context).userlogin(
//                                 phone: phoneController.text,
//                                 password: passwordController.text);
//                           }
//                           // controller.loginFormKey.currentState.save();
//                           // // No any error in validation
//                           // controller.loginEmail =
//                           //     controller.phoneNumberController.text;
//                           // controller.password =
//                           //     controller.passwordController.text;

//                           // controller.login();
//                         }),
//                         fallback: (context) => Center(
//                           child: CircularProgressIndicator(),
//                         ),
//                       ),
//                       _sizedBox(height: 30),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text('Don\'t have an account?',
//                               style: primaryTextStyle()),
//                           Text(' Sign Up',
//                                   style: boldTextStyle(color: kPrimaryColor))
//                               .onTap(() {
//                             Get.to(RegisterView());
//                           }),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           // demo of some additional parameters
//         );
//       },
//     ),
//   );

//   // return BlocProvider(
//   //     create: (BuildContext context) => LoginScreenCubit(),
//   //     child: BlocConsumer<LoginScreenCubit, LoginAppStates>(
//   //       listener: (context, state) {
//   //         if (state is ShopLoginSuccessStates) {
//   //           CacheHelper.saveData(
//   //                   key: 'token', value: state.authModel.accessToken)
//   //               .then((value) {
//   //             Get.to(HomeScreen());
//   //           });
//   //         }
//   //       },
//   //       builder: (context, state) {
//   //         return Scaffold(
//   //           body: GetBuilder<AuthController>(
//   //             init: AuthController(),
//   //             builder: (controller) => ModalProgressHUD(
//   //                 child: Form(
//   //                   key: controller.loginFormKey,
//   //                   child: SingleChildScrollView(
//   //                     child: Center(
//   //                       child: Container(
//   //                         // height: size.height,
//   //                         padding: const EdgeInsets.all(16),
//   //                         child: Column(
//   //                           crossAxisAlignment: CrossAxisAlignment.start,
//   //                           mainAxisAlignment: MainAxisAlignment.center,
//   //                           children: [
//   //                             _sizedBox(height: 100),
//   //                             Text('Welcome to\n Na3oma',
//   //                                 style: boldTextStyle(size: 30)),
//   //                             _sizedBox(height: 60),
//   //                             CommonFunctions().nbAppTextFieldWidget(
//   //                               controller.phoneNumberController,
//   //                               'Email',
//   //                               "Enter your phone",
//   //                               'Email is required',
//   //                               TextFieldType.PHONE,
//   //                             ),
//   //                             _sizedBox(height: 20),
//   //                             CommonFunctions().nbAppTextFieldWidget(
//   //                               controller.passwordController,
//   //                               'Password',
//   //                               "Enter your password",
//   //                               'Password is required',
//   //                               TextFieldType.PASSWORD,
//   //                             ),
//   //                             _sizedBox(height: 28),
//   //                             CommonFunctions()
//   //                                 .nbAppButtonWidget(context, 'Sign In', () {
//   //                               if (controller.loginFormKey.currentState
//   //                                   .validate()) {
//   //                                 LoginScreenCubit.get(context).userlogin(
//   //                                     phone: controller
//   //                                         .phoneNumberController.text,
//   //                                     password:
//   //                                         controller.passwordController.text);
//   //                               }
//   //                               // controller.loginFormKey.currentState.save();
//   //                               // // No any error in validation
//   //                               // controller.loginEmail =
//   //                               //     controller.phoneNumberController.text;
//   //                               // controller.password =
//   //                               //     controller.passwordController.text;

//   //                               // controller.login();
//   //                             }),
//   //                             _sizedBox(height: 30),
//   //                             Row(
//   //                               mainAxisAlignment: MainAxisAlignment.center,
//   //                               children: [
//   //                                 Text('Don\'t have an account?',
//   //                                     style: primaryTextStyle()),
//   //                                 Text(' Sign Up',
//   //                                         style: boldTextStyle(
//   //                                             color: kPrimaryColor))
//   //                                     .onTap(() {
//   //                                   Get.to(RegisterView());
//   //                                 }),
//   //                               ],
//   //                             ),
//   //                           ],
//   //                         ),
//   //                       ),
//   //                     ),
//   //                   ),
//   //                 ),
//   //                 inAsyncCall: controller.isLoading,
//   //                 // demo of some additional parameters
//   //                 opacity: 0.5,
//   //                 progressIndicator:
//   //                     Center(child: CircularProgressIndicator())),
//   //           ),
//   //         );
//   //       },
//   //     ));
// }

Widget _sizedBox({double width, double height}) {
  return SizedBox(
    width: width,
    height: height,
  );
}
