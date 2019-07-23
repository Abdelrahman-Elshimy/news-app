class NavMenu {
  String _title;
  Function _destination;

  NavMenu(this._title, this._destination);

  String get title => _title;

  Function get destination => _destination;
}