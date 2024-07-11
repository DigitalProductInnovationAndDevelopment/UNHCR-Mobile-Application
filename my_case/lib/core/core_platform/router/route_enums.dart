enum NavigationEnums {
  viewScreen("/view_screen"),
  settingsScreen("/settings_screen"),
  signInScreen("/sign_in"),
  signUpScreen("/sign_up"),
  signUpScreenStep2("/sign_up_2"),
  signUpScreenStep3("/sign_up_3"),
  whatIsMyCaseScreen("/what_is_my_case"),
  requestDetailScreen("/request_detail_screen"),
  createRequestScreen("/create_request_screen"),
  chatScreen("/chat_screen"),
  authenticator("/authenticator");

  final String routeName;
  const NavigationEnums(this.routeName);
}
