import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../env/global_variables.dart';

class NewsSlider extends StatefulWidget {
  @override
  _NewsSliderState createState() => _NewsSliderState();
}

class _NewsSliderState extends State<NewsSlider> {
  List<dynamic> news = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      final response = await http.get(Uri.parse(SportsapiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          news = data["results"].take(10).toList(); // Get first 5 articles
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = "Failed to load news";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "Something went wrong!";
        isLoading = false;
      });
    }
  }

  void _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    if (errorMessage != null) {
      return Center(child: Text(errorMessage!));
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: 150.0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: news.map((article) {
        return GestureDetector(
          onTap: () => _launchURL(article["link"]),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: article["image_url"] != null
                        ? NetworkImage(article["image_url"])
                        : AssetImage("assets/no_image.png") as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                  ),
                ),
                padding: EdgeInsets.all(12),
                alignment: Alignment.bottomLeft,
                child: Text(
                  article["title"],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
