import 'dart:ui';

import 'package:book_app/book.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  //  1. siapin data yang mau dikirim
  final Book book;

// 2. tambahin di constructor
  const DetailPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Detail",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(book.image), fit: BoxFit.cover)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Center(
                child: Image.asset(
                  book.image,
                  width: 130,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                book.name,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              infoBook(book.rate.toString(), "Rating"),
              infoBook(book.page.toString(), "Page"),
              infoBook(book.language.toString(), "Language"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(book.description),
          )
        ],
      ),
    );
  }

  Column infoBook(String valuebook, String bookType) {
    return Column(
      children: [
        Text(
          valuebook,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Text(
          bookType,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
