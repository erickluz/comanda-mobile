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

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: telasDoAplicativo.length,
    );
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comandas"),
      ),
      body: TabBarView(
        controller: _tabController,
        children: telasDoAplicativo,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_list), title: Text("Comandas")),
        ],
        currentIndex: telaSelecionada,
        onTap: (int index) {
          setState(() {
            telaSelecionada = index;
          });
          _tabController.animateTo(telaSelecionada);
        },
      ),
    );
  }
}
