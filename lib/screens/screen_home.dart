import 'package:app_tcesp/components/drawer.dart';
import 'package:app_tcesp/components/footer.dart';
import 'package:app_tcesp/model/menus_model.dart';

import 'package:flutter/material.dart';
import '../icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MenuModel informacoesPublicas = new MenuModel(
      tituloMenu: "Informações Públicas",
      iconeMenu: MyFlutterApp.institucional_icon,
      bgColorMenu: Color.fromRGBO(120, 69, 247, 1));
  MenuModel despesas = new MenuModel(
      tituloMenu: "Despesas",
      iconeMenu: MyFlutterApp.contas_publicas,
      bgColorMenu: Color.fromRGBO(84, 70, 120, 1));
  MenuModel receitas = new MenuModel(
      tituloMenu: "Receitas",
      iconeMenu: MyFlutterApp.dashboard,
      bgColorMenu: Color.fromRGBO(174, 144, 249, 1));
  MenuModel licitacoes = new MenuModel(
      tituloMenu: "Licitações",
      iconeMenu: MyFlutterApp.contratacoes,
      bgColorMenu: Color.fromRGBO(50, 41, 71, 1));
  @override
  Widget build(BuildContext context) {
    String municipio = ModalRoute.of(context).settings.arguments;
    municipio = municipio.toUpperCase();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(120, 69, 247, 1),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                MyFlutterApp.menu_hamburguer,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        centerTitle: true,
        title: Text(
          'TCESP - $municipio',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
      ),
      drawer: Scaffold(
        backgroundColor: Colors.transparent,
        body: MyDrawer(informacoesPublicas: informacoesPublicas, municipio: municipio, despesas: despesas, receitas: receitas, licitacoes: licitacoes),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/informacao-financeira',
                        arguments: municipio);
                  },
                  child: Card(
                    elevation: 10,
                    color: informacoesPublicas.bgColorMenu,
                    child: Container(
                      width: 160,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 60, bottom: 20),
                            child: Icon(
                              informacoesPublicas.iconeMenu,
                              color: Colors.white,
                              size: 70,
                            ),
                          ),
                          Center(
                            child: Text(informacoesPublicas.tituloMenu,
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/despesas-form',
                        arguments: municipio);
                  },
                  child: Card(
                    elevation: 10,
                    color: despesas.bgColorMenu,
                    child: Container(
                      width: 160,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(bottom: 20),
                            child: Icon(
                              despesas.iconeMenu,
                              color: Colors.white,
                              size: 70,
                            ),
                          ),
                          Center(
                            child: Text(despesas.tituloMenu,
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/receita-form',
                        arguments: municipio);
                  },
                  child: Card(
                    elevation: 10,
                    color: receitas.bgColorMenu,
                    child: Container(
                      width: 160,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(bottom: 20),
                            child: Icon(
                              receitas.iconeMenu,
                              color: Colors.white,
                              size: 70,
                            ),
                          ),
                          Center(
                            child: Text(receitas.tituloMenu,
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/licitacoes',
                        arguments: municipio);
                  },
                  child: Card(
                    elevation: 10,
                    color: licitacoes.bgColorMenu,
                    child: Container(
                      width: 160,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(bottom: 20),
                            child: Icon(
                              licitacoes.iconeMenu,
                              color: Colors.white,
                              size: 70,
                            ),
                          ),
                          Center(
                            child: Text(licitacoes.tituloMenu,
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height:35
            ),
             Card(
                elevation: 10,
                margin: EdgeInsets.symmetric(horizontal: 50),
                color: Color.fromRGBO(220, 141, 141, 1),
                child: ListTile(
                  leading: Icon(
                    Icons.account_balance_sharp,
                    size: 30,
                    color: Colors.white,
                  ),
                  title: Text(
                      'Novo município',
                      style: TextStyle(
                        color: Colors.white,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                ),
              ),
          ],
        ),
      ),
      bottomSheet: FooterBuild(),
    );
  }
}

