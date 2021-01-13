import 'package:flutter/services.dart';
import 'models/impressao_codigo_barras/hri_impressao_codigo_barras.dart';
import 'models/impressao_qr_code/nivel_correcao_impressao_qr_code.dart';
import 'models/impressao_texto/posicao_impressao_texto.dart';
import 'models/impressao_texto/stilo_impressao_texto.dart';
import 'models/impressao_texto/tamanho_impressao_texto.dart';
import 'models/m8_resposta_model.dart';

class M8Functions {
  static final MethodChannel _channel = const MethodChannel('M8_printer');

  Future<M8RespostaModel> avancaPapel({int linhas}) async {
    final int _linhas = linhas ?? 20;
    final int _codigoResposta =
        await _channel.invokeMethod('avancaPapel', {"linhas": _linhas});
    final bool _erro = _codigoResposta.toString() != '0';
    final String _mensagem =
        _erro ? "avancaPapel: ok" : "avancaPapel: erro codigo $_codigoResposta";
    final M8RespostaModel _resposta = M8RespostaModel(
        erro: _erro, mensagem: _mensagem, codigoResposta: _codigoResposta);
    return _resposta;
  }

  Future<M8RespostaModel> corte({int avanco}) async {
    final int _avanco = avanco ?? 20;
    final int _codigoResposta =
        await _channel.invokeMethod('corte', {"avanco": _avanco});
    final bool _erro = _codigoResposta.toString() != '0';
    final String _mensagem =
        _erro ? "corte: ok" : "corte: erro codigo $_codigoResposta";
    final M8RespostaModel _resposta = M8RespostaModel(
        erro: _erro, mensagem: _mensagem, codigoResposta: _codigoResposta);
    return _resposta;
  }

  Future<M8RespostaModel> impressaoCodigoBarras({
    String dados,
    int largura,
    HriImpressaoCodigoBarras hri,
  }) async {
    hri = hri ?? HriImpressaoCodigoBarras.nenhum;
    largura = largura ?? 1;
    final int _tipo = 2;
    final String _dados = dados ?? '';
    final int _largura = largura > 6 ? 6 : largura;
    final int _hri = hri.index;
    final int _codigoResposta =
        await _channel.invokeMethod('impressaoCodigoBarras', {
      "tipo": _tipo,
      "dados": _dados,
      "largura": _largura,
      "hri": _hri,
    });
    final bool _erro = _codigoResposta.toString() != '0';
    final String _mensagem = _erro
        ? "impressaoCodigoBarras: ok"
        : "impressaoCodigoBarras: erro codigo $_codigoResposta";
    final M8RespostaModel _resposta = M8RespostaModel(
        erro: _erro, mensagem: _mensagem, codigoResposta: _codigoResposta);
    return _resposta;
  }

  Future<M8RespostaModel> impressaoQRCode({
    String dados,
    int tamanho,
    NivelCorrecaoImpressaoQRCode nivel,
  }) async {
    nivel = nivel ?? NivelCorrecaoImpressaoQRCode.setePorCento;
    final String _dados = dados ?? '';
    final int _tamanho = tamanho ?? 1;
    final int _nivel = nivel.index;
    final int _codigoResposta = await _channel.invokeMethod('impressaoQRCode', {
      "dados": _dados,
      "tamanho": _tamanho,
      "nivel": _nivel,
    });
    final bool _erro = _codigoResposta.toString() != '0';
    final String _mensagem = _erro
        ? "impressaoQRCode: ok"
        : "impressaoQRCode: erro codigo $_codigoResposta";
    final M8RespostaModel _resposta = M8RespostaModel(
        erro: _erro, mensagem: _mensagem, codigoResposta: _codigoResposta);
    return _resposta;
  }

  Future<M8RespostaModel> impressaoTexto({
    String dados,
    PosicaoImpressaoTexto posicao,
    StiloImpressaoTexto stilo,
    LarguraTamanhoImpressaoTexto largura,
    AlturaTamanhoImpressaoTexto altura,
  }) async {
    stilo = stilo ?? StiloImpressaoTexto.fonteA;
    posicao = posicao ?? PosicaoImpressaoTexto.esquerda;
    final String _dados = dados ?? '';
    final int _posicao = posicao.index;
    final int _stilo = stilo.index;
    final int _tamanho = tamanhoImpressaoTexto(largura, altura);
    final int _codigoResposta = await _channel.invokeMethod('impressaoTexto', {
      "dados": _dados,
      "posicao": _posicao,
      "stilo": _stilo,
      "tamanho": _tamanho,
    });
    final bool _erro = _codigoResposta.toString() != '0';
    final String _mensagem = _erro
        ? "impressaoTexto: ok"
        : "impressaoTexto: erro codigo $_codigoResposta";
    final M8RespostaModel _resposta = M8RespostaModel(
        erro: _erro, mensagem: _mensagem, codigoResposta: _codigoResposta);
    return _resposta;
  }
}
