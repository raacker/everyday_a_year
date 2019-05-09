enum LogType {
  IMAGE,
  NOTE,
  VIDEO,
  NONE,
}

class EverydayLog {

  static const ID_COL = "id";
  static const TITLE_COL = "title";
  static const DESCRIPTION_COL = "description";
  static const DATE_COL = "date";
  static const LOG_TYPE_COL = "log_type";
  static const IMAGE_LINK_COL = "image_link";

  int _id;
  String _imageLink;
  String _title;
  String _description;
  String _date;
  LogType _logType;

  EverydayLog(this._imageLink, this._title, this._date, this._description);
  EverydayLog.withId(this._id, this._imageLink, this._title, this._date, this._description);

  int get id => _id;
  String get imageLink => _imageLink;
  String get title => _title;
  String get date => _date;
  String get description => _description;
  LogType get logType => _logType;

  set imageLink(String imageLink) {
    if (imageLink.isNotEmpty) {
      _imageLink = imageLink;
    }
  }

  set title(String title) {
    if (title.isNotEmpty) {
      _title = title;
    }
  }

  set date(String date) {
    if (date.isNotEmpty) {
      _date = date;
    }
  }

  set description(String description) {
    if (description.isNotEmpty) {
      _description = description;
    }
  }

  set logType(LogType logType) {
    _logType = logType;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map[ID_COL] = _id;
    map[TITLE_COL] = _title;
    map[DESCRIPTION_COL] = _description;
    map[IMAGE_LINK_COL] = _imageLink;
    map[LOG_TYPE_COL] = _logType.index;
    return map;
  }

  EverydayLog.fromMap(Map<String, dynamic> map) {
    _id = map[ID_COL] ;
    _title = map[TITLE_COL];
    _description = map[DESCRIPTION_COL];
    _imageLink = map[IMAGE_LINK_COL];
    _logType = map[LOG_TYPE_COL];
  }
}