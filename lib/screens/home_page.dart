import 'package:flutter/material.dart';
import 'package:ui_1/data/data.dart';
import 'package:ui_1/models/order.dart';
import 'package:ui_1/screens/cart_screen.dart';
import 'package:ui_1/screens/restaurant_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.account_circle,
          size: 30.0,
        ),
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
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                        width: 0.8, color: Theme.of(context).primaryColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(width: 0.8),
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
            RecentOrderCard(),
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
      child: Container(
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/restaurant0.jpg'),
                    //height: 200.0,
                    width: 150.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Restaurant 0',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Row(
                  children: [
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                  ],
                ),
                SizedBox(
                  height: 2.0,
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

class HeadingText extends StatelessWidget {
  final String data;
  HeadingText({this.data});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        data,
        style: TextStyle(
            fontSize: 24.0, fontWeight: FontWeight.w600, letterSpacing: 1.2),
      ),
    );
  }
}

class RecentOrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 10.0),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: currentUser.cart.length,
        itemBuilder: (BuildContext context, int index) {
          Order order = currentUser.orders[index];
          return BuildRecentOrder(
            order: order,
          );
        },
      ),
    );
  }
}

class BuildRecentOrder extends StatelessWidget {
  final Order order;
  BuildRecentOrder({this.order});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 320.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          width: 1.0,
          color: Colors.grey[200],
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image(
              height: 100.0,
              width: 100.0,
              image: AssetImage(
                order.food.imageUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.food.name,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                order.restaurant.name,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                order.date,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 45.0,
          ),
          CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(
              Icons.add,
              size: 30.0,
            ),
          )
        ],
      ),
    );
  }
}
