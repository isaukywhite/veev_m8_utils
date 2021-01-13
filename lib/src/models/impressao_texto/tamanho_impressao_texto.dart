enum AlturaTamanhoImpressaoTexto {
  um,
  dois,
  tres,
  quatro,
  cinco,
  seis,
  sete,
  oito,
}
enum LarguraTamanhoImpressaoTexto {
  dezesseis,
  trintaDois,
  quarentaOito,
  sessentaQuatro,
  oitenta,
  noventaSeis,
  centoEDoze,
}

int tamanhoImpressaoTexto(
  LarguraTamanhoImpressaoTexto l,
  AlturaTamanhoImpressaoTexto a,
) {
  int _l = 0;
  int _a = 0;
  if (l.index == 0) {
    _l = 1;
  }
  if (l.index == 1) {
    _l = 2;
  }
  if (l.index == 2) {
    _l = 3;
  }
  if (l.index == 3) {
    _l = 4;
  }
  if (l.index == 4) {
    _l = 5;
  }
  if (l.index == 5) {
    _l = 6;
  }
  if (l.index == 6) {
    _l = 7;
  }
  if (l.index == 7) {
    _l = 8;
  }
  if (a.index == 0) {
    _a = 16;
  }
  if (a.index == 1) {
    _a = 32;
  }
  if (a.index == 2) {
    _a = 48;
  }
  if (a.index == 3) {
    _a = 64;
  }
  if (a.index == 4) {
    _a = 80;
  }
  if (a.index == 5) {
    _a = 96;
  }
  if (a.index == 6) {
    _a = 112;
  }

  return _a + _l;
}
