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

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
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
  String get loginpassword {
    return Intl.message(
      'Password',
      name: 'loginpassword',
      desc: '',
      args: [],
    );
  }

  /// `Old password`
  String get old_password {
    return Intl.message(
      'Old password',
      name: 'old_password',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get new_password {
    return Intl.message(
      'New password',
      name: 'new_password',
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

  /// `Cancellation Reason`
  String get cancel_reason {
    return Intl.message(
      'Cancellation Reason',
      name: 'cancel_reason',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in the reason for your account cancellation. Note: Once your account is cancelled, you will not be able to use our company's apps and related products. Please operate with caution!`
  String get cancel_tips {
    return Intl.message(
      'Please fill in the reason for your account cancellation. Note: Once your account is cancelled, you will not be able to use our company\'s apps and related products. Please operate with caution!',
      name: 'cancel_tips',
      desc: '',
      args: [],
    );
  }

  /// `Account Cancellation Success`
  String get account_cancel_success {
    return Intl.message(
      'Account Cancellation Success',
      name: 'account_cancel_success',
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

  /// `Requesting...`
  String get toast_requesting {
    return Intl.message(
      'Requesting...',
      name: 'toast_requesting',
      desc: '',
      args: [],
    );
  }

  /// `Account registration succeeded!`
  String get register_success {
    return Intl.message(
      'Account registration succeeded!',
      name: 'register_success',
      desc: '',
      args: [],
    );
  }

  /// `Username or password cannot be empty!`
  String get name_password_need {
    return Intl.message(
      'Username or password cannot be empty!',
      name: 'name_password_need',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Phone or email can not empty！`
  String get mobilephone_email_need {
    return Intl.message(
      'Mobile Phone or email can not empty！',
      name: 'mobilephone_email_need',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Phone and email and password can not empty!`
  String get mobilephone_password_need {
    return Intl.message(
      'Mobile Phone and email and password can not empty!',
      name: 'mobilephone_password_need',
      desc: '',
      args: [],
    );
  }

  /// `You need to check Agree to User Agreement and Privacy Policy!`
  String get user_agree_select_need {
    return Intl.message(
      'You need to check Agree to User Agreement and Privacy Policy!',
      name: 'user_agree_select_need',
      desc: '',
      args: [],
    );
  }

  /// `Modify password`
  String get modify_password {
    return Intl.message(
      'Modify password',
      name: 'modify_password',
      desc: '',
      args: [],
    );
  }

  /// `Modify password success`
  String get modify_password_success {
    return Intl.message(
      'Modify password success',
      name: 'modify_password_success',
      desc: '',
      args: [],
    );
  }

  /// `Retrieve password`
  String get retrieve_password {
    return Intl.message(
      'Retrieve password',
      name: 'retrieve_password',
      desc: '',
      args: [],
    );
  }

  /// `Validate code`
  String get validate_code {
    return Intl.message(
      'Validate code',
      name: 'validate_code',
      desc: '',
      args: [],
    );
  }

  /// `get validate code`
  String get get_validate_code {
    return Intl.message(
      'get validate code',
      name: 'get_validate_code',
      desc: '',
      args: [],
    );
  }

  /// `Validate code send success !`
  String get validate_code_send_success {
    return Intl.message(
      'Validate code send success !',
      name: 'validate_code_send_success',
      desc: '',
      args: [],
    );
  }

  /// ` Reset Password `
  String get reset_password {
    return Intl.message(
      ' Reset Password ',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// ` Reset password success!`
  String get reset_password_success {
    return Intl.message(
      ' Reset password success!',
      name: 'reset_password_success',
      desc: '',
      args: [],
    );
  }

  /// ` Reset password fail!`
  String get reset_password_fail {
    return Intl.message(
      ' Reset password fail!',
      name: 'reset_password_fail',
      desc: '',
      args: [],
    );
  }

  /// `Validate code can not be empty!`
  String get validate_code_need {
    return Intl.message(
      'Validate code can not be empty!',
      name: 'validate_code_need',
      desc: '',
      args: [],
    );
  }

  /// `password can not be empty!`
  String get password_need {
    return Intl.message(
      'password can not be empty!',
      name: 'password_need',
      desc: '',
      args: [],
    );
  }

  /// `Add device success!`
  String get add_device_success {
    return Intl.message(
      'Add device success!',
      name: 'add_device_success',
      desc: '',
      args: [],
    );
  }

  /// `Add device fail, please retry!`
  String get add_device_fail {
    return Intl.message(
      'Add device fail, please retry!',
      name: 'add_device_fail',
      desc: '',
      args: [],
    );
  }

  /// `Device Detail`
  String get device_detail {
    return Intl.message(
      'Device Detail',
      name: 'device_detail',
      desc: '',
      args: [],
    );
  }

  /// `Input`
  String get input {
    return Intl.message(
      'Input',
      name: 'input',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Out`
  String get out {
    return Intl.message(
      'Out',
      name: 'out',
      desc: '',
      args: [],
    );
  }

  /// `PV Input`
  String get pv_input {
    return Intl.message(
      'PV Input',
      name: 'pv_input',
      desc: '',
      args: [],
    );
  }

  /// `Conserve Energy Config`
  String get conserve_energy_config {
    return Intl.message(
      'Conserve Energy Config',
      name: 'conserve_energy_config',
      desc: '',
      args: [],
    );
  }

  /// `Power Supply Setting`
  String get power_supply_setting {
    return Intl.message(
      'Power Supply Setting',
      name: 'power_supply_setting',
      desc: '',
      args: [],
    );
  }

  /// `Charge Config`
  String get charge_config {
    return Intl.message(
      'Charge Config',
      name: 'charge_config',
      desc: '',
      args: [],
    );
  }

  /// `need field can not empty`
  String get field_need {
    return Intl.message(
      'need field can not empty',
      name: 'field_need',
      desc: '',
      args: [],
    );
  }

  /// `Save Success`
  String get save_success {
    return Intl.message(
      'Save Success',
      name: 'save_success',
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
