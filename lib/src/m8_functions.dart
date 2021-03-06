import 'package:flutter/services.dart';
import 'package:veev_m8_utils/src/models/imprime_xml_nfce/param_imprime_xml_nfce.dart';
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
        _erro ? "avancaPapel: erro codigo $_codigoResposta" : "avancaPapel: ok";
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
        _erro ? "corte: erro codigo $_codigoResposta" : "corte: ok";
    final M8RespostaModel _resposta = M8RespostaModel(
        erro: _erro, mensagem: _mensagem, codigoResposta: _codigoResposta);
    return _resposta;
  }

  Future<M8RespostaModel> impressaoCodigoBarras({
    String dados,
    int altura,
    int largura,
    HriImpressaoCodigoBarras hri,
  }) async {
    hri = hri ?? HriImpressaoCodigoBarras.nenhum;
    largura = largura ?? 1;
    altura = altura ?? 1;
    final int _tipo = 2;
    final String _dados = dados ?? '';
    final int _altura = altura > 255 ? 255 : altura;
    final int _largura = largura > 6 ? 6 : largura;
    final int _hri = hri.index;
    final int _codigoResposta =
        await _channel.invokeMethod('impressaoCodigoBarras', {
      "tipo": _tipo,
      "dados": _dados,
      "altura": _altura,
      "largura": _largura,
      "hri": _hri,
    });
    final bool _erro = _codigoResposta.toString() != '0';
    final String _mensagem = _erro
        ? "impressaoCodigoBarras: erro codigo $_codigoResposta"
        : "impressaoCodigoBarras: ok";
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
    tamanho = tamanho ?? 1;
    final String _dados = dados ?? '';
    final int _tamanho = tamanho > 6 ? 6 : tamanho;
    final int _nivel = nivel.index + 1;
    final int _codigoResposta = await _channel.invokeMethod('impressaoQRCode', {
      "dados": _dados,
      "tamanho": _tamanho,
      "nivelCorrecao": _nivel,
    });
    final bool _erro = _codigoResposta.toString() != '0';
    final String _mensagem = _erro
        ? "impressaoQRCode: erro codigo $_codigoResposta"
        : "impressaoQRCode: ok";
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
    final bool _erro = _codigoResposta < 0;
    final String _mensagem = _erro
        ? "impressaoTexto: erro codigo $_codigoResposta"
        : "impressaoTexto: ok";
    final M8RespostaModel _resposta = M8RespostaModel(
        erro: _erro, mensagem: _mensagem, codigoResposta: _codigoResposta);
    return _resposta;
  }

  Future<M8RespostaModel> imprimeXMLNFCe({
    String dados,
    int indexCsc,
    String csc,
    List<ParamImprimeXMLNFCe> params,
  }) async {
    indexCsc = indexCsc ?? 0;
    params = params ?? <ParamImprimeXMLNFCe>[];
    final String _dados = dados ?? '';
    final int _indexCsc = indexCsc;

    /// 5565d56087392f646c5ec67f45c5f3fe
    final String _csc = csc ?? '';
    final int _param = calcularParamImprimeXMLNFCe(params);
    final int _codigoResposta = await _channel.invokeMethod('imprimeXMLNFCe', {
      "dados": _dados,
      "indexcsc": _indexCsc,
      "csc": _csc,
      "param": _param,
    });
    final bool _erro = _codigoResposta < 0;
    final String _mensagem = _erro
        ? "imprimeXMLNFCe: erro codigo $_codigoResposta"
        : "imprimeXMLNFCe: ok";
    final M8RespostaModel _resposta = M8RespostaModel(
        erro: _erro, mensagem: _mensagem, codigoResposta: _codigoResposta);
    return _resposta;
  }
}
