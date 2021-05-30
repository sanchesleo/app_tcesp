import 'package:app_tcesp/components/drawer.dart';
import 'package:app_tcesp/components/footer.dart';
import 'package:app_tcesp/model/menus_model.dart';
import 'package:app_tcesp/model/receita_model.dart';
import 'package:flutter/material.dart';

import '../icons.dart';

class ReceitaScreen extends StatefulWidget {
  @override
  _ReceitaScreenState createState() => _ReceitaScreenState();
}

class _ReceitaScreenState extends State<ReceitaScreen> {
  @override
  Widget build(BuildContext context) {
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
    ReceitaModel receitaModel = ModalRoute.of(context).settings.arguments;
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
          'Receita',
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
        body: MyDrawer(informacoesPublicas: informacoesPublicas, despesas: despesas, receitas: receitas, licitacoes: licitacoes),
      ),
      body: FutureBuilder(
        future: buildContainerDespesas(receitaModel, context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return snapshot.data;
          }
        },
      ),
      bottomSheet: FooterBuild(),
    );
  }

  Future<Container> buildContainerDespesas(ReceitaModel receitaModel, BuildContext context) async {
    await Future.delayed(
      Duration(
        seconds: 3
      )
    );
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 50),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(220, 141, 141, 1),
                  Color.fromRGBO(120, 69, 247, 1),
                ],
              ),
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Text(
                '${receitaModel.mes}/${receitaModel.ano}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PDF',
                  style: TextStyle(color: Colors.white, fontSize: 45),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.35),
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    MyFlutterApp.fileicondownload,
                    color: Colors.white,
                    size: 100,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'CSV',
                  style: TextStyle(color: Colors.white, fontSize: 45),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.35),
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    MyFlutterApp.fileicondownload,
                    color: Colors.white,
                    size: 100,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'XLS',
                  style: TextStyle(color: Colors.white, fontSize: 45),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.35),
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    MyFlutterApp.fileicondownload,
                    color: Colors.white,
                    size: 100,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/home-screen'));
              },
              style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(218, 142, 149, 0.65),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40, vertical: 12)),
              child: Text(
                'Voltar ao menu',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
