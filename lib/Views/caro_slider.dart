import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouSlider extends StatefulWidget {
  const CarouSlider({super.key});

  @override
  State<CarouSlider> createState() => _CarouSliderState();
}

class _CarouSliderState extends State<CarouSlider> {
  final myitems = [
    Image.asset('lib/images/first.png'),
    Image.asset('lib/images/ict.png'),
    Image.asset('lib/images/hall.png'),
    Image.asset('lib/images/dighi.png'),
    Image.asset('lib/images/prottoy.png'),
  ];
  int myCorrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MBSTU Phone Book',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                height: 200,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(microseconds: 500),
                autoPlayInterval: const Duration(seconds: 3),
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    myCorrentIndex = index;
                  });
                }),
            items: myitems,
          ),
          AnimatedSmoothIndicator(
            activeIndex: myCorrentIndex,
            count: myitems.length,
            effect: WormEffect(
              dotColor: Colors.green,
              dotHeight: 12,
              dotWidth: 12,
              spacing: 15,
              activeDotColor: Colors.red,
              paintStyle: PaintingStyle.fill,
            ),
          ),

          SizedBox(height: 200), // Add spacing between the carousel and buttons
          ElevatedButton(
            onPressed: () {
              // Handle button 1 press
              Navigator.pushNamed(context, "/home");
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green, // White text color
            ),
            child: Text(
              'Find MBSTU Contacts',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}