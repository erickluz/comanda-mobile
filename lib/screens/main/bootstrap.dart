import 'package:comanda/screens/main/comanda/body-listagem-de-comandas.dart';
import 'package:comanda/screens/main/home/home.dart';
import 'package:flutter/material.dart';

class Bootstrap extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Bootstrap> with SingleTickerProviderStateMixin {
  int telaSelecionada = 0;

  List<Widget> telasDoAplicativo = [
    Home(),
    BodyListagemComandas(),
  ];

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: telasDoAplicativo,
    );
  }

  void pageChanged(int index) {
    setState(() {
      telaSelecionada = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      telaSelecionada = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Comandas"),
      ),
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.view_list), title: Text("Comandas")),
        ],
        currentIndex: telaSelecionada,
        onTap: (int index) {
          bottomTapped(index);
        },
      ),
    );
  }
}
