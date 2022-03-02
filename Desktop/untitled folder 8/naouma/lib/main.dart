import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:naouma/create_new_room.dart';
import 'package:naouma/store_screen.dart';
import 'package:naouma/theme.dart';
import 'package:naouma/utils/constants.dart';
import 'package:naouma/utils/preferences_services.dart';
import 'package:naouma/view/home/homeCubit.dart';
import 'package:naouma/view/home/home_screen.dart';
import 'package:naouma/view/home/states.dart';
import 'package:naouma/view/login/logincubit.dart';
import 'package:naouma/view/splash/splash_screen.dart';
import 'package:naouma/create_new_room.dart';
import 'helper/binding.dart';
import 'network/local/cache_Helper.dart';
import 'network/remote/dioHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PreferencesServices.init();

  DioHelper.init();
  await CacheHelper.init();
  token = CacheHelper.getData(key: 'access_token');
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeCubit()),
        ],
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'نعومة',
              theme: themeData(),
              initialBinding: Binding(),
              home: SplashScreen(),
              routes: {
                "/home": (_) => Hello(),
              },
            );
          },
        ));
  }
}
