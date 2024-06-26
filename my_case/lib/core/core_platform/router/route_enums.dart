enum NavigationEnums {
  viewScreen("/view_screen"),
  settingsScreen("/settings_screen"),
  signInScreen("/sign_in"),
  signUpScreen("/sign_up"),
  whatIsMyCaseScreen("/what_is_my_case"),
  chatScreen("/chat_screen");

  final String routeName;
  const NavigationEnums(this.routeName);
}
