import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CambioIdioma {
  final String localName;

  CambioIdioma(this.localName);

  static const LocalizationsDelegate<CambioIdioma> delegate =
      _CambioIdiomaLocalizationDelegate();

  String get emptyList {
    if (localName == 'en') {
      return "english language";
    }
    if (localName == 'es') {
      return "idioma español";
    } else {
      return "unknown lang $localName";
    }
  }
}

class _CambioIdiomaLocalizationDelegate
    extends LocalizationsDelegate<CambioIdioma> {
  const _CambioIdiomaLocalizationDelegate();
  @override
  bool isSupported(Locale locale) {
    // ignore: todo
    // TODO: implement isSupported
    return ['es', 'en'].contains(locale.languageCode);
  }

  @override
  Future<CambioIdioma> load(Locale locale) async {
    // ignore: todo
    // TODO: implement load
    return CambioIdioma(locale.languageCode);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<CambioIdioma> old) {
    // ignore: todo
    // TODO: implement shouldReeload
    return false;
  }
}
