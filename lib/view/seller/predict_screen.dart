// ignore_for_file: library_private_types_in_public_api, unnecessary_null_comparison, deprecated_member_use, unused_element, unused_field, prefer_final_fields, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:ar_base_plant_app/utils/constants.dart';
import 'package:ar_base_plant_app/view/seller/set_values.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PredictScreen extends StatefulWidget {
  @override
  _PredictScreenState createState() => _PredictScreenState();
}

class _PredictScreenState extends State<PredictScreen> {
  final DatabaseReference _houseInfosDatabase =
      FirebaseDatabase.instance.ref('HouseInfos');
  final DatabaseReference _setValuesDatabase =
      FirebaseDatabase.instance.ref('Set_Values');
  double? _Soil;
  double? _humidity;
  double? _temperature;
  double? _maxHumidity;
  double? _maxTemperature;
  double? _minHumidity;
  double? _minTemperature;
  double? _minSoil;
  double? _maxSoil;
  bool _isLoading = true;
  bool _isLoading2 = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
    _fetchSetValues();
  }

  void _fetchData() {
    _houseInfosDatabase.once().then((DatabaseEvent event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>;
      setState(() {
        _humidity = double.tryParse(data['humidity'].toString());
        _temperature = double.tryParse(data['temp'].toString());
        _Soil = double.tryParse(data['Soil'].toString());
      });
    }).catchError((error) {
      if (kDebugMode) {
        print('Error fetching data: $error');
      }
    }).whenComplete(() {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void _fetchSetValues() {
    _setValuesDatabase.once().then((DatabaseEvent event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>;
      setState(() {
        _maxHumidity = double.tryParse(data['maxHumidity'].toString());
        _minHumidity = double.tryParse(data['minHumidity'].toString());
        _maxTemperature = double.tryParse(data['maxTemperature'].toString());
        _minTemperature = double.tryParse(data['minTemperature'].toString());
        _maxSoil = double.tryParse(data['maxSoil'].toString());
        _minSoil = double.tryParse(data['minSoil'].toString());
      });
    }).catchError((error) {
      if (kDebugMode) {
        print('Error fetching set values: $error');
      }
    });
  }

  void _performPrediction() {
    if (_humidity == null ||
        _temperature == null ||
        _Soil == null ||
        _maxHumidity == null ||
        _minTemperature == null ||
        _maxTemperature == null ||
        _minSoil == null ||
        _maxSoil == null ||
        _minHumidity == null) {
      return;
    }

    String message;
    // For Humidity
    if (_humidity! > _maxHumidity!) {
      message = 'Humidity is out of range!';
      if (kDebugMode) {
        print("$_humidity! > $_maxHumidity!");
      }
    } else if (_humidity! < _minHumidity!) {
      message = 'Humidity is out of bellow!';
      if (kDebugMode) {
        print("$_humidity! < $_minHumidity!");
      }
    } else {
      message = 'Values are Normal!';
    }
    // For Temperature
    if (_temperature! < _maxTemperature! || _temperature! < _minTemperature!) {
      message = 'Temperature in normal range!';
      if (kDebugMode) {
        print(
          "$_temperature! > $_maxTemperature! || $_temperature! < $_minTemperature!");
      }
     } else {
       message = 'Values are out of Range!';
     }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Determine icon and background color based on message
        IconData iconData = Icons.info; // Default icon
        Color backgroundColor = Colors.white; // Default background color
        if (message == 'Humidity is out of range!') {
          iconData = Icons.error_outline;
          backgroundColor = Colors.redAccent;
        } else if (message == 'Humidity is out of bellow!') {
          iconData = Icons.info_outline;
          backgroundColor = Colors.redAccent;
        } else if (message == 'Values are Normal!') {
          iconData = Icons.check_circle;
          backgroundColor = Colors.greenAccent;
        }

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 24.0),
                Icon(
                  iconData,
                  color: Colors.white,
                  size: 50.0,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Prediction Result',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: const Text(
          'House Info',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                strokeWidth: 5.0,
                strokeCap: StrokeCap.round,
                color: Colors.white,
                backgroundColor: Constants.primaryColor,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InfoCard(
                    icon: FontAwesomeIcons.tint,
                    label: 'Humidity',
                    value: '${_humidity ?? 0}%',
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 20),
                  InfoCard(
                    icon: FontAwesomeIcons.thermometerHalf,
                    label: 'Temperature',
                    value: '${_temperature ?? 0}°C',
                    color: Colors.red,
                  ),
                  const SizedBox(height: 20),
                  InfoCard(
                    icon: FontAwesomeIcons.water,
                    label: 'Soil Moisture',
                    value: '${_Soil ?? 0}°C',
                    color: Colors.blueAccent,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isLoading2 = true;
                            });
                            _fetchSetValues();
                            _performPrediction();
                            setState(() {
                              _isLoading2 = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            backgroundColor: Constants.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: _isLoading2
                              ? CircularProgressIndicator(
                                  strokeWidth: 5.0,
                                  color: Colors.greenAccent,
                                  strokeCap: StrokeCap.round,
                                  backgroundColor: Constants.whiteColor,
                                )
                              : const Text(
                                  'Predict',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SetValuesForm(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            backgroundColor: Constants.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: const Text(
                            'Set Values',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const InfoCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 30),
                const SizedBox(width: 10),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
