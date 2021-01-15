enum ParamImprimeXMLNFCe {
  extratoResulmido,
  utilizarEAN13,
  descricaoProdutosCompleta,
  imprimirLogotipoEmpresa,
  cupomDeHomologacao,
  reduzirEspacoDeImpressao,
  utilizarSeparadoresSecao,
  imprimirIECabecalho,
  impressaoDoNumeroSequencialItem,
  danfeEmContingencia,
  impressaoAcrescimoDescontoItem,
}

int calcularParamImprimeXMLNFCe(List<ParamImprimeXMLNFCe> list) {
  int _return = 0;
  List<int> _jaUtilizados = [];
  for (ParamImprimeXMLNFCe _p in list) {
    if (_jaUtilizados.indexWhere((e) => e == _p.index) == -1) {
      _jaUtilizados.add(_p.index);
      _return += _retornaValor(_p);
    }
  }
  return _return;
}

int _retornaValor(ParamImprimeXMLNFCe p) {
  if (p.index == 0) {
    return 1;
  }
  if (p.index == 1) {
    return 2;
  }
  if (p.index == 2) {
    return 4;
  }
  if (p.index == 3) {
    return 8;
  }
  if (p.index == 4) {
    return 16;
  }
  if (p.index == 5) {
    return 32;
  }
  if (p.index == 6) {
    return 64;
  }
  if (p.index == 7) {
    return 128;
  }
  if (p.index == 8) {
    return 256;
  }
  if (p.index == 9) {
    return 512;
  }
  if (p.index == 10) {
    return 1024;
  }
  return 0;
}
