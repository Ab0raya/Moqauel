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

  /// `Al-Hajj Said`
  String get userName {
    return Intl.message(
      'Al-Hajj Said',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Accounts`
  String get accounts {
    return Intl.message(
      'Accounts',
      name: 'accounts',
      desc: '',
      args: [],
    );
  }

  /// `Expenses`
  String get expenses {
    return Intl.message(
      'Expenses',
      name: 'expenses',
      desc: '',
      args: [],
    );
  }

  /// `The Income`
  String get theIncome {
    return Intl.message(
      'The Income',
      name: 'theIncome',
      desc: '',
      args: [],
    );
  }

  /// `Add Account`
  String get addAccount {
    return Intl.message(
      'Add Account',
      name: 'addAccount',
      desc: '',
      args: [],
    );
  }

  /// `No Accounts to Display`
  String get noAccounts {
    return Intl.message(
      'No Accounts to Display',
      name: 'noAccounts',
      desc: '',
      args: [],
    );
  }

  /// `Adding Account`
  String get addingAccount {
    return Intl.message(
      'Adding Account',
      name: 'addingAccount',
      desc: '',
      args: [],
    );
  }

  /// `Owner`
  String get owner {
    return Intl.message(
      'Owner',
      name: 'owner',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Owner's Name`
  String get ownerError {
    return Intl.message(
      'Please Enter Owner\'s Name',
      name: 'ownerError',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Location Name`
  String get locationError {
    return Intl.message(
      'Please Enter Location Name',
      name: 'locationError',
      desc: '',
      args: [],
    );
  }

  /// `Income`
  String get income {
    return Intl.message(
      'Income',
      name: 'income',
      desc: '',
      args: [],
    );
  }

  /// `Expense`
  String get expense {
    return Intl.message(
      'Expense',
      name: 'expense',
      desc: '',
      args: [],
    );
  }

  /// `Creation Date`
  String get creationDate {
    return Intl.message(
      'Creation Date',
      name: 'creationDate',
      desc: '',
      args: [],
    );
  }

  /// `Total Income`
  String get totalIncome {
    return Intl.message(
      'Total Income',
      name: 'totalIncome',
      desc: '',
      args: [],
    );
  }

  /// `Total Expenses`
  String get totalExpenses {
    return Intl.message(
      'Total Expenses',
      name: 'totalExpenses',
      desc: '',
      args: [],
    );
  }

  /// `No Treatments to Display`
  String get noTreatments {
    return Intl.message(
      'No Treatments to Display',
      name: 'noTreatments',
      desc: '',
      args: [],
    );
  }

  /// `Treatment`
  String get treatment {
    return Intl.message(
      'Treatment',
      name: 'treatment',
      desc: '',
      args: [],
    );
  }

  /// `Optional Treatment Details`
  String get optionalTreatmentDetails {
    return Intl.message(
      'Optional Treatment Details',
      name: 'optionalTreatmentDetails',
      desc: '',
      args: [],
    );
  }

  /// `Cost`
  String get cost {
    return Intl.message(
      'Cost',
      name: 'cost',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter the Treatment`
  String get treatmentError {
    return Intl.message(
      'Please Enter the Treatment',
      name: 'treatmentError',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter  Cost`
  String get costError {
    return Intl.message(
      'Please Enter  Cost',
      name: 'costError',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter a Valid Numeric Value`
  String get costNotNum {
    return Intl.message(
      'Please Enter a Valid Numeric Value',
      name: 'costNotNum',
      desc: '',
      args: [],
    );
  }

  /// `Are You Sure to Delete ?`
  String get confirmDelete {
    return Intl.message(
      'Are You Sure to Delete ?',
      name: 'confirmDelete',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Show Data`
  String get showData {
    return Intl.message(
      'Show Data',
      name: 'showData',
      desc: '',
      args: [],
    );
  }

  /// `Delete Treatment`
  String get deleteTreatment {
    return Intl.message(
      'Delete Treatment',
      name: 'deleteTreatment',
      desc: '',
      args: [],
    );
  }

  /// `PDF File Name`
  String get pdfFileName {
    return Intl.message(
      'PDF File Name',
      name: 'pdfFileName',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter  File Name`
  String get pdfFileNameError {
    return Intl.message(
      'Please Enter  File Name',
      name: 'pdfFileNameError',
      desc: '',
      args: [],
    );
  }

  /// `PDF File Preview`
  String get pdfFilePreview {
    return Intl.message(
      'PDF File Preview',
      name: 'pdfFilePreview',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `No Expenses`
  String get noExpenses {
    return Intl.message(
      'No Expenses',
      name: 'noExpenses',
      desc: '',
      args: [],
    );
  }

  /// `No Income`
  String get noIncome {
    return Intl.message(
      'No Income',
      name: 'noIncome',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Laborers`
  String get laborers {
    return Intl.message(
      'Laborers',
      name: 'laborers',
      desc: '',
      args: [],
    );
  }

  /// `Invoice`
  String get invoice {
    return Intl.message(
      'Invoice',
      name: 'invoice',
      desc: '',
      args: [],
    );
  }

  /// `Archive`
  String get archive {
    return Intl.message(
      'Archive',
      name: 'archive',
      desc: '',
      args: [],
    );
  }

  /// `Something goes wrong !`
  String get errorHappened {
    return Intl.message(
      'Something goes wrong !',
      name: 'errorHappened',
      desc: '',
      args: [],
    );
  }

  /// `Properties`
  String get properties {
    return Intl.message(
      'Properties',
      name: 'properties',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `My account`
  String get myAcc {
    return Intl.message(
      'My account',
      name: 'myAcc',
      desc: '',
      args: [],
    );
  }

  /// `Edit name`
  String get editName {
    return Intl.message(
      'Edit name',
      name: 'editName',
      desc: '',
      args: [],
    );
  }

  /// `Edit avatar`
  String get editAvatar {
    return Intl.message(
      'Edit avatar',
      name: 'editAvatar',
      desc: '',
      args: [],
    );
  }

  /// `Attended`
  String get attended {
    return Intl.message(
      'Attended',
      name: 'attended',
      desc: '',
      args: [],
    );
  }

  /// `Absent`
  String get absent {
    return Intl.message(
      'Absent',
      name: 'absent',
      desc: '',
      args: [],
    );
  }

  /// `Half day`
  String get halfDay {
    return Intl.message(
      'Half day',
      name: 'halfDay',
      desc: '',
      args: [],
    );
  }

  /// `Add laborer`
  String get addLaborer {
    return Intl.message(
      'Add laborer',
      name: 'addLaborer',
      desc: '',
      args: [],
    );
  }

  /// `Adding laborer`
  String get addingLaborer {
    return Intl.message(
      'Adding laborer',
      name: 'addingLaborer',
      desc: '',
      args: [],
    );
  }

  /// `Laborer name`
  String get laborerName {
    return Intl.message(
      'Laborer name',
      name: 'laborerName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter laborer name`
  String get laborerNameError {
    return Intl.message(
      'Please enter laborer name',
      name: 'laborerNameError',
      desc: '',
      args: [],
    );
  }

  /// `Laborer not found`
  String get laborerNotFound {
    return Intl.message(
      'Laborer not found',
      name: 'laborerNotFound',
      desc: '',
      args: [],
    );
  }

  /// `There's no laborers to display`
  String get noLaborers {
    return Intl.message(
      'There\'s no laborers to display',
      name: 'noLaborers',
      desc: '',
      args: [],
    );
  }

  /// `Create invoice`
  String get createInvoice {
    return Intl.message(
      'Create invoice',
      name: 'createInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Create PDF`
  String get createPdf {
    return Intl.message(
      'Create PDF',
      name: 'createPdf',
      desc: '',
      args: [],
    );
  }

  /// `File name`
  String get fileName {
    return Intl.message(
      'File name',
      name: 'fileName',
      desc: '',
      args: [],
    );
  }

  /// `File name mustn't contain the (.) symbol`
  String get fileDotError {
    return Intl.message(
      'File name mustn\'t contain the (.) symbol',
      name: 'fileDotError',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Service`
  String get service {
    return Intl.message(
      'Service',
      name: 'service',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the service`
  String get serviceError {
    return Intl.message(
      'Please enter the service',
      name: 'serviceError',
      desc: '',
      args: [],
    );
  }

  /// `New field`
  String get newField {
    return Intl.message(
      'New field',
      name: 'newField',
      desc: '',
      args: [],
    );
  }

  /// `PDF`
  String get pdf {
    return Intl.message(
      'PDF',
      name: 'pdf',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter the details`
  String get detailsError {
    return Intl.message(
      'Please Enter the details',
      name: 'detailsError',
      desc: '',
      args: [],
    );
  }

  /// `Add element to archive`
  String get addElementToArchive {
    return Intl.message(
      'Add element to archive',
      name: 'addElementToArchive',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the title`
  String get titleError {
    return Intl.message(
      'Please enter the title',
      name: 'titleError',
      desc: '',
      args: [],
    );
  }

  /// `Value`
  String get value {
    return Intl.message(
      'Value',
      name: 'value',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the value`
  String get valueError {
    return Intl.message(
      'Please enter the value',
      name: 'valueError',
      desc: '',
      args: [],
    );
  }

  /// `This image has been shared via application دفتر`
  String get shareImageMsg {
    return Intl.message(
      'This image has been shared via application دفتر',
      name: 'shareImageMsg',
      desc: '',
      args: [],
    );
  }

  /// `There's no archived elements`
  String get noArchivedElements {
    return Intl.message(
      'There\'s no archived elements',
      name: 'noArchivedElements',
      desc: '',
      args: [],
    );
  }

  /// `There's no title`
  String get noTitle {
    return Intl.message(
      'There\'s no title',
      name: 'noTitle',
      desc: '',
      args: [],
    );
  }

  /// `Confirm delete`
  String get deleting {
    return Intl.message(
      'Confirm delete',
      name: 'deleting',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure that you want to delete this element?`
  String get confirmDeleteMsg {
    return Intl.message(
      'Are you sure that you want to delete this element?',
      name: 'confirmDeleteMsg',
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

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
