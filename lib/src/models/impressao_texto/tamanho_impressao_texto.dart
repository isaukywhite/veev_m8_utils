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
  if (a != null) {
    if (a.index == 0) {
      _a = 0;
    }
    if (a.index == 1) {
      _a = 1;
    }
    if (a.index == 2) {
      _a = 2;
    }
    if (a.index == 3) {
      _a = 3;
    }
    if (a.index == 4) {
      _a = 4;
    }
    if (a.index == 5) {
      _a = 5;
    }
    if (a.index == 6) {
      _a = 6;
    }
    if (a.index == 7) {
      _a = 7;
    }
  }
  if (l != null) {
    if (l.index == 0) {
      _l = 16;
    }
    if (l.index == 1) {
      _l = 32;
    }
    if (l.index == 2) {
      _l = 48;
    }
    if (l.index == 3) {
      _l = 64;
    }
    if (l.index == 4) {
      _l = 80;
    }
    if (l.index == 5) {
      _l = 96;
    }
    if (l.index == 6) {
      _l = 112;
    }
  }
  return _a + _l;
}
