enum NavigationEnums {
  viewScreen("/view_screen"),
  signInScreen("/sign_in"),
  signUpScreen("/sign_up"),
  whatIsMyCaseScreen("/what_is_my_case");

  final String routeName;
  const NavigationEnums(this.routeName);
}
