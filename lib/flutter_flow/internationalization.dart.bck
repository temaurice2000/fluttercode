import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr', 'sg'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
    String? sgText = '',
  }) =>
      [enText, frText, sgText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // component-set2
  {
    '26w8kd8x': {
      'en': 'Pragser Wildsee Lake',
      'fr': 'Lac Pragser Wildsee',
      'sg': '',
    },
    '2o34gkjy': {
      'en': '365Km',
      'fr': '365 km',
      'sg': '',
    },
    '255z5q9n': {
      'en': 'Pyramids, Egypt',
      'fr': 'Pyramides, Égypte',
      'sg': '',
    },
    'wnl0wjyf': {
      'en': '323Km, 1 Week',
      'fr': '323 km, 1 semaine',
      'sg': '',
    },
    'z39hu2bn': {
      'en': 'FEB',
      'fr': 'FÉV',
      'sg': '',
    },
    'wp7d2mu1': {
      'en': '6 Mon',
      'fr': '6 lun.',
      'sg': '',
    },
    '5jid4lux': {
      'en': 'QAR 656',
      'fr': 'QAR 656',
      'sg': '',
    },
    'mf735h6t': {
      'en': '7 Tue',
      'fr': '7 mar.',
      'sg': '',
    },
    'qpd2h4al': {
      'en': 'QAR 786',
      'fr': 'QAR 786',
      'sg': '',
    },
    'knal4lch': {
      'en': '8 Wed',
      'fr': '8 mer.',
      'sg': '',
    },
    '9hes6uwn': {
      'en': 'QAR 811',
      'fr': 'QAR 811',
      'sg': '',
    },
    'tc7pnzot': {
      'en': '9 Thu',
      'fr': '9 jeu.',
      'sg': '',
    },
    '9powpvp3': {
      'en': 'QAR 956',
      'fr': 'QAR 956',
      'sg': '',
    },
    '83pezxzj': {
      'en': 'Mon',
      'fr': 'Lun',
      'sg': '',
    },
    '58qlcoef': {
      'en': '4',
      'fr': '4',
      'sg': '',
    },
    'tvxkxkhw': {
      'en': 'Tue',
      'fr': 'Mar',
      'sg': '',
    },
    'b9rbya8n': {
      'en': '5',
      'fr': '5',
      'sg': '',
    },
    'v4so4z0y': {
      'en': 'Wed',
      'fr': 'Épouser',
      'sg': '',
    },
    'wts432tt': {
      'en': '6',
      'fr': '6',
      'sg': '',
    },
    '8t0uu2mm': {
      'en': 'Thu',
      'fr': 'Jeu',
      'sg': '',
    },
    'yrvwh4hc': {
      'en': '7',
      'fr': '7',
      'sg': '',
    },
    'jhqz0zgh': {
      'en': 'Fri',
      'fr': 'Ven',
      'sg': '',
    },
    'j4nj8gq4': {
      'en': '8',
      'fr': '8',
      'sg': '',
    },
    'zgxfyifu': {
      'en': 'Monday 03, April',
      'fr': 'Lundi 3 avril',
      'sg': '',
    },
    'd083uec4': {
      'en': '2024',
      'fr': '2024',
      'sg': '',
    },
    'lyvhanle': {
      'en': '2025',
      'fr': '2025',
      'sg': '',
    },
    'evntpl6b': {
      'en': '2026',
      'fr': '2026',
      'sg': '',
    },
    'rzted8ys': {
      'en': '2027',
      'fr': '2027',
      'sg': '',
    },
    'f4j4n28d': {
      'en': '2028',
      'fr': '2028',
      'sg': '',
    },
    '686va6wb': {
      'en': 'Feb 2024',
      'fr': 'Février 2024',
      'sg': '',
    },
    'gtzx7z2c': {
      'en': 'Mon',
      'fr': 'Lun',
      'sg': '',
    },
    'ykhuht31': {
      'en': '4',
      'fr': '4',
      'sg': '',
    },
    'oxblewuc': {
      'en': 'Tue',
      'fr': 'Mar',
      'sg': '',
    },
    'au18gaoj': {
      'en': '5',
      'fr': '5',
      'sg': '',
    },
    'trqccwj1': {
      'en': 'Wed',
      'fr': 'Épouser',
      'sg': '',
    },
    'pl6ug4aa': {
      'en': '6',
      'fr': '6',
      'sg': '',
    },
    '2d3ijmsj': {
      'en': 'Thu',
      'fr': 'Jeu',
      'sg': '',
    },
    'sm75ti6m': {
      'en': '7',
      'fr': '7',
      'sg': '',
    },
    '32zvttvm': {
      'en': 'Fri',
      'fr': 'Ven',
      'sg': '',
    },
    '49pxn3id': {
      'en': '8',
      'fr': '8',
      'sg': '',
    },
    '98hd2l6n': {
      'en': 'Home',
      'fr': 'Maison',
      'sg': '',
    },
  },
  // component-set1
  {
    '6rmk5dbt': {
      'en': 'Santorini',
      'fr': 'Santorin',
      'sg': '',
    },
    'q2zitzxe': {
      'en': 'Greece',
      'fr': 'Grèce',
      'sg': '',
    },
    '40i9qiv8': {
      'en': '\$596/',
      'fr': '596 \$/',
      'sg': '',
    },
    'jh7527yr': {
      'en': 'night',
      'fr': 'nuit',
      'sg': '',
    },
    'i3wr70z1': {
      'en': '\$596/night',
      'fr': '596 \$/nuit',
      'sg': '',
    },
    '7k3bhr4s': {
      'en': '4.8',
      'fr': '4.8',
      'sg': '',
    },
    'oumghetx': {
      'en': 'Hilton',
      'fr': 'Hilton',
      'sg': '',
    },
    'rcnuv68f': {
      'en': 'Bali',
      'fr': 'Bali',
      'sg': '',
    },
    '7yezxkmv': {
      'en': '\$236/',
      'fr': '236 \$/',
      'sg': '',
    },
    'hw9qxd6i': {
      'en': 'night',
      'fr': 'nuit',
      'sg': '',
    },
    'q2apo5n5': {
      'en': '\$596/night',
      'fr': '596 \$/nuit',
      'sg': '',
    },
    'msb6t8vn': {
      'en': '4.9',
      'fr': '4.9',
      'sg': '',
    },
    '1f04hqcn': {
      'en': 'Blue Waters',
      'fr': 'Eaux bleues',
      'sg': '',
    },
    'm3y2ekpd': {
      'en': 'Arugam Bay',
      'fr': 'Baie d\'Arugam',
      'sg': '',
    },
    'zx2qb2fp': {
      'en': '\$448/',
      'fr': '448 \$/',
      'sg': '',
    },
    '5b3r4ie0': {
      'en': 'night',
      'fr': 'nuit',
      'sg': '',
    },
    '9mb1qok1': {
      'en': '\$596/night',
      'fr': '596 \$/nuit',
      'sg': '',
    },
    'kppdqqtn': {
      'en': '4.8',
      'fr': '4.8',
      'sg': '',
    },
    'gjh702tw': {
      'en': 'From',
      'fr': 'Depuis',
      'sg': '',
    },
    'dami81ow': {
      'en': 'TextField',
      'fr': 'Champ de texte',
      'sg': '',
    },
    '3wrooskh': {
      'en': 'CMB',
      'fr': 'CMB',
      'sg': '',
    },
    'imthtqyp': {
      'en': 'QAR',
      'fr': 'QAR',
      'sg': '',
    },
    'on2expik': {
      'en': 'DXB',
      'fr': 'DXB',
      'sg': '',
    },
    'grw4bq2p': {
      'en': 'To',
      'fr': 'À',
      'sg': '',
    },
    'ni8jzkse': {
      'en': 'TextField',
      'fr': 'Champ de texte',
      'sg': '',
    },
    '2gz2w4r5': {
      'en': 'QAR',
      'fr': 'QAR',
      'sg': '',
    },
    'bwrd4v6o': {
      'en': 'CMB',
      'fr': 'CMB',
      'sg': '',
    },
    '1u5mj8im': {
      'en': 'QAR',
      'fr': 'QAR',
      'sg': '',
    },
    'tzjhe7z5': {
      'en': 'DXB',
      'fr': 'DXB',
      'sg': '',
    },
    'zx3mf4xt': {
      'en': 'Departure',
      'fr': 'Départ',
      'sg': '',
    },
    'yvrt9u3o': {
      'en': '30 Dec, 2024',
      'fr': '30 décembre 2024',
      'sg': '',
    },
    '5tq5hsfw': {
      'en': 'Return',
      'fr': 'Retour',
      'sg': '',
    },
    'eb7eddtd': {
      'en': '09 Feb, 2025',
      'fr': '09 février 2025',
      'sg': '',
    },
    '7ixvp0yq': {
      'en': 'Passenger',
      'fr': 'Passager',
      'sg': '',
    },
    '9j2rngw8': {
      'en': '2 Adault, 1 Child',
      'fr': '2 adultes, 1 enfant',
      'sg': '',
    },
    '9hdwzsg0': {
      'en': 'Cheapest',
      'fr': 'Le moins cher',
      'sg': '',
    },
    '7141cub3': {
      'en': 'QAR - BER',
      'fr': 'QAR-BER',
      'sg': '',
    },
    'm6hm3y8d': {
      'en': '4h 20m',
      'fr': '4h 20m',
      'sg': '',
    },
    '83iqz2vc': {
      'en': 'Book Your Trip',
      'fr': '',
      'sg': '',
    },
    '7n7jdsgk': {
      'en': 'Home',
      'fr': 'Maison',
      'sg': '',
    },
  },
  // component-set3
  {
    'k6c90tfx': {
      'en': 'ETKT 1736522567755456-2',
      'fr': 'ETKT 1736522567755456-2',
      'sg': '',
    },
    'dkz7qy5p': {
      'en': 'Type',
      'fr': 'Taper',
      'sg': '',
    },
    'm8r7t9cl': {
      'en': 'Business Class',
      'fr': 'Classe affaires',
      'sg': '',
    },
    'qoefcncy': {
      'en': 'Dhaka',
      'fr': 'Dhaka',
      'sg': '',
    },
    'fuotvsju': {
      'en': 'Dubai',
      'fr': 'Dubaï',
      'sg': '',
    },
    'wzakcz91': {
      'en': 'DAC',
      'fr': 'DAC',
      'sg': '',
    },
    'dsb1ggdd': {
      'en': 'DXB',
      'fr': 'DXB',
      'sg': '',
    },
    '0wks721q': {
      'en': 'DATE',
      'fr': 'DATE',
      'sg': '',
    },
    'brgsasrc': {
      'en': '13 JUN',
      'fr': '13 JUIN',
      'sg': '',
    },
    'txon29n5': {
      'en': 'PASSENGERS',
      'fr': 'PASSAGERS',
      'sg': '',
    },
    '9vqyn4bo': {
      'en': '1 Adult',
      'fr': '1 adulte',
      'sg': '',
    },
    't3owtn2d': {
      'en': 'TIME',
      'fr': 'TEMPS',
      'sg': '',
    },
    '658ecsqp': {
      'en': '7:00 PM',
      'fr': '19h00',
      'sg': '',
    },
    'zadf4brd': {
      'en': 'ZONE',
      'fr': 'ZONE',
      'sg': '',
    },
    'etkr37xi': {
      'en': '2',
      'fr': '2',
      'sg': '',
    },
    '111hqvev': {
      'en': 'SEQ NO',
      'fr': 'N° DE SÉQUENCE',
      'sg': '',
    },
    'scusaqtv': {
      'en': '0156',
      'fr': '0156',
      'sg': '',
    },
    '7v09yaiu': {
      'en': 'GATE',
      'fr': 'GRILLE',
      'sg': '',
    },
    'luow3rkw': {
      'en': 'D5',
      'fr': 'D5',
      'sg': '',
    },
    'a9hbr5bq': {
      'en': 'NAME',
      'fr': 'NOM',
      'sg': '',
    },
    'eemkl4j8': {
      'en': 'MR. PETER JACKSON',
      'fr': 'M. PETER JACKSON',
      'sg': '',
    },
    'v2iyk5pw': {
      'en': 'FLIGHT',
      'fr': 'VOL',
      'sg': '',
    },
    'xfcwgenq': {
      'en': 'EK 506',
      'fr': 'EK 506',
      'sg': '',
    },
    'qlhgi3zl': {
      'en': 'SEAT',
      'fr': 'SIÈGE',
      'sg': '',
    },
    'qpedc0uu': {
      'en': '9F',
      'fr': '9F',
      'sg': '',
    },
    'm0117xq5': {
      'en': 'DOWNLOAD TICKET',
      'fr': 'TÉLÉCHARGER LE TICKET',
      'sg': '',
    },
    '699n7zbf': {
      'en': 'Home',
      'fr': 'Maison',
      'sg': '',
    },
  },
  // component-set0
  {
    '7p6tspmr': {
      'en': 'One Way',
      'fr': 'Sens Unique',
      'sg': '',
    },
    'xwvcchcy': {
      'en': 'Round Trip',
      'fr': 'Aller-retour',
      'sg': '',
    },
    '39fndc9h': {
      'en': 'Multi-City',
      'fr': 'Multi-villes',
      'sg': '',
    },
    '6288bzod': {
      'en': 'AUH',
      'fr': 'AUH',
      'sg': '',
    },
    'fzn3ht30': {
      'en': '8:00 pm',
      'fr': '20h00',
      'sg': '',
    },
    'uf274wt7': {
      'en': '9 hrs 10 min',
      'fr': '9 heures 10 minutes',
      'sg': '',
    },
    'k1jnz8s0': {
      'en': 'Non-Stop',
      'fr': 'Sans escale',
      'sg': '',
    },
    '3ilfyn7o': {
      'en': 'AXT',
      'fr': 'AXT',
      'sg': '',
    },
    'fclx1g0g': {
      'en': '2:15 pm',
      'fr': '14h15',
      'sg': '',
    },
    'etitolas': {
      'en': 'Flight info',
      'fr': 'Informations sur les vols',
      'sg': '',
    },
    'cy9ncsnt': {
      'en': '\$720',
      'fr': '720 \$',
      'sg': '',
    },
    'e920d0ff': {
      'en': 'Passengers',
      'fr': 'Passagers',
      'sg': '',
    },
    'apq3un5r': {
      'en': 'ADULT',
      'fr': 'ADULTE',
      'sg': '',
    },
    'fjlfh710': {
      'en': '12+  years',
      'fr': '12+ ans',
      'sg': '',
    },
    'fjr6t24p': {
      'en': ' ',
      'fr': '',
      'sg': '',
    },
    'g1xttar1': {
      'en': 'CHILDREN',
      'fr': 'ENFANTS',
      'sg': '',
    },
    'k33ob4qj': {
      'en': '1-12  years',
      'fr': '1-12 ans',
      'sg': '',
    },
    'tyotkam4': {
      'en': '\$349',
      'fr': '349 \$',
      'sg': '',
    },
    'i533gujj': {
      'en': '8:00 pm',
      'fr': '20h00',
      'sg': '',
    },
    'uwy9yljg': {
      'en': 'QAR, Mon',
      'fr': 'QAR, lun.',
      'sg': '',
    },
    '47g2tuk6': {
      'en': 'QAR43',
      'fr': 'QAR43',
      'sg': '',
    },
    'l01wzjv1': {
      'en': '2:15 pm',
      'fr': '14h15',
      'sg': '',
    },
    'qzgh6slq': {
      'en': 'CMB, Tue',
      'fr': 'CMB, mar.',
      'sg': '',
    },
    'q3ji6wrq': {
      'en': 'Duration:',
      'fr': 'Durée:',
      'sg': '',
    },
    'lk35zfrw': {
      'en': ' 5 hrs 15 min',
      'fr': '5 heures 15 minutes',
      'sg': '',
    },
    '8upku28c': {
      'en': ' | Non - Stop',
      'fr': '| Non-Stop',
      'sg': '',
    },
    'eeuzcufl': {
      'en': 'Duration:',
      'fr': 'Durée:',
      'sg': '',
    },
    'xeaqi5vz': {
      'en': 'SEARCH FLIGHTS',
      'fr': 'RECHERCHER DES VOLS',
      'sg': '',
    },
    'u8eqtfwg': {
      'en': 'Home',
      'fr': 'Maison',
      'sg': '',
    },
  },
  // Auth1
  {
    'fwtgbt7m': {
      'en': 'brand.ai',
      'fr': 'marque.ai',
      'sg': '',
    },
    '1ti5wht8': {
      'en': 'Sign In',
      'fr': 'Se connecter',
      'sg': '',
    },
    'c9b1fdur': {
      'en': 'Sign Up',
      'fr': 'S\'inscrire',
      'sg': '',
    },
    'jmu7reck': {
      'en': 'Home',
      'fr': 'Maison',
      'sg': '',
    },
  },
  // test
  {
    '99hwnajb': {
      'en': 'Page Title',
      'fr': 'Titre de la page',
      'sg': '',
    },
    'xjoy1xvk': {
      'en': 'Home',
      'fr': 'Maison',
      'sg': '',
    },
  },
  // pageList
  {
    'jq2wpxs9': {
      'en': 'Page 1',
      'fr': 'Page 1',
      'sg': '',
    },
    '21rpmthl': {
      'en': 'Component Set-0',
      'fr': 'Ensemble de composants-0',
      'sg': '',
    },
    't6sv23xc': {
      'en': 'Page 2',
      'fr': 'Page 2',
      'sg': '',
    },
    'wu5ffbd8': {
      'en': 'Component Set-1',
      'fr': 'Ensemble de composants-1',
      'sg': '',
    },
    'i50hvi4k': {
      'en': 'Page 3',
      'fr': 'Page 3',
      'sg': '',
    },
    'yor36155': {
      'en': 'Component Set-2',
      'fr': 'Ensemble de composants-2',
      'sg': '',
    },
    '7sz55xfs': {
      'en': 'Page 4',
      'fr': 'Page 4',
      'sg': '',
    },
    '4qjvyzfn': {
      'en': 'Component Set-3',
      'fr': 'Ensemble de composants-3',
      'sg': '',
    },
    '47kjcg4u': {
      'en': 'Dark & Light Mode',
      'fr': 'Mode sombre et clair',
      'sg': '',
    },
  },
  // Miscellaneous
  {
    '2cpuyf6o': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    '0gkc7zqs': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    '40mmb73i': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    'vusqdsae': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    '8pqno75v': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    'zw33z0p6': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    'noxfbgav': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    'fmpts8hk': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    'z6qhvblw': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    'ouaey5mm': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    '1ofdf2z9': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    '5st8p6s1': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    'uavpzwnq': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    '1lu5iiin': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    'uk3hlonp': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    'v34jrdzu': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    '2mh7981r': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    's0brkfw9': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    '1samcd6o': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    '2eig3zre': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    'avtsqdhb': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    '4wp1bth9': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    'flngjnab': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    '7wtlgrq0': {
      'en': '',
      'fr': '',
      'sg': '',
    },
    'umq761yg': {
      'en': '',
      'fr': '',
      'sg': '',
    },
  },
].reduce((a, b) => a..addAll(b));
