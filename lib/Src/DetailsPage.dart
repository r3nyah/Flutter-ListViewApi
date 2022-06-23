import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class detailsPage extends StatelessWidget {
  final String id,url,author;
  final int width,height;
  const detailsPage({
    Key? key,
    required this.url,
    required this.height,
    required this.width,
    required this.author,
    required this.id
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Page'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 250,
              width: 250,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'ID: '+id,
                    style: const TextStyle(
                      color: Colors.white
                    ),
                  ),
                  Text(
                    'Author: '+author,
                    style: const TextStyle(
                      color: Colors.white
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Width: '+width.toString(),
                        style: const TextStyle(
                          color: Colors.white
                        ),
                      ),
                      Text(
                        'Height: '+height.toString(),
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Linkify(
                 onOpen: _onOpen,
                 textScaleFactor: 2,
                 text: 'Photo Url: '+url,
               ),
                //child: Image.network(url,width: 100,height: 100,),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url,forceWebView: true);
    } else {
      throw 'Could not launch $link';
    }
  }
}
