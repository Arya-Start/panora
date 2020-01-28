import 'package:panora/models/cart.dart';
import 'package:panora/provider/response_provider.dart';
import 'package:provider/provider.dart';

import 'imp.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<Book>(create: (context) => Book()),
          Provider<Cart>(create: (context) => Cart()),
          Provider<Author>(create: (context) => Author()),
          Provider<ResponseProvider>(create: (context) => ResponseProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Panora',
          theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: Colors.white,
              fontFamily: 'Lato',
              scaffoldBackgroundColor: Color(0xFFF4F5F9)),
          home: WelcomeScreen(),
          //  home: WelcomeScreen(),
        ));
  }
}
