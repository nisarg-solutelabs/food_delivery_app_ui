import 'package:flutter/material.dart';
import 'package:ui_1/screens/home_page.dart';

class RestaurantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage('assets/images/restaurant0.jpg'),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HeadingText(
                      data: 'Restaurant 1',
                    ),
                    Text('0.2 miles away'),
                  ],
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Row(
                    children: [
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Text('200 Main St, New York, NY'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      data: 'Reviews',
                    ),
                    CustomButton(
                      data: 'Contact',
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120.0),
                  child: HeadingText(
                    data: 'Menu',
                  ),
                ),
                Row(
                  children: [
                    ReceipeCard(),
                    ReceipeCard(),
                  ],
                ),
                Row(
                  children: [
                    ReceipeCard(),
                    ReceipeCard(),
                  ],
                ),
                Row(
                  children: [
                    ReceipeCard(),
                    ReceipeCard(),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
              left: 20.0,
              top: 40.0,
              child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  })),
          Positioned(
            right: 20.0,
            top: 40.0,
            child: Icon(
              Icons.favorite_outline,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class ReceipeCard extends StatelessWidget {
  const ReceipeCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Image(
            image: AssetImage(
              'assets/images/steak.jpg',
            ),
            height: 150.0,
            width: 150.0,
          ),
        ),
        Positioned(
          top: 35.0,
          left: 58.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ReceipeText(),
              ReceipeText(),
              CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ReceipeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Steak',
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w900, fontSize: 20.0),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String data;
  CustomButton({this.data});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.red,
      onPressed: () {},
      child: Text(
        data,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
