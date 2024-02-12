enum DbInfo {
  v1(1),
  v2(2),
  v3(3),
  v4(4);

  const DbInfo(int version) : _version = version;
  static const name = 'TODO_LIST_PROVIDER';
  final int _version;
  int get version => _version;
}
