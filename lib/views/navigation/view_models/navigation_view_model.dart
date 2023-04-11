import '../../../core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'navigation_view_model.g.dart';

class NavigationViewModel = _NavigationViewModelBase with _$NavigationViewModel;

abstract class _NavigationViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  @override
  void init() {}

  @observable
  int currentPageIndex = 0;

  @observable
  bool loading = false;

  void changeLoading() {
    loading=!loading;
  }
}
