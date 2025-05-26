import 'package:fien/features/user/map/views/widgets/map_body.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapScreen extends StatefulWidget {
  final String cityName;

  const MapScreen({Key? key, required this.cityName}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late Future<LatLng> _cityCoordinates;

  @override
  void initState() {
    super.initState();
    _cityCoordinates = _fetchCityCoordinates(widget.cityName);
  }

  Future<LatLng> _fetchCityCoordinates(String cityName) async {
    try {
      final locations = await locationFromAddress(cityName);
      if (locations.isNotEmpty) {
        final loc = locations.first;
        return LatLng(loc.latitude, loc.longitude);
      } else {
        throw Exception("No locations found for $cityName");
      }
    } catch (e) {
      throw Exception("Error fetching location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.cityName)),
      body: MapBody(
        cityName: widget.cityName,
        cityCoordinatesFuture: _cityCoordinates,
      ),
    );
  }
}


