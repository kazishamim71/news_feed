import 'package:flutter/material.dart';

void main() {
  runApp(NewsFeedApp());
}

class NewsFeedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Feed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsFeedPage(),
    );
  }
}

class NewsFeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(
                  articles[index].thumbnailUrl,
                  width: orientation == Orientation.portrait ? 100 : 150,
                  height: orientation == Orientation.portrait ? 100 : 150,
                  fit: BoxFit.cover,
                ),
                title: Text(articles[index].title),
                subtitle: Text(articles[index].description),
              );
            },
          );
        },
      ),
    );
  }
}

class NewsArticle {
  final String thumbnailUrl;
  final String title;
  final String description;

  NewsArticle({
    required this.thumbnailUrl,
    required this.title,
    required this.description,
  });
}

List<NewsArticle> articles = [
  NewsArticle(
    thumbnailUrl:
    'https://tds-images.thedailystar.net/sites/default/files/styles/medium_201/public/images/2023/07/16/openkylin_os_china.jpg?itok=dXzsToD2&timestamp=1689507277',
    title: 'China launches its own open-source operating system',
    description: "China has recently released the country's first open-source desktop operating system. Named openKylin, the OS is considered a part of China's growing efforts in cutting down its reliance on US technology. ",
  ),
  NewsArticle(
    thumbnailUrl:
    'https://tds-images.thedailystar.net/sites/default/files/styles/medium_201/public/images/2023/07/12/zoom_virtual_background-7.jpg?itok=HLOe_S_R&timestamp=1689183476',
    title: 'Elon Musk launches new AI company called xAI',
    description: "Elon Musk, the CEO of Tesla and SpaceX and owner of Twitter, has announced the launch of a new AI company called xAI.",
  ),
  NewsArticle(
    thumbnailUrl:
    'https://tds-images.thedailystar.net/sites/default/files/styles/very_big_201/public/images/2023/07/08/bmw_x1.jpg?itok=M5ibLmkV&timestamp=1688830818',
    title: 'Executive Motors brings BMW X1 to Bangladesh',
    description: "Executive Motors Limited, the authorised dealer of BMW vehicles in Bangladesh and a concern of Meghna Executive Holdings, has announced the launch of all-new BMW X1 for the Bangladesh market.",
  ),
  // Add more news articles here...
];
