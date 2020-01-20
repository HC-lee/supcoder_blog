


import 'package:flutter/material.dart';
import 'package:supcoder_blog/common/i18n/base_string.dart';
import 'package:supcoder_blog/common/i18n/string_en.dart';
import 'package:supcoder_blog/common/i18n/string_zh.dart';

class I18n{
  final Locale locale;

  I18n(this.locale);


  ///根据不同 locale.languageCode 加载不同语言对应
  ///GSYStringEn和GSYStringZh都继承了GSYStringBase
  static Map<String, BaseString> _localizedValues = {
    'en': new StringEn(),
    'zh': new StringZh(),
  };

  BaseString get currentLocalized {
    if (_localizedValues.containsKey(locale.languageCode)) {
      return _localizedValues[locale.languageCode];
    }
    return _localizedValues["en"];
  }

  ///通过 Localizations 加载当前的 GSYLocalizations
  ///获取对应的 GSYStringBase
  static I18n of(BuildContext context) {
    return Localizations.of(context, I18n);
  }

  ///通过 Localizations 加载当前的 GSYLocalizations
  ///获取对应的 BaseString
  static BaseString getStringContainer(BuildContext context) {
    return (Localizations.of(context, I18n) as I18n)
        .currentLocalized;
  }




}