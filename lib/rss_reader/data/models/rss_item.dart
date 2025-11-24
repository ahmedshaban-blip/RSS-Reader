// rss_reader/data/models/rss_item.dart
class RssItem {
  final String title;
  final String link;
  final String description;
  final String pubDate;
  final String? imageUrl;

  const RssItem({
    required this.title,
    required this.link,
    required this.description,
    required this.pubDate,
    this.imageUrl,
  });
}
