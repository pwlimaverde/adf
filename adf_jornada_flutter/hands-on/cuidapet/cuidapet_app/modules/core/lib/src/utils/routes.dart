enum Routes {
  auth(caminho: "/auth/"),
  login(caminho: "/auth/login/"),
  home(caminho: "/home/");

  final String caminho;
  const Routes({required this.caminho});
}
