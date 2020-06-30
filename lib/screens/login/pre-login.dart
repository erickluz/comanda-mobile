import 'package:comanda/screens/main/bootstrap.dart';
import 'package:flutter/material.dart';

class PreLogin extends StatefulWidget {
  @override
  _PreLoginState createState() => _PreLoginState();
}

class _PreLoginState extends State<PreLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 130,
                height: 130,
                child: ClipOval(
                  child: Container(
                    color: Colors.white,
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            Container(
                child: Text(
              "Minhas Comandas",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 31,
                color: Colors.white,
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: new Color(0xFF295396),
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Container(
                          child: Image.asset(
                            "assets/facebook-logo.png",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Text(
                          "ENTRAR COM O FACEBOOK",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: new Color(0xFF4086f5),
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: Image.asset(
                            "assets/google-logo.png",
                            fit: BoxFit.fitHeight,
                          ),
                        )),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Center(
                          child: Text(
                            "ENTRAR COM O GOOGLE",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                        child: Center(
                            child: Container(
                                child: Text(
                      "ou",
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.white),
                    )))),
                    Expanded(
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonTheme(
                minWidth: double.infinity,
                height: 50,
                child: RaisedButton.icon(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  color: Colors.orange,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Bootstrap()),
                    );
                  },
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  label: Text(
                    "ENTRAR",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonTheme(
                minWidth: double.infinity,
                height: 50,
                child: RaisedButton.icon(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  color: Colors.white,
                  onPressed: () {},
                  icon: Icon(Icons.mail),
                  label: Text(
                    "CADASTRAR-SE",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
