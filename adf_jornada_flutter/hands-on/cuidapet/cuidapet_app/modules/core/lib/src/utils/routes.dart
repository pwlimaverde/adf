enum Routes {
  initial(caminho: "/"),
  login(caminho: "/login"),
  home(caminho: "/home");

  final String caminho;
  const Routes({required this.caminho});
}
