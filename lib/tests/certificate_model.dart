import 'package:pdf/widgets.dart' as pw;

class Certificate {
  final String title;
  final DateTime date;
  final Content content;

  Certificate({required this.title, required this.date, required this.content});
}

class Content {
  final String mainContent;
  final List<String> subContent;

  Content({required this.mainContent, required this.subContent});
}
