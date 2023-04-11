import '../../../core/base/model/base_model.dart';
import '../../../core/base/model/base_view_model.dart';
import '../../../core/base/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'authentication_view_model.g.dart';

class AuthenticationViewModel = _AuthenticationViewModel
    with _$AuthenticationViewModel;

abstract class _AuthenticationViewModel with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  @override
  void init() {}

  final PageController pageController = PageController(initialPage: 0);

  @observable
  int currentPageIndex = 0;

  @observable
  bool showPasswords = false;

  void changePageIndex(int index) {
    currentPageIndex = index;
  }
}
