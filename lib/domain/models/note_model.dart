class Note {
  String _id;
  String _title;
  String _content;
  DateTime? _createdDate;
  DateTime _updatedDate;

  Note(this._id, this._title, this._content, this._createdDate,
      this._updatedDate);

  Note.update(this._id, this._title, this._content, this._updatedDate);

  // getters

  String get id => _id;

  String get title => _title;

  String get content => _content;

  DateTime get createdDate => _createdDate!;

  DateTime get updatedDate => _updatedDate;

  // setters

  set title(String newTitle) {
    _title = newTitle;
  }

  set content(String newContent) {
    _content = newContent;
  }

  set createdDate(DateTime newCreatedDate) {
    _createdDate = newCreatedDate;
  }

  set updatedDate(DateTime newUpdatedDate) {
    _updatedDate = newUpdatedDate;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'title': _title,
      'content': _content,
      'createdDate': _createdDate.toString(),
      'updatedDate': _updatedDate.toString(),
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      map['id'],
      map['title'],
      map['content'],
      DateTime.parse(map['createdDate']),
      DateTime.parse(map['updatedDate']),
    );
  }
}
