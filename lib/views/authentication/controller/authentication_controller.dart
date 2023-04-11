import '../view_models/authentication_view_model.dart';

class AuthenticationController {
  AuthenticationController._init();
  static AuthenticationController? _instance;
  static AuthenticationController get instance {
    _instance ??= AuthenticationController._init();
    return _instance!;
  }

  AuthenticationViewModel authenticationViewModel = AuthenticationViewModel();
}
