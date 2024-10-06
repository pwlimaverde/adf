enum Routes {
  initial(caminho: "/"),
  home(caminho: "/home"),
  login(caminho: "/login"),
  register(caminho: "/register");

  final String caminho;
  const Routes({required this.caminho});
}
