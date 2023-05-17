import 'package:client_project/home_page.dart';
import 'package:client_project/services/grid_data_service.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:client_project/services/user_auth_service_impl.dart';
import 'package:client_project/interfaces/user_auth_service.dart.dart';

void main() {
  runApp(MyApp(userAuthService: UserAuthServiceimpl()));
}

class MyApp extends StatefulWidget {
  final UserAuthService userAuthService;
  MyApp({super.key, required this.userAuthService});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    loadUserToken();
    super.initState();
  }

  loadUserToken() async {
    String? token = await widget.userAuthService.authenticate();
    if (token != null) {
      setState(() {
        isLoggedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: isLoggedIn
            ? HomePage(
                gridDataService: GridDataService(),
                userAuthService: widget.userAuthService)
            : Login(userAuthService: widget.userAuthService));
  }
}
