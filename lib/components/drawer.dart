import 'package:app_tcesp/model/menus_model.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
    @required this.informacoesPublicas,
    @required this.municipio,
    @required this.despesas,
    @required this.receitas,
    @required this.licitacoes,
  }) : super(key: key);

  final MenuModel informacoesPublicas;
  final String municipio;
  final MenuModel despesas;
  final MenuModel receitas;
  final MenuModel licitacoes;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(120, 69, 247, 1),
            ),
            child: Container(
              child: Center(
                child: Text(
                  'TCESP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            color: informacoesPublicas.bgColorMenu,
            child: ListTile(
              leading: Icon(
                informacoesPublicas.iconeMenu,
                size: 30,
                color: Colors.white,
              ),
              title: Text(informacoesPublicas.tituloMenu,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
              onTap: () {
                Navigator.pushNamed(
                  context, '/informacao-financeira',
                  arguments: municipio
                    );
              },
            ),
          ),
          SizedBox(height: 25),
          Card(
            elevation: 10,
            color: despesas.bgColorMenu,
            child: ListTile(
              leading: Icon(
                despesas.iconeMenu,
                size: 30,
                color: Colors.white,
              ),
              title: Text(despesas.tituloMenu,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
              onTap: () {
                Navigator.pushNamed(context, '/despesas-form',arguments: municipio);
              },
            ),
          ),
          SizedBox(height: 25),
          Card(
            elevation: 10,
            color: receitas.bgColorMenu,
            child: ListTile(
              leading: Icon(
                receitas.iconeMenu,
                size: 30,
                color: Colors.white,
              ),
              title: Text(receitas.tituloMenu,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
              onTap: () {
                Navigator.pushNamed(context, '/receita-form',arguments: municipio);
              },
            ),
          ),
          SizedBox(height: 25),
          Card(
            elevation: 10,
            color: licitacoes.bgColorMenu,
            child: ListTile(
              leading: Icon(
                licitacoes.iconeMenu,
                size: 30,
                color: Colors.white,
              ),
              title: Text(licitacoes.tituloMenu,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
              onTap: () {
                Navigator.pushNamed(context, '/licitacoes',arguments: municipio);
              },
            ),
          ),
          SizedBox(height: 25),
          Card(
            elevation: 10,
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
    );
  }
}
