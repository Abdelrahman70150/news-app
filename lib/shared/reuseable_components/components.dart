import 'package:flutter/material.dart';

class BuildArticleWidget extends StatelessWidget {
dynamic article;
String nullImage;
BuildArticleWidget({required this.article, required this.nullImage});
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
           article["urlToImage"]==null ? nullImage : "${article["urlToImage"]}"
            ,fit: BoxFit.cover,),
          SizedBox(height: 10,),
          Text(
            article["author"] ==null ? '' : "${article["author"]}",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            "${article['title']}",
            style:Theme.of(context).textTheme.bodyMedium),
          Text(
            '${article["publishedAt"].toString().substring(0,10)}',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.end,
          ),

        ],
      ),
    );
  }
}
