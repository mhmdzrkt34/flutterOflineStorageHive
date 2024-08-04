import 'package:flutter/material.dart';
import 'package:flutterofflinepractice/model_views/home_model_view.dart';
import 'package:flutterofflinepractice/models/car_model.dart';
import 'package:flutterofflinepractice/models/store_model.dart';
import 'package:flutterofflinepractice/views/home_view.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async{


  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(StoreModelAdapter());

  Hive.registerAdapter(CarModelAdapter());
  await Hive.openBox<StoreModel>('storeBox');

  GetIt.instance.registerSingleton<HomeModelView>(HomeModelView());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(


      title: "flutterOfflinePractice",

      initialRoute: "home",

      routes: {

        "home":(context)=>HomeView()
      },


    );

  }
}



