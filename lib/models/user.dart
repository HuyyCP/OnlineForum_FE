class User {
  // late String iduser;
  late String name;
  late String email;
  // late String dateofbirth;
  // late String phonenumber;
  // late String datecreate;
  // late String idrole;

  User({
    // required this.iduser,
    required this.name,
    required this.email,
    // required this.dateofbirth,
    // required this.phonenumber,
    // required this.datecreate,
    // required this.idrole
  });

  User.fromJson(Map<String, dynamic> json) {
    // iduser = json['iduser'];
    name = json['name'];
    email = json['email'];
    // dateofbirth = json['dateofbirth'];
    // phonenumber = json['phonenumber'];
    // datecreate = json['datecreate'];
    // idrole = json['idrole'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    // json['iduser'] = iduser;
    json['name'] = name;
    json['email'] = email;
    // json['dateofbirth'] = dateofbirth;
    // json['phonenumber'] = phonenumber;
    // json['datecreate'] = datecreate;
    // json['idrole'] = idrole;
    return json;
  }
}