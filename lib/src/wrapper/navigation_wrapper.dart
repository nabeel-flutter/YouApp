/// screen : ""
/// args : ""

class NavigationWrapper {
  NavigationWrapper({
    String? screen,
    dynamic args,
  }) {
    _screen = screen;
    _args = args;
  }

  NavigationWrapper.fromJson(dynamic json) {
    _screen = json['screen'];
    _args = json['args'];
  }

  String? _screen;
  dynamic _args;

  String? get screen => _screen;

  dynamic get args => _args;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['screen'] = _screen;
    map['args'] = _args;
    return map;
  }
}
