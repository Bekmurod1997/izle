import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:izle/constants/fonts.dart';

class MyMaps extends StatefulWidget {
  const MyMaps({Key? key}) : super(key: key);

  @override
  _MyMapsState createState() => _MyMapsState();
}

class _MyMapsState extends State<MyMaps> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(41.26465, 69.21627),
    zoom: 11.5,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/l5.svg'),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'г.Ташкент',
                          style: FontStyles.boldStyle(
                              fontSize: 14, fontFamily: 'Lato'),
                        ),
                        Text(
                          'Шайхантахурский район',
                          style: FontStyles.mediumStyle(
                              fontSize: 14, fontFamily: 'Lato'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 150,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      zoomControlsEnabled: false,
                      initialCameraPosition: _initialCameraPosition,
                      markers: {
                        Marker(
                          markerId: MarkerId('current'),
                          position: LatLng(41.26465, 69.21627),
                        ),
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Опубликовано 23 июля 2021 г.',
                  style: FontStyles.semiBoldStyle(
                      fontSize: 10,
                      fontFamily: 'Lato',
                      color: Color(0xff616161)),
                ),
                Text(
                  'ID: 12345678',
                  style: FontStyles.semiBoldStyle(
                      fontSize: 10,
                      fontFamily: 'Lato',
                      color: Color(0xff616161)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
