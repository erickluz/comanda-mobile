import 'package:flutter/material.dart';
import 'home/home.dart';
import 'home/controle-comandas/listagem/lista-comandas.dart';

class Bootstrap extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Bootstrap> with SingleTickerProviderStateMixin {
  
  int telaSelecionada = 0;
  List<Widget> telasDoAplicativo = [
    Home(),
    ListaComanda(),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: telasDoAplicativo.length,);
    _tabController.addListener(() {
      setState(() {
        
      });
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