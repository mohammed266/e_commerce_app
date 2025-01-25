import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/service_lacator.dart';
import 'core/helper/bloc_observer.dart';
import 'core/routing/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/shared_pref/shared_pref.dart';
import 'e_commerce_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await SharedPref.init();
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ECommerceApp(appRouter: AppRouter()));
}
