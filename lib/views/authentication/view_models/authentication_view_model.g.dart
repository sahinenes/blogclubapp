// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthenticationViewModel on _AuthenticationViewModel, Store {
  late final _$currentPageIndexAtom =
      Atom(name: '_AuthenticationViewModel.currentPageIndex', context: context);

  @override
  int get currentPageIndex {
    _$currentPageIndexAtom.reportRead();
    return super.currentPageIndex;
  }

  @override
  set currentPageIndex(int value) {
    _$currentPageIndexAtom.reportWrite(value, super.currentPageIndex, () {
      super.currentPageIndex = value;
    });
  }

  late final _$showPasswordsAtom =
      Atom(name: '_AuthenticationViewModel.showPasswords', context: context);

  @override
  bool get showPasswords {
    _$showPasswordsAtom.reportRead();
    return super.showPasswords;
  }

  @override
  set showPasswords(bool value) {
    _$showPasswordsAtom.reportWrite(value, super.showPasswords, () {
      super.showPasswords = value;
    });
  }

  @override
  String toString() {
    return '''
currentPageIndex: ${currentPageIndex},
showPasswords: ${showPasswords}
    ''';
  }
}
