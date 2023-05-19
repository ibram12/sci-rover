class LinkVideos {
  final int id;
  final String title, subTitle, description, image;
  final List<String> links;
  final List<String> namelinks;
  LinkVideos(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.image,
      required this.description,
      required this.links,
      required this.namelinks});
}

List<LinkVideos> linkVideos = [
  LinkVideos(
    id: 1,
    title: "الكشفية 41",
    subTitle: " 2022 ",
    image: "images/m22.jpg",
    description: " انتظر الاصدار الثالث",
    links: [
      'https://youtu.be/38hZKq2tzuw',
      'https://youtu.be/OXQ5ee6p9ZA',
      'https://youtu.be/38hZKq2tzuw'
    ],
    namelinks: ['ليلة', 'يا اسكندرية', 'ماما مالو'],
  ),
  LinkVideos(
    id: 1,
    title: "الكشفية 41",
    subTitle: " 2022 ",
    image: "images/m22.jpg",
    description: " انتظر الاصدار الثالث",
    links: [
      'https://youtu.be/38hZKq2tzuw',
      'https://youtu.be/OXQ5ee6p9ZA',
      'https://youtu.be/38hZKq2tzuw'
    ],
    namelinks: ['ليلة', 'يا اسكندرية', 'ماما مالو'],
  ),
  LinkVideos(
    id: 1,
    title: "الكشفية 41",
    subTitle: " 2022 ",
    image: "images/m22.jpg",
    description: " انتظر الاصدار الثالث",
    links: [
      'https://youtu.be/38hZKq2tzuw',
      'https://youtu.be/OXQ5ee6p9ZA',
      'https://youtu.be/38hZKq2tzuw'
    ],
    namelinks: ['ليلة', 'يا اسكندرية', 'ماما مالو'],
  ),
];
