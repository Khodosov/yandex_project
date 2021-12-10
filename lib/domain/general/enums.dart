enum AppTab {
  favorites,
  home,
  search,
  random,
  settings,
}

extension ParseToString on AppTab {
  String fromEnum() {
    return toString().split('.').last[0].toUpperCase() +
        toString().split('.').last.substring(1);
  }
}
