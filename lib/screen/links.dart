class Links {

  final String scheme, host,path,name;

  Links(
      {required this.scheme,
        required this.host,
        required this.path,
        required this.name,
      });
}
List<Links> links = [
  Links(
    scheme: 'https',
    host: 'www.facebook.com',
    path: 'Science.Rover.Page',
    name: "عشيرة جوالة كلية العلوم",
  ),
  Links(
    scheme: 'https',
    host: 'www.facebook.com',
    path: 'acadmic.advisor.scialex',
    name: "صفحة الارشاد الأكاديمي",
  ),
  Links(
    scheme: 'https',
    host: 'www.facebook.com',
    path: 'groups/1226288398154343',
    name: "صفحة أعرف علوم",
  ),
  Links(
    scheme: 'https',
    host: 'www.facebook.com',
    path: 'groups/1031973460732924',
    name: "صفحة اتحاد علوم",
  ),
  Links(
    scheme: 'https',
    host: 'www.scialex.org',
    path: ' ',
    name: "الموقع الالكتروني لكلية العلوم",
  ),

];
