// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email or Phone Number`
  String get emailorphonenumer {
    return Intl.message(
      'Email or Phone Number',
      name: 'emailorphonenumer',
      desc: '',
      args: [],
    );
  }

  /// `I have read and agreed to all contents of the`
  String get agrementdesc {
    return Intl.message(
      'I have read and agreed to all contents of the',
      name: 'agrementdesc',
      desc: '',
      args: [],
    );
  }

  /// `Service Agreement`
  String get serviceagreement {
    return Intl.message(
      'Service Agreement',
      name: 'serviceagreement',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacypolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacypolicy',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotpassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotpassword',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Device List`
  String get devicelist {
    return Intl.message(
      'Device List',
      name: 'devicelist',
      desc: '',
      args: [],
    );
  }

  /// `Device`
  String get device {
    return Intl.message(
      'Device',
      name: 'device',
      desc: '',
      args: [],
    );
  }

  /// `Account Manage`
  String get accountmanage {
    return Intl.message(
      'Account Manage',
      name: 'accountmanage',
      desc: '',
      args: [],
    );
  }

  /// `Personal Settings`
  String get personalsettings {
    return Intl.message(
      'Personal Settings',
      name: 'personalsettings',
      desc: '',
      args: [],
    );
  }

  /// `Head Avater`
  String get headavatar {
    return Intl.message(
      'Head Avater',
      name: 'headavatar',
      desc: '',
      args: [],
    );
  }

  /// `Nick Name`
  String get nickname {
    return Intl.message(
      'Nick Name',
      name: 'nickname',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Phone`
  String get mobilephone {
    return Intl.message(
      'Mobile Phone',
      name: 'mobilephone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Invite Code`
  String get invitecode {
    return Intl.message(
      'Invite Code',
      name: 'invitecode',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get accountsettings {
    return Intl.message(
      'Account Settings',
      name: 'accountsettings',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changepassword {
    return Intl.message(
      'Change Password',
      name: 'changepassword',
      desc: '',
      args: [],
    );
  }

  /// `Wechat`
  String get wechat {
    return Intl.message(
      'Wechat',
      name: 'wechat',
      desc: '',
      args: [],
    );
  }

  /// `Account Cancellation`
  String get accountcancel {
    return Intl.message(
      'Account Cancellation',
      name: 'accountcancel',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout {
    return Intl.message(
      'Log Out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Config`
  String get config {
    return Intl.message(
      'Config',
      name: 'config',
      desc: '',
      args: [],
    );
  }

  /// `Update device name`
  String get updatedevicename {
    return Intl.message(
      'Update device name',
      name: 'updatedevicename',
      desc: '',
      args: [],
    );
  }

  /// `Lismits discharge/charge`
  String get limitdischargeandcharge {
    return Intl.message(
      'Lismits discharge/charge',
      name: 'limitdischargeandcharge',
      desc: '',
      args: [],
    );
  }

  /// `AC charging rate`
  String get acchargerate {
    return Intl.message(
      'AC charging rate',
      name: 'acchargerate',
      desc: '',
      args: [],
    );
  }

  /// `Car charge`
  String get carcharge {
    return Intl.message(
      'Car charge',
      name: 'carcharge',
      desc: '',
      args: [],
    );
  }

  /// `Buzzer`
  String get buzzer {
    return Intl.message(
      'Buzzer',
      name: 'buzzer',
      desc: '',
      args: [],
    );
  }

  /// `Screen Brightness`
  String get screenbrightness {
    return Intl.message(
      'Screen Brightness',
      name: 'screenbrightness',
      desc: '',
      args: [],
    );
  }

  /// `Stand by time of equipment`
  String get standbytime {
    return Intl.message(
      'Stand by time of equipment',
      name: 'standbytime',
      desc: '',
      args: [],
    );
  }

  /// `Others`
  String get others {
    return Intl.message(
      'Others',
      name: 'others',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
