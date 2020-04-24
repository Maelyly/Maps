import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

GoogleMapController _controller;

map(){
  getJsonFile("assents/mode.json").then(setMapStyle);

}
Future<String> getJsonFile(String path) async{
  return await rootBundle.loadString(path);
}

void setMapStyle(String mapStyle){
   _controller.setMapStyle(mapStyle);
} 

