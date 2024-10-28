enum Routes {
  initial(caminho: "/"),
  home(caminho: "/home"),
  task_create(caminho: "/task/create"),
  login(caminho: "/login"),
  register(caminho: "/register");

  final String caminho;
  const Routes({required this.caminho});
}
