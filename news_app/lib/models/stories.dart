class Stories {
  String _title;
  String _author;
  String _time;
  String _image;
  String _kind;
  String _description;

  Stories(this._title, this._author, this._time, this._image, this._kind, this._description);

  String get title => _title;
  String get author => _author;
  String get time => _time;
  String get image => _image;
  String get kind => _kind;
  String get description => _description;

}