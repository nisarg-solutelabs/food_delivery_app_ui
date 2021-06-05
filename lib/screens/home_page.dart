import 'package:flutter/material.dart';
import 'package:ui_1/data/data.dart';
import 'package:ui_1/screens/cart_screen.dart';
import 'package:ui_1/screens/restaurant_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Icon(Icons.account_circle),
        title: Text('Food Delivery'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ));
              },
              child: Text(
                'Cart(${currentUser.cart.length})',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: 'Search Food or Restaurants',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.close),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            HeadingText(
              data: 'Recent Orders',
            ),
            SizedBox(
              height: 10.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  RecentOrderCard(),
                  RecentOrderCard(),
                  RecentOrderCard(),
                  RecentOrderCard(),
                  RecentOrderCard(),
                  RecentOrderCard(),
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            HeadingText(
              data: 'Nearby Restaurants',
            ),
            SizedBox(
              height: 10.0,
            ),
            RestaurantCard(),
            RestaurantCard(),
            RestaurantCard(),
            RestaurantCard(),
            RestaurantCard(),
          ],
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RestaurantScreen(),
                    ),
                  );
                },
                child: Image(
                  image: AssetImage('assets/images/restaurant0.jpg'),
                  height: 200.0,
                  width: 150.0,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  'Restaurant 0',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                  ],
                ),
                Text('200 Main St,New'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RecentOrderCard extends StatelessWidget {
  const RecentOrderCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                height: 150.0,
                width: 120.0,
                image: AssetImage('assets/images/steak.jpg'),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Steak',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text('Restaurant 2'),
                SizedBox(
                  height: 5.0,
                ),
                Text('Nov 10,2019'),
              ],
            ),
            SizedBox(
              width: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  final String data;
  HeadingText({this.data});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        data,
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
