import 'package:app_tcesp/components/drawer.dart';
import 'package:app_tcesp/components/footer.dart';
import 'package:app_tcesp/model/licitacoes_model.dart';
import 'package:app_tcesp/model/menus_model.dart';
import 'package:app_tcesp/repository/licitacoes_repository.dart';
import 'package:flutter/material.dart';

import '../icons.dart';

class LicitacoesScreen extends StatefulWidget {
  @override
  _LicitacoesScreenState createState() =>
      _LicitacoesScreenState();
}

class _LicitacoesScreenState extends State<LicitacoesScreen> {
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
          'Licitações - $municipio',
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
                  ])),
          child: FutureBuilder(
            future: LicitacoesRepository()
                .ListAllLicitacoes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                          height: 200, child: buildListView(snapshot.data)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(218, 142, 149, 0.65),
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12)),
                      child: Text(
                        'Voltar ao menu',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
      bottomSheet: FooterBuild(),
    );
  }

  ListView buildListView(
      List<LicitacoesModel> informacaoFinanceirasModel) {
    return ListView.builder(
      itemCount: informacaoFinanceirasModel.length,
      itemBuilder: (BuildContext context, int index) {
        LicitacoesModel listaInformacoes =
            informacaoFinanceirasModel[index];
        return buildCardInformacoes(listaInformacoes);
      },
    );
  }

  Container buildCardInformacoes(
      LicitacoesModel informacaoFinanceirasModel) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Card(
          elevation: 10,
          child: ExpansionTile(
            title: Text(informacaoFinanceirasModel.menu,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            trailing: Icon(Icons.arrow_drop_down_sharp,
                color: Colors.black, size: 35),
            children: <Widget>[
              ListTile(
                title: Text(
                  informacaoFinanceirasModel.conteudo,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              )
            ],
          )),
    );
  }
}
