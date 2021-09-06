class Note {
  int _id;
  var _title;
  var _desc;
  var _date;
  int _priority;
  Note(this._title, this._date, this._priority, [this._desc]);
  Note.withId(this._id, this._date, this._priority, [this._desc]);

  int get id => _id;
  int get priority => _priority;
  String get title => _title;
  String get desc => _desc;
  String get date => _date;

  set title(String newTitle) {
    if (newTitle.length > 255) {
      this.title = newTitle;
    }
  }

  set desc(String newDesc) {
    if (newDesc.length > 255) {
      this._desc = newDesc;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }

  set date(String newDate) {
    this._date = newDate;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['desc'] = desc;
    map['date'] = date;
    map['priority'] = priority;
    return map;
  }

  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._desc = map['desc'];
    this._date = map['date'];
    this._priority = map['priority'];
  }
}
