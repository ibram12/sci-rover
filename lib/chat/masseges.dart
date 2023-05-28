class Massege {
  final String massege;
  final String email;
  Massege(this.massege, this.email);

  factory Massege.fromJSON(jsonData) {
    return Massege(jsonData['massege'], jsonData['email']);
  }
}
