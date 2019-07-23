class TwitterFeedsModel {
  String _name;
  String _username;
  String _date;
  String _description;
  int _shareCount;
  String _image;

   TwitterFeedsModel(this._name, this._username, this._description, this._image, this._date, this._shareCount);


   String get name => _name;
   String get username => _username;
   String get date => _date;
   String get description => _description;
   int get shareCount => _shareCount;
   String get image => _image;

}