import 'package:book_app/book.dart';
import 'package:book_app/detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BANNER
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Upgrade your skill \nUpgrade your life",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Image.asset(
                      "images/banner.png",
                      width: 100,
                    ),
                  ],
                ),
              ),

              // TEXT BOOK
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Text(
                  "Books",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),

              // LIST BOOK

              buildListBook(context)
            ],
          ),
        ),
      ),
    );
  }

  // LIFO (Last In FIrst Out);

  Widget buildListBook(BuildContext context) {
    return ListView.builder(
      itemCount: listBook.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Book book = listBook[index];
        return GestureDetector(
          onTap: () {
            final detailPageRoute = MaterialPageRoute(
                builder: (context) => DetailPage(
                      book: book,
                    ));
            Navigator.push(context, detailPageRoute);
          },
          child: Container(
            width: double.infinity,
            height: 90,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.1),
                    blurRadius: 6.0,
                  ),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  book.image,
                  width: 64,
                  height: 64,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      book.categoryBook,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
