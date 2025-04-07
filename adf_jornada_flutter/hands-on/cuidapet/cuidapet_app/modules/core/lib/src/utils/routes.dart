enum Routes {
  auth(caminho: "/auth/"),
  login(caminho: "/auth/login/"),
  register(caminho: "/auth/register/"),
  home(caminho: "/home/");

  final String caminho;
  const Routes({required this.caminho});
}
