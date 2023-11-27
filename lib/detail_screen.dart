import 'package:first_project/Model/tourism_place.dart';
import 'package:flutter/material.dart';


var InformationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget{
  final TourismPlace place;

  const DetailScreen({Key? key, required this.place}) : super (key: key);


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
          Stack (
            children: <Widget>[
              Image.asset(place.imageAsset),
              SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const FavoriteButton(),
                      ],
                    )
                ),
              ),
            ],
          ),
            Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Text (
                  place.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Staatliches',
                  ),
                )
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      SizedBox(height: 8.0),
                      Text(
                          place.openDays,
                          style: InformationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.access_time_outlined),
                      SizedBox(height: 8.0),
                      Text(
                        place.openTime,
                        style: InformationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      SizedBox(height: 8.0),
                      Text(
                          place.ticketPrice,
                          style: InformationTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding:EdgeInsets.all(16.0) ,
              child: Text(
              place.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:place.imageUrls.map((url) {
                  return Padding(padding : const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(url),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButton createState() => _FavoriteButton();
}

class _FavoriteButton extends State<FavoriteButton>{
  bool IsFavorite = false;

  @override
  Widget build(BuildContext context){
    return IconButton(
      icon: Icon(
        IsFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: (){
        setState(() {
          IsFavorite = !IsFavorite;
        });
      },
    );
  }
}