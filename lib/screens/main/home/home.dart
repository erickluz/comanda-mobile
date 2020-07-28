import 'package:comanda/screens/login/pre-login.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.bottomRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.exit_to_app,
                color: Colors.blueGrey,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => PreLogin()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    "Logout",
                    textAlign: TextAlign.center,
                    style: (TextStyle(color: Colors.blueGrey)),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Text("Home"),
          ),
        ),
      ],
    );
  }
}
