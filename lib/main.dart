import 'package:flutter/material.dart';
import 'app/models/quotation_model.dart';
import 'package:bot_toast/bot_toast.dart';
import 'app/modules/home/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/modules/sign_up/sign_up_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(QuotationModelAdapter());
  await Hive.openBox<QuotationModel>('quotations');
  final storage = await SharedPreferences.getInstance();

  runApp(
    MyApp(
      isLogedIn: storage.getBool('isLogedIn') ?? false,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLogedIn});

  final bool isLogedIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: BotToastInit(),
      navigatorObservers: [
        BotToastNavigatorObserver(),
      ],
      home: isLogedIn ? const HomeScreen() : SignUpScreen(),
    );
  }
}
