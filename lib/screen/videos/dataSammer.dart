// ignore: camel_case_types
class dataSammer {
  final String title, subTitle, description, image;
  final List<dynamic> links;
  final List<dynamic> namelinks;
  dataSammer(this.title, this.subTitle, this.description, this.image,
      this.links, this.namelinks);

  factory dataSammer.fromJSON(jsonData) {
    return dataSammer(
        jsonData['title'],
        jsonData['subTitle'],
        jsonData['description'],
        jsonData['image'],
        jsonData['links'],
        jsonData['namelinks']);
  }
}
