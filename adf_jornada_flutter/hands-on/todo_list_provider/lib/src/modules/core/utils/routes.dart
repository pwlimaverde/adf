enum Routes {
  initial(caminho: "/"),
  home(caminho: "/home"),
  taskCreate(caminho: "/task/create"),
  taskUpdate(caminho: "/task/update"),
  login(caminho: "/login"),
  register(caminho: "/register");

  final String caminho;
  const Routes({required this.caminho});
}
