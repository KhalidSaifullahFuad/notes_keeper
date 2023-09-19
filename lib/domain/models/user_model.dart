class User {
  String _id;
  String _name;
  String _email;
  String _password;
  DateTime? _createdDate;
  DateTime _updatedDate;
  
  User(
    this._id,
    this._name,
    this._email,
    this._password,
    this._createdDate,
    this._updatedDate,
  );

  User.update(
    this._id,
    this._name,
    this._email,
    this._password,
    this._updatedDate,
  );

  String get id => _id;
  String get name => _name;
  String get email => _email;
  String get password => _password;
  DateTime get createdDate => _createdDate!;
  DateTime get updatedDate => _updatedDate;

  set name(String name) {
    _name = name;
  }

  set email(String email) {
    _email = email;
  }

  set password(String password) {
    _password = password;
  }

  set updatedDate(DateTime updatedDate) {
    _updatedDate = updatedDate;
  }


  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'name': _name,
      'email': _email,
      'password': _password,
      'createdDate': _createdDate.toString(),
      'updatedDate': _updatedDate.toString(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['id'],
      map['name'],
      map['email'],
      map['password'],
      DateTime.parse(map['createdDate']),
      DateTime.parse(map['updatedDate']),
    );
  }
}
