enum Routes {
  initial(caminho: "/"),
  home(caminho: "/home"),
  login(caminho: "/login");

  final String caminho;
  const Routes({required this.caminho});
}
