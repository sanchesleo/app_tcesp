import 'package:app_tcesp/model/licitacoes_model.dart';

class LicitacoesRepository{
  var listAllLicitacoes = <LicitacoesModel>[
      new LicitacoesModel(
        menu: 'Informações concernentes a\nprocedimentos licitatórios',
        conteudo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incid',
      ),
      new LicitacoesModel(
        menu: 'Resumo dos instrumentos\nde contrato',
        conteudo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incid',
      ),
      new LicitacoesModel(
        menu: 'Prestação de Contas',
        conteudo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incid',
      ),
      new LicitacoesModel(
        menu: 'Relações Mensais de todas\nas compras feitas',
        conteudo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incid',
      ),
    ];
  Future<List<LicitacoesModel>> ListAllLicitacoes() async{
    await Future.delayed(
      Duration(
        seconds:3,
      ),
    );
    return Future.value(listAllLicitacoes);
  }
}