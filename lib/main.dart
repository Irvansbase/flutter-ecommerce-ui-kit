import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:learning/pages/page_four/theme_provider.dart';
import 'package:learning/pages/payment/payment.dart';
import 'package:provider/provider.dart';

import 'package:learning/models/data_product.dart';
import 'package:learning/pages/details_page/details_page.dart';
import 'package:learning/pages/home_page.dart';
import 'package:learning/pages/intro_page.dart';
import 'package:learning/pages/page_two/page_two.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Shop()),
      // ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ],
    child: const MyApp(),
  ),
);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/intropage',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/intropage':
              return MaterialPageRoute(builder: (_) => const IntroPage());

            case '/homepage':
              return MaterialPageRoute(builder: (_) => const HomePage());

            case '/cartpage':
              return MaterialPageRoute(builder: (_) => const PageTwo());

            case '/payment':
              return MaterialPageRoute(builder: (_) => const PaymentPage());

            case '/detailspage':
              final args = settings.arguments;
              if (args is ProductCardA) {
                return MaterialPageRoute(
                  builder: (_) => DetailsPage(productA: args),
                );
              } else if (args is ProductCardB) {
                return MaterialPageRoute(
                  builder: (_) => DetailsPage(productB: args),
                );
              } else {
                return _errorRoute("Product tidak valid");
              }

            default:
              return _errorRoute("Halaman tidak ditemukan");
          }
        },
      ),
    );
  }

  Route _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(child: Text(message)),
      ),
    );
  }
}
