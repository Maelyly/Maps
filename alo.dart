import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';


class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}
GoogleMapController _controller;
Completer<GoogleMapController> controlador;

map(){
  getJsonFile("assents/mode.json").then(setMapStyle);

}
Future<String> getJsonFile(String path) async{
  return await rootBundle.loadString(path);
}

void setMapStyle(String mapStyle){
  _controller.setMapStyle(mapStyle);
} 


class HomePageState extends State<HomePage> {


  
  @override
  void initState() {
    createMarker(context);
    super.initState();
  }
    double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.access_alarm),
            onPressed: () {
              //
            }),
        title: Text("New York"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                //
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          _buildContainer(),
        ],
      ),
    );
  }

 Widget _zoomminusfunction() {

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
            icon: Icon(Icons.search,color:Color(0xff6200ee)),
            onPressed: () {
              zoomVal--;
             _minus( zoomVal);
            }),
    );
 }
 Widget _zoomplusfunction() {
   
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
            icon: Icon(Icons.search,color:Color(0xff6200ee)),
            onPressed: () {
              zoomVal++;
              _plus(zoomVal);
            }),
    );
 }

 Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await controlador.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await controlador.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }

  
  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
                  40.738380, -73.988426,"Gramercy Tavern"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
                  40.761421, -73.981667,"Le Bernardin"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                  40.732128, -73.999619,"Blue Hill"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String restaurantName) {
    return  GestureDetector(
        onTap: () {
          _gotoLocation(lat,long);
        },
        child:Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 180,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(_image),
                            ),
                          ),),
                          Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: myDetailsContainer1(restaurantName),
                          ),
                        ),

                      ],)
                ),
              ),
            ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(restaurantName,
            style: TextStyle(
                color: Color(0xff6200ee),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height:5.0),
        Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "4.1",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
              Container(
                child: Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
               Container(
                  child: Text(
                "(946)",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
            ],
          )),
          SizedBox(height:5.0),
        Container(
                  child: Text(
                "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
              SizedBox(height:5.0),
        Container(
            child: Text(
          "Closed \u00B7 Opens 17:00 Thu",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(40.712776, -74.005974), zoom: 12),
        onMapCreated: ( _controller) {
          controlador.complete(_controller);
        },
        markers: {
          name1,name2,name3,name4,acimaDaMedia,estaNaMedia,abaixoDaMedia
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat,double long) async {
     _controller = await controlador.future;
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }
}

Marker acimaDaMedia = Marker(
  markerId: MarkerId('Acima da media'),
  position: LatLng(40.738380, -73.988426),
  infoWindow: InfoWindow(title: 'Alunos acima da media'),
  icon: customIcon2
);

Marker estaNaMedia = Marker(
  markerId: MarkerId('Na media'),
  position: LatLng(40.761421, -73.981667),
  infoWindow: InfoWindow(title: 'Alunos na media'),
  icon: customIcon
);
Marker abaixoDaMedia = Marker(
  markerId: MarkerId('Abaixo da media'),
  position: LatLng(40.732128, -73.999619),
  infoWindow: InfoWindow(title: 'Alunos abaixo da media'),
  icon: customIcon3
);

///////////////////////////////////////////////////////////////////

BitmapDescriptor customIcon;
BitmapDescriptor customIcon2;
BitmapDescriptor customIcon3;
Set<Marker> markers;

createMarker(context) {
    if (customIcon == null) {
      ImageConfiguration configuration = createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(configuration, 'imagem/namedia.png').then((icon) {
        customIcon = icon;
      });
    }
    if (customIcon2 == null) {
      ImageConfiguration configuration2 = createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(configuration2, 'imagem/acima.png').then((icon2) {
        customIcon2 = icon2;
      });
    }
    if (customIcon3 == null) {
      ImageConfiguration configuration2 = createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(configuration2, 'imagem/baixo.png').then((icon3) {
        customIcon3 = icon3;
      });
    }
  }

List<Marker> naMedia = List<Marker>();
List<Marker> naBaixo = List<Marker>();
List<Marker> naAcima = List<Marker>();


Marker name1 = Marker(
  markerId: MarkerId('naMedia1'),
  position: LatLng(41.743551, -74.335959),
  infoWindow: InfoWindow(title: 'Aluno 1'),
  icon: customIcon2
);
Marker name2 = Marker(
  markerId: MarkerId('naMedia2'),
  position: LatLng(30.742451, -72.005959),
  infoWindow: InfoWindow(title: 'Aluno 2'),
  icon: customIcon2
);

Marker name3 = Marker(
  markerId: MarkerId('naMedia3'),
  position: LatLng(30.742451, -73.005959),
  infoWindow: InfoWindow(title: 'Aluno 3'),
  icon: customIcon2
);

Marker name4 = Marker(
  markerId: MarkerId('naMedia4'),
  position: LatLng(40.750451, -74.005459),
  infoWindow: InfoWindow(title: 'Aluno 4'),
  icon: customIcon2
);

Marker name5 = Marker(
  markerId: MarkerId('abaixoDaMedia1'),
  position: LatLng(40.702451, -74.005859),
  infoWindow: InfoWindow(title: 'Aluno 4'),
  icon: customIcon2
);

Marker name6 = Marker(
  markerId: MarkerId('abaixoDaMedia2'),
  position: LatLng(40.742451, -74.005959),
  infoWindow: InfoWindow(title: 'Aluno 6'),
  icon: customIcon3
);

Marker name7 = Marker(
  markerId: MarkerId('abaixoDaMedia3'),
  position: LatLng(40.745578, -74.006060),
  infoWindow: InfoWindow(title: 'Aluno 7'),
  icon: customIcon3
);


///////////////////////////////////////////////////

