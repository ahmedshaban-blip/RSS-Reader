
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

import '../models/rss_item.dart';

class RssRepository {
  final http.Client _client;

  RssRepository({http.Client? client}) : _client = client ?? http.Client();

  Future<List<RssItem>> fetchRssItems(String url) async {
    final response = await _client.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Failed to load RSS (${response.statusCode})');
    }

    final document = xml.XmlDocument.parse(response.body);

    final items = document.findAllElements('item').map((element) {
      final title = element.getElement('title')?.innerText.trim() ?? 'No title';
      final link = element.getElement('link')?.innerText.trim() ?? '';
      final pubDate = element.getElement('pubDate')?.innerText.trim() ?? '';
      final rawDescription =
          element.getElement('description')?.innerText.trim() ?? '';

      final imageUrl = _extractImageUrl(element, rawDescription);

      final description = _stripHtml(rawDescription);

      return RssItem(
        title: title,
        link: link,
        description: description,
        pubDate: pubDate,
        imageUrl: imageUrl,
      );
    }).toList();

    return items;
  }

  static String _stripHtml(String htmlText) {
    final regex = RegExp(r'<[^>]*>', multiLine: true, dotAll: true);
    return htmlText.replaceAll(regex, '').trim();
  }

  static String? _extractImageUrl(
    xml.XmlElement element,
    String rawDescription,
  ) {
    final mediaCandidates = element.descendants
        .whereType<xml.XmlElement>()
        .where((e) =>
            e.name.local == 'content' ||
            e.name.local == 'thumbnail' ||
            e.name.local == 'enclosure' ||
            e.name.local == 'image')
        .toList();

    if (mediaCandidates.isNotEmpty) {
      final media = mediaCandidates.first;
      final urlAttr =
          media.getAttribute('url') ?? media.getAttribute('href');
      if (urlAttr != null && urlAttr.isNotEmpty) {
        return urlAttr;
      }
    }

    if (rawDescription.isNotEmpty) {
      final imgRegex = RegExp(
        "<img[^>]+src=['\"]([^'\"]+)['\"]",
        caseSensitive: false,
      );

      final match = imgRegex.firstMatch(rawDescription);
      if (match != null && match.groupCount >= 1) {
        return match.group(1);
      }
    }

    return null;
  }
}
