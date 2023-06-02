// ignore: camel_case_types
class repMassege {
  final String email;
  repMassege(this.email);

  factory repMassege.fromJSON(jsonData) {
    return repMassege(jsonData['email']);
  }
}
