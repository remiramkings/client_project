import 'package:client_project/interfaces/user_auth_service.dart.dart';
import 'package:client_project/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget{
  final UserAuthService userAuthService;
  NavDrawer({super.key, required this.userAuthService});

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FloatingActionButton(
      child: const Text("Yes"),
      onPressed: () async {
        await userAuthService.logout();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Login(
                  userAuthService: userAuthService)),
        );
      },
    );

    Widget cancelButton = FloatingActionButton(
      child: const Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text('User session'),
      content: const Text("Logout from the Todo  Sales Application"),
      actions: [
        cancelButton,
        okButton
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
              child: Text(
                'Sales TODO',
                style: TextStyle(fontSize: 25),
              )
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Logout'),
            onTap: () async {
              showAlertDialog(context);
            },
          )
        ],
      ),
    );
  }

}