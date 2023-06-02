// ignore: camel_case_types
class dataRover {
  final String title, subTitle, description, image;

  dataRover(
    this.title,
    this.subTitle,
    this.description,
    this.image,
  );

  factory dataRover.fromJSON(jsonData) {
    return dataRover(
      jsonData['title'],
      jsonData['subTitle'],
      jsonData['description'],
      jsonData['image'],
    );
  }
}
