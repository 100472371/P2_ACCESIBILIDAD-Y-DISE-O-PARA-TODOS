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

  static List<String> languages() => ['es', 'en'];

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
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

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
  // ProfilePage
  {
    'zogqjvuj': {
      'es': 'Joy Augustin',
      'en': 'Joy Augustin',
    },
    'kbgr243s': {
      'es': 'joy@augustin.com',
      'en': 'joy@augustin.com',
    },
    '81i5tudn': {
      'es': 'Account',
      'en': 'Account',
    },
    'c2uw8f26': {
      'es': 'Payment Options',
      'en': 'Payment Options',
    },
    'lgbpaapu': {
      'es': 'Country',
      'en': 'Country',
    },
    '35krs6ox': {
      'es': 'Notification Settings',
      'en': 'Notification Settings',
    },
    'ia0ue8ff': {
      'es': 'Edit Profile',
      'en': 'Edit Profile',
    },
    'hnvwy747': {
      'es': 'General',
      'en': 'General',
    },
    '5vw107a4': {
      'es': 'Support',
      'en': 'Support',
    },
    'sjrmsg1e': {
      'es': 'Terms of Service',
      'en': 'Terms of Service',
    },
    'r9svrlo1': {
      'es': 'Invite Friends',
      'en': 'Invite Friends',
    },
    'ahh8hc5k': {
      'es': 'Profile',
      'en': 'Profile',
    },
    'd6q61s6p': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // SingInPage
  {
    'vr2hyqqy': {
      'es': 'Sign In',
      'en': 'Sign In',
    },
    '758ahkyy': {
      'es': 'Sign Up',
      'en': 'Sign Up',
    },
    'j5cm9g62': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'l9i39rqc': {
      'es': 'Password',
      'en': 'Password',
    },
    '75m3f6p0': {
      'es': 'Sign In',
      'en': 'Sign In',
    },
    'm1dkhr0k': {
      'es': 'Forgot your password?',
      'en': 'Forgot your password?',
    },
    '9fgzhs60': {
      'es': 'Or continue with',
      'en': 'Or continue with',
    },
  },
  // Inicio_Total
  {
    '8qoluprb': {
      'es': '¡Bienvenido!',
      'en': 'Welcome!',
    },
    'yeg7y3p8': {
      'es':
          '¡Gracias por unirte! Accede o crea tu cuenta a continuación y comienza tu aventura.',
      'en':
          'Thanks for joining! Log in or create your account below and start your adventure.',
    },
    'jefs4vg9': {
      'es': 'Sing Up',
      'en': 'Sing Up',
    },
    'txyigb9t': {
      'es': 'Sing In',
      'en': 'Sing In',
    },
    'joo8rmmy': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // SingUpPage
  {
    '02ykzsss': {
      'es': 'Sign In',
      'en': 'Sign In',
    },
    'sqr5d5fh': {
      'es': 'Sign Up',
      'en': 'Sign Up',
    },
    '9u9w606u': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'ohs11nx3': {
      'es': 'Password',
      'en': 'Password',
    },
    '82caydfv': {
      'es': 'Confirm Password',
      'en': 'Confirm Password',
    },
    'v2ujvxhx': {
      'es': 'Create Account',
      'en': 'Create Account',
    },
  },
  // HomePage
  {
    'cbw5mglw': {
      'es': 'Sport Tanarro',
      'en': 'Sport Tanarro',
    },
    '0zi10ppf': {
      'es': 'Polideportivo de la Buena Fortuna',
      'en': 'Good Fortune Sports Center',
    },
    '4d6x1mbp': {
      'es':
          'Instalación moderna con canchas interiores y exteriores, piscina y centro de fitness.',
      'en':
          'Modern facility with indoor and outdoor courts, swimming pool and fitness center.',
    },
    '4npzh9ul': {
      'es': 'Polideportivo Municipal Juan I',
      'en': 'Juan I Municipal Sports Center',
    },
    'emjrpdn2': {
      'es':
          'Complejo deportivo integral con canchas de baloncesto y instalaciones de entrenamiento y canchas de futbol.',
      'en':
          'Comprehensive sports complex with basketball courts and training facilities and soccer fields.',
    },
    'ak4q0o85': {
      'es': 'Polideportivo Multiusos de Tanarro',
      'en': 'Tanarro Multipurpose Sports Centre',
    },
    '7gvcl3or': {
      'es':
          'Espacio deportivo versátil, ideal para diversas actividades atléticas y eventos.',
      'en':
          'Versatile sports space, ideal for various athletic activities and events.',
    },
    'zf27j86r': {
      'es': 'Polideportivo Plaza De España',
      'en': 'Sports Centre Plaza de España',
    },
    '0uipqmbx': {
      'es':
          '\nInstalación céntrica que ofrece equipos y servicios de última generación.',
      'en':
          'Centrally located facility offering state-of-the-art equipment and services.',
    },
    'u3dl8bvq': {
      'es': 'Option 1',
      'en': 'Option 1',
    },
    'etfxbkp3': {
      'es': 'Option 2',
      'en': 'Option 2',
    },
    '45l0vm1m': {
      'es': 'Option 3',
      'en': 'Option 3',
    },
    'k54zcy8l': {
      'es': 'Elige un centro...',
      'en': 'Choose a center...',
    },
  },
  // HomePageCopy
  {
    'biswh5bq': {
      'es': 'Página inicio',
      'en': 'Home page',
    },
    'urs2y7qw': {
      'es': 'Selecciona el centro deportivo que quieras',
      'en': 'Select the sports center you want',
    },
    'no4hnuqn': {
      'es': 'Select a sport centre...',
      'en': 'Select a sports centre...',
    },
    '416ek9ta': {
      'es': 'Option 1',
      'en': 'Option 1',
    },
  },
  // Activities_ALL
  {
    'vdgdf8u1': {
      'es': 'Actividades deportivas',
      'en': 'Sports activities',
    },
    'ivv90ued': {
      'es': 'Elige tu deporte favorito y adquierelo ya',
      'en': 'Choose your favorite sport and buy it now',
    },
    'lh9ohnkp': {
      'es': 'Todos',
      'en': 'All',
    },
    'x4teyd3w': {
      'es': 'Pabellón',
      'en': 'Pavilion',
    },
    'qx74pof4': {
      'es': 'Futbol-7',
      'en': '7-a-side football',
    },
    'iega6t1j': {
      'es': 'Futbol-11',
      'en': '11-a-side football',
    },
    'r4t7gupr': {
      'es': 'Pádel',
      'en': 'Paddle tennis',
    },
    'amh4pgbl': {
      'es': 'Natación',
      'en': 'Swimming',
    },
    'arqduj5w': {
      'es': '30€ /hora',
      'en': '30€/hour',
    },
    'zq3hy5i6': {
      'es': 'PABELLÓN',
      'en': 'PAVILION',
    },
    'a53bnv9i': {
      'es':
          'Alquiler del pabellón para actividades como fútbol sala, baloncesto o balomano.',
      'en':
          'Rental of the pavilion for activities such as indoor football, basketball or handball.',
    },
    'nrhfkukf': {
      'es': 'Comprar ya',
      'en': 'Buy now',
    },
    'kukjlim2': {
      'es': '45€ /hora',
      'en': '45€/hour',
    },
    '130llh9t': {
      'es': 'FÚTBOL-7',
      'en': '7-a-side football',
    },
    'hwetl0eq': {
      'es': 'Alquiler de la pista de césped para jugar al fútbol 7.',
      'en': 'Grass pitch for rent to play 7-a-side football.',
    },
    'rn6hvnkk': {
      'es': 'Comprar ya',
      'en': 'Buy now',
    },
    '6u4xwx4w': {
      'es': '55€ /hora',
      'en': '55€ /hour',
    },
    'zeos2jjc': {
      'es': 'FÚTBOL-11',
      'en': 'FOOTBALL-11',
    },
    'a4obal3m': {
      'es': 'Alquiler de la pista de césped para jugar al fútbol 11.',
      'en': 'Grass pitch for rent to play 11-a-side football.',
    },
    'dw4dlxno': {
      'es': 'Comprar ya',
      'en': 'Buy now',
    },
    'e5flchwu': {
      'es': '10€ /hora',
      'en': '10€/hour',
    },
    'j72vug86': {
      'es': 'PÁDEL',
      'en': 'PADEL',
    },
    '5zu6o9sn': {
      'es': 'Alquiler de la pista de pádel(inlcuye raquetas y bolas).',
      'en': 'Paddle tennis court rental (includes rackets and balls).',
    },
    'i58g8c8g': {
      'es': 'Comprar ya',
      'en': 'Buy now',
    },
    'oj2eii17': {
      'es': '5€ /hora',
      'en': '5€ /hour',
    },
    'ps3ztq0w': {
      'es': 'NATACIÓN',
      'en': 'SWIMMING',
    },
    '9jv9ierg': {
      'es': 'Permiso para nadar en la piscina del recinto',
      'en': 'Permission to swim in the on-site pool',
    },
    't53bhx0c': {
      'es': 'Comprar ya',
      'en': 'Buy now',
    },
  },
  // Activity_1
  {
    'zgce4rce': {
      'es': 'Actividades deportivas',
      'en': 'Sports activities',
    },
    'kd6ngclp': {
      'es': 'Elige tu deporte favorito y adquierelo ya',
      'en': 'Choose your favorite sport and buy it now',
    },
    'ep06ydxv': {
      'es': 'Todos',
      'en': 'All',
    },
    '4m78xm3u': {
      'es': 'Pabellón',
      'en': 'Pavilion',
    },
    'nv5m31jv': {
      'es': 'Futbol-7',
      'en': '7-a-side football',
    },
    '16cvyof2': {
      'es': 'Futbol-11',
      'en': '11-a-side football',
    },
    'wwb5fdt0': {
      'es': 'Pádel',
      'en': 'Paddle tennis',
    },
    'kixmlspp': {
      'es': 'Natación',
      'en': 'Swimming',
    },
    'cd9933dd': {
      'es': '30€ /hora',
      'en': '30€/hour',
    },
    'cpuv80pg': {
      'es': 'PABELLÓN',
      'en': 'PAVILION',
    },
    'ywog4r35': {
      'es':
          'Alquiler del pabellón para actividades como fútbol sala, baloncesto o balomano.',
      'en':
          'Rental of the pavilion for activities such as indoor football, basketball or handball.',
    },
    '60ocaw0d': {
      'es': 'Comprar ya',
      'en': 'Buy now',
    },
  },
  // Activity_2
  {
    'f6ptdnc8': {
      'es': 'Actividades deportivas',
      'en': 'Sports activities',
    },
    'y86pef9j': {
      'es': 'Elige tu deporte favorito y adquierelo ya',
      'en': 'Choose your favorite sport and buy it now',
    },
    '7u71xdcx': {
      'es': 'Todos',
      'en': 'All',
    },
    'g69gqn9f': {
      'es': 'Pabellón',
      'en': 'Pavilion',
    },
    'ajsoomau': {
      'es': 'Futbol-7',
      'en': '7-a-side football',
    },
    '0qlztr6u': {
      'es': 'Futbol-11',
      'en': '11-a-side football',
    },
    'svz1e7ch': {
      'es': 'Pádel',
      'en': 'Paddle tennis',
    },
    'msxfsbao': {
      'es': 'Natación',
      'en': 'Swimming',
    },
    '4u18qn7m': {
      'es': '45€ /hora',
      'en': '45€/hour',
    },
    'imli8imr': {
      'es': 'FÚTBOL-7',
      'en': '7-a-side football',
    },
    '6m24hzdq': {
      'es': 'Alquiler de la pista de césped para jugar al fútbol 7.',
      'en': 'Grass pitch for rent to play 7-a-side football.',
    },
    'ltdovl47': {
      'es': 'Comprar ya',
      'en': 'Buy now',
    },
  },
  // Activity_3
  {
    'up4kke96': {
      'es': 'Actividades deportivas',
      'en': 'Sports activities',
    },
    'a2fxxcpy': {
      'es': 'Elige tu deporte favorito y adquierelo ya',
      'en': 'Choose your favorite sport and buy it now',
    },
    'tskxseda': {
      'es': 'Todos',
      'en': '',
    },
    'uwj290cz': {
      'es': 'Pabellón',
      'en': '',
    },
    '198v15wi': {
      'es': 'Futbol-7',
      'en': '',
    },
    'vhejqdwd': {
      'es': 'Futbol-11',
      'en': '',
    },
    'izaizi27': {
      'es': 'Pádel',
      'en': '',
    },
    'fc7xph3v': {
      'es': 'Natación',
      'en': '',
    },
    'zby121tb': {
      'es': '55€ /hora',
      'en': '',
    },
    'bgqbeemd': {
      'es': 'FÚTBOL-11',
      'en': '',
    },
    'l7xzgtuh': {
      'es': 'Alquiler de la pista de césped para jugar al fútbol 11.',
      'en': '',
    },
    'mt2ei48l': {
      'es': 'Comprar ya',
      'en': '',
    },
  },
  // Activity_4
  {
    '1o94kyh5': {
      'es': 'Actividades deportivas',
      'en': 'Sports activities',
    },
    'xfye6kqv': {
      'es': 'Elige tu deporte favorito y adquierelo ya',
      'en': 'Choose your favorite sport and buy it now',
    },
    'jh6ohh3r': {
      'es': 'Todos',
      'en': 'All',
    },
    '96a2tgp2': {
      'es': 'Pabellón',
      'en': 'Pavilion',
    },
    'e30ndgtb': {
      'es': 'Futbol-7',
      'en': '7-a-side football',
    },
    'snaiu1at': {
      'es': 'Futbol-11',
      'en': '11-a-side football',
    },
    'ak8ki6nq': {
      'es': 'Pádel',
      'en': 'Paddle tennis',
    },
    'pl6q6txz': {
      'es': 'Natación',
      'en': 'Swimming',
    },
    'a4gq17e0': {
      'es': '10€ /hora',
      'en': '10€/hour',
    },
    'otqd5o40': {
      'es': 'PÁDEL',
      'en': 'PADEL',
    },
    'ykdpqvli': {
      'es': 'Alquiler de la pista de pádel(inlcuye raquetas y bolas).',
      'en': 'Paddle tennis court rental (includes rackets and balls).',
    },
    '2rs60g4m': {
      'es': 'Comprar ya',
      'en': 'Buy now',
    },
  },
  // Activity_5
  {
    'fk8j1vn3': {
      'es': 'Actividades deportivas',
      'en': 'Sports activities',
    },
    'p90ebrp2': {
      'es': 'Elige tu deporte favorito y adquierelo ya',
      'en': 'Choose your favorite sport and buy it now',
    },
    'e72l1uar': {
      'es': 'Todos',
      'en': 'All',
    },
    'snrglhuv': {
      'es': 'Pabellón',
      'en': 'Pavilion',
    },
    'otnaseji': {
      'es': 'Futbol-7',
      'en': '7-a-side football',
    },
    'bc92ho7x': {
      'es': 'Futbol-11',
      'en': '11-a-side football',
    },
    '2chwxwre': {
      'es': 'Pádel',
      'en': 'Paddle tennis',
    },
    'dilxgrp5': {
      'es': 'Natación',
      'en': 'Swimming',
    },
    'vdbbk8at': {
      'es': '5€ /hora',
      'en': '5€ /hour',
    },
    '4t91kc8d': {
      'es': 'NATACIÓN',
      'en': 'SWIMMING',
    },
    'mt3qsvra': {
      'es': 'Permiso para nadar en la piscina del recinto',
      'en': 'Permission to swim in the on-site pool',
    },
    'hlsgx5c8': {
      'es': 'Comprar ya',
      'en': 'Buy now',
    },
  },
  // Calendario
  {
    '147cwnub': {
      'es': 'Calendario',
      'en': 'Calendar',
    },
    'g5oo4prj': {
      'es': 'Elige la fecha',
      'en': 'Choose the date',
    },
    '231b54af': {
      'es': 'Month',
      'en': 'Month',
    },
    'ag9pxi2s': {
      'es': 'Horas Disponibles',
      'en': 'Available Hours',
    },
    'f4inb1wb': {
      'es': 'Instalación deportiva',
      'en': 'Sports facility',
    },
    'rnebr3yr': {
      'es': '12:30pm',
      'en': '12:30pm',
    },
    'mnyg18wv': {
      'es': 'Instalación deportiva',
      'en': 'Sports facility',
    },
    'rmvwm8y4': {
      'es': '6:00pm',
      'en': '6:00pm',
    },
    'jepowin8': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // PaginaPago
  {
    'zizmcj69': {
      'es': 'Detalles de pago',
      'en': 'Payment details',
    },
    'tg5tyach': {
      'es': 'Información de Tarjeta',
      'en': 'Card Information',
    },
    'tghh73z3': {
      'es': 'Card Number',
      'en': 'Card Number',
    },
    'wm053duh': {
      'es': '1234 5678 9012 3456',
      'en': '1234 5678 9012 3456',
    },
    'vmdgwe1o': {
      'es': 'Expiration Date',
      'en': 'Expiration Date',
    },
    'e6uw5d3x': {
      'es': 'MM/YY',
      'en': 'MM/YY',
    },
    'vqqlge3e': {
      'es': 'CVV',
      'en': 'CVV',
    },
    'bwpnzyb0': {
      'es': '123',
      'en': '123',
    },
    '28jaa9vs': {
      'es': 'Dirección',
      'en': 'Address',
    },
    '3ang78y3': {
      'es': 'Full Name',
      'en': 'Full Name',
    },
    'h6jcrf0z': {
      'es': 'John Doe',
      'en': 'John Doe',
    },
    '6t29czo8': {
      'es': 'Street Address',
      'en': 'Street Address',
    },
    '5kelzb8x': {
      'es': '123 Main St',
      'en': '123 Main St',
    },
    'vw5hl3by': {
      'es': 'City',
      'en': 'City',
    },
    'bx4895ou': {
      'es': 'New York',
      'en': 'New York',
    },
    '6ocln439': {
      'es': 'Postal Code',
      'en': 'Postal Code',
    },
    'qk8j18az': {
      'es': '10001',
      'en': '10001',
    },
    'pdy83xnh': {
      'es': 'Código Promocional',
      'en': 'Promotional Code',
    },
    'z38nhbd7': {
      'es': 'Enter Code',
      'en': 'Enter Code',
    },
    'p9ubhxve': {
      'es': 'SAVE10',
      'en': 'SAVE10',
    },
    'j71vu5s6': {
      'es': 'Apply',
      'en': 'Apply',
    },
    'tdxpku96': {
      'es': 'Subtotal',
      'en': 'Subtotal',
    },
    'bzq8q8dp': {
      'es': '\$30.00',
      'en': '\$30.00',
    },
    'sumzfbmw': {
      'es': 'Total',
      'en': 'Total',
    },
    '11kpvjjh': {
      'es': '\$30.00',
      'en': '\$30.00',
    },
    '3e4y74m0': {
      'es': 'Pay Now',
      'en': 'Pay Now',
    },
  },
  // prueba
  {
    '54p4l8z0': {
      'es': 'Actividades deportivas',
      'en': 'Sports activities',
    },
    'm5c029ny': {
      'es': 'Elige tu deporte favorito y adquierelo ya',
      'en': 'Choose your favorite sport and buy it now',
    },
    'tiolo5cp': {
      'es': 'Todos',
      'en': 'All',
    },
    'y9uflpiy': {
      'es': 'Pabellón',
      'en': 'Pavilion',
    },
    'qbqqeqmx': {
      'es': 'Futbol-7',
      'en': '7-a-side football',
    },
    'l0pxgsyq': {
      'es': 'Futbol-11',
      'en': '11-a-side football',
    },
    'f2qtf66f': {
      'es': 'Pádel',
      'en': 'Paddle tennis',
    },
    'a37wr5ny': {
      'es': 'Natación',
      'en': 'Swimming',
    },
    'fb21vq7m': {
      'es': '5€ /hora',
      'en': '5€ /hour',
    },
    'lb5nt3vz': {
      'es': 'NATACIÓN',
      'en': 'SWIMMING',
    },
    'iu1ijnjy': {
      'es': 'Permiso para nadar en la piscina del recinto',
      'en': 'Permission to swim in the on-site pool',
    },
    'ofycsxzc': {
      'es': 'Comprar ya',
      'en': 'Buy now',
    },
    'sebtc1ih': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // FAQs
  {
    'zdyectkl': {
      'es': 'FAQs',
      'en': 'FAQs',
    },
    '75qm6jkc': {
      'es': 'Preguntas más frecuentes',
      'en': 'Frequently Asked Questions',
    },
    'a20ptpdz': {
      'es': '¿Cómo podemos ayudarte?',
      'en': 'How can we help you?',
    },
    'qbcxkqq6': {
      'es':
          'Encuentra respuestas a las preguntas más comunes sobre nuestra plataforma de reservas deportivas.',
      'en':
          'Find answers to the most common questions about our sports booking platform.',
    },
    'e5f0dt63': {
      'es': 'Información General',
      'en': 'General Information',
    },
    '8heo1by9': {
      'es': '¿Qué deportes puedo reservar?',
      'en': 'What sports can I book?',
    },
    'pvea8hy9': {
      'es':
          'Ofrecemos instalaciones para fútbol, baloncesto, tenis, pádel, natación y más. Consulta la lista completa en nuestra sección de deportes.',
      'en':
          'We offer facilities for football, basketball, tennis, paddle tennis, swimming and more. See the full list in our sports section.',
    },
    'qon7fzst': {
      'es': '¿Qué polideportivos están disponibles?',
      'en': 'What sports centres are available?',
    },
    'x2yeince': {
      'es':
          'Ingresa el nombre de tu ciudad en el buscador principal y verás todas las instalaciones disponibles cerca de ti.',
      'en':
          'Enter the name of your city in the main search engine and you will see all the facilities available near you.',
    },
    'i4bq2g80': {
      'es': 'Reservas',
      'en': 'Reservations',
    },
    'adbk9w9s': {
      'es': '¿Cómo puedo cancelar una reserva?',
      'en': 'How can I cancel a reservation?',
    },
    'i5c65qfo': {
      'es': 'Pincha en el calendario y la hora para reservar',
      'en': 'Click on the calendar and time to book',
    },
    'zjzmjco7': {
      'es': '¿Cuánto tiempo antes debo reservar?',
      'en': 'How far in advance should I book?',
    },
    'ue9p7q0u': {
      'es':
          'Te recomendamos realizar tu reserva al menos 24 horas antes para asegurar disponibilidad.',
      'en':
          'We recommend that you make your reservation at least 24 hours in advance to ensure availability.',
    },
    'jy15peko': {
      'es': 'Pagos',
      'en': 'Payments',
    },
    'un8y8k5c': {
      'es': '¿Qué métodos de pago aceptan?',
      'en': 'What payment methods do you accept?',
    },
    'kl6b1stn': {
      'es':
          'Aceptamos tarjetas de crédito/débito, PayPal y transferencias bancarias.',
      'en': 'We accept credit/debit cards, PayPal and bank transfers.',
    },
    'zxp6aikk': {
      'es': '¿Puedo obtener un reembolso?',
      'en': 'Can I get a refund?',
    },
    '0pripzxe': {
      'es': 'Actualmente no',
      'en': 'Currently not',
    },
    'hlw6qt1t': {
      'es': '¿No encuentras lo que buscas?',
      'en': 'Can\'t find what you\'re looking for?',
    },
    '32zpqz0f': {
      'es': 'Nuestro equipo de soporte está aquí para ayudarte',
      'en': 'Our support team is here to help you',
    },
    'zsuwffka': {
      'es': 'Contactar Soporte',
      'en': 'Contact Support',
    },
  },
  // Pago_final
  {
    'rm72smfw': {
      'es': 'Payment Successful!',
      'en': 'Payment Successful!',
    },
    'jgckit3w': {
      'es': 'Your transaction has been completed',
      'en': 'Your transaction has been completed',
    },
    'kclb5bg8': {
      'es': 'Order Summary',
      'en': 'Order Summary',
    },
    'puhe73sn': {
      'es': 'Item',
      'en': 'Item',
    },
    'lby8lb1s': {
      'es': 'Pabellón',
      'en': 'Pavilion',
    },
    'dmuhi9vi': {
      'es': 'Duration',
      'en': 'Duration',
    },
    'jyalqhnt': {
      'es': '1:30h',
      'en': '1:30h',
    },
    'lwvvj55e': {
      'es': 'Total Paid',
      'en': 'Total Paid',
    },
    '59f0i390': {
      'es': '\$30.00',
      'en': '\$30.00',
    },
    'jqp7xo9b': {
      'es': 'Payment Method',
      'en': 'Payment Method',
    },
    'r85nbxe2': {
      'es': 'Visa •••• 1234',
      'en': 'Visa •••• 1234',
    },
    'nuu55a12': {
      'es': 'Confirmation Details',
      'en': 'Confirmation Details',
    },
    'nyjwy80u': {
      'es': 'Transaction ID',
      'en': 'Transaction ID',
    },
    'lfweozea': {
      'es': '#TRX-2023120501',
      'en': '#TRX-2023120501',
    },
    'rru90kef': {
      'es': 'Date',
      'en': 'Date',
    },
    '6dbj2dos': {
      'es': 'Dec 5, 2023 10:30 AM',
      'en': 'Dec 5, 2023 10:30 AM',
    },
    'ma8q8a9v': {
      'es': 'Back to Home',
      'en': 'Back to Home',
    },
    'i4zxpj69': {
      'es': 'Log Out',
      'en': 'Log Out',
    },
  },
  // Idioma
  {
    'x2k1yn9n': {
      'es': 'Language Settings',
      'en': 'Language Settings',
    },
    'mxtzdrcj': {
      'es': 'English',
      'en': 'English',
    },
    'gzv2np30': {
      'es': 'Español',
      'en': 'Spanish',
    },
  },
  // menu_hamburguesa_container
  {
    '0whusdhf': {
      'es': 'Mi cuenta',
      'en': 'My account',
    },
    'kwmaut0v': {
      'es': 'FAQs',
      'en': 'FAQs',
    },
    'qom0yse5': {
      'es': 'Página de Inicio',
      'en': 'Home Page',
    },
    'xbthce33': {
      'es': 'Idioma',
      'en': 'Language',
    },
    '72ipumjr': {
      'es': 'Cerrar sesión',
      'en': 'Log out',
    },
    'kca84ke3': {
      'es': 'Dark Mode',
      'en': 'Dark Mode',
    },
  },
  // Miscellaneous
  {
    'rghpn08w': {
      'es': 'Button',
      'en': 'Button',
    },
    'ym2eobuh': {
      'es': '',
      'en': '',
    },
    'tbty4mpz': {
      'es': '',
      'en': '',
    },
    'jpknb8j9': {
      'es': '',
      'en': '',
    },
    'ajdeoieg': {
      'es': '',
      'en': '',
    },
    'fogfhorj': {
      'es': '',
      'en': '',
    },
    '759wjppa': {
      'es': '',
      'en': '',
    },
    'xhf8bibw': {
      'es': '',
      'en': '',
    },
    'cyl9mrsp': {
      'es': '',
      'en': '',
    },
    'rcor38dg': {
      'es': '',
      'en': '',
    },
    '1xpjd868': {
      'es': '',
      'en': '',
    },
    '6tlft9z5': {
      'es': '',
      'en': '',
    },
    'pdzzv0y5': {
      'es': '',
      'en': '',
    },
    'ohqf2cl2': {
      'es': '',
      'en': '',
    },
    '7yjgaho2': {
      'es': '',
      'en': '',
    },
    'c07kokgq': {
      'es': '',
      'en': '',
    },
    '0gi627on': {
      'es': '',
      'en': '',
    },
    'q300fihd': {
      'es': '',
      'en': '',
    },
    '6gzj0he0': {
      'es': '',
      'en': '',
    },
    '0ub679s3': {
      'es': '',
      'en': '',
    },
    'g20y3pnd': {
      'es': '',
      'en': '',
    },
    'ge9vl2be': {
      'es': '',
      'en': '',
    },
    '3p8oira9': {
      'es': '',
      'en': '',
    },
    'pragc1ng': {
      'es': '',
      'en': '',
    },
    'bmr05yvg': {
      'es': '',
      'en': '',
    },
    'w319oh21': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
