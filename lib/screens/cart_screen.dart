import 'package:flutter/material.dart';
import 'package:ui_1/data/data.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('Cart(${currentUser.cart.length})'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CardReceipeCard(),
            Divider(),
            CardReceipeCard(),
            Divider(),
            CardReceipeCard(),
            Divider(),
            CardReceipeCard(),
            Divider(),
            CardReceipeCard(),
            Divider(),
            TextList(
              first: 'Estimated Delivery Time:',
              second: '25 min',
            ),
            SizedBox(height: 10.0),
            TextList(
              first: 'Total Cost',
              second: 'Rs 105.81',
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              height: 70.0,
              width: double.infinity,
              color: Colors.red,
              child: Center(
                child: Text(
                  'CHECKOUT',
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextList extends StatelessWidget {
  final String first;
  final String second;
  TextList({
    this.first,
    this.second,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            first,
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            second,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}

class CardReceipeCard extends StatelessWidget {
  const CardReceipeCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 130.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/steak.jpg'),
                height: 200.0,
                width: 150.0,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Salmon Salad',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 15.0,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'Restaurant 3',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(width: 0.7, color: Colors.black)),
                width: 80.0,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        '-',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      '1',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 20.0),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      '+',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          width: 10.0,
        ),
        Text('Rs 12.99'),
      ],
    );
  }
}
