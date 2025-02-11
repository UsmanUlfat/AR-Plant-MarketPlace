// ignore_for_file: sort_child_properties_last

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../utils/constants.dart';

class SetValuesForm extends StatefulWidget {
  @override
  _SetValuesFormState createState() => _SetValuesFormState();
}

class _SetValuesFormState extends State<SetValuesForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _maxTempController = TextEditingController();
  final TextEditingController _minTempController = TextEditingController();
  final TextEditingController _maxHumidityController = TextEditingController();
  final TextEditingController _minHumidityController = TextEditingController();
  final TextEditingController _maxSoilMoistureController =
      TextEditingController();
  final TextEditingController _minSoilMoistureController =
      TextEditingController();

  final DatabaseReference _database =
      FirebaseDatabase.instance.ref('Set_Values');

  @override
  void dispose() {
    _maxTempController.dispose();
    _minTempController.dispose();
    _maxHumidityController.dispose();
    _minHumidityController.dispose();
    _maxSoilMoistureController.dispose();
    _minSoilMoistureController.dispose();
    super.dispose();
  }

  InputDecoration _buildInputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      filled: true,
      fillColor: Colors.grey[200],
      contentPadding:
          const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
    );
  }

  void _saveValues() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Constants.primaryColor,
          content: const Center(
            child: Text(
              'Processing Data',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ),
      );

      // Save values to Firebase
      _database.set({
        'maxTemperature': _maxTempController.text,
        'minTemperature': _minTempController.text,
        'maxHumidity': _maxHumidityController.text,
        'minHumidity': _minHumidityController.text,
        'maxSoilMoisture': _maxSoilMoistureController.text,
        'minSoilMoisture': _minSoilMoistureController.text,
      }).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Constants.primaryColor,
            content: const Center(
              child: Text(
                'Data Saved Successfully',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ),
        );
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Center(
              child: Text(
                'Failed to Save Data',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ),
        );
      });

      if (kDebugMode) {
        print('Max Temperature: ${_maxTempController.text}');
        print('Min Temperature: ${_minTempController.text}');
        print('Max Humidity: ${_maxHumidityController.text}');
        print('Min Humidity: ${_minHumidityController.text}');
        print('Max Soil Moisture: ${_maxSoilMoistureController.text}');
        print('Min Soil Moisture: ${_minSoilMoistureController.text}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Set Values'),
      //   backgroundColor: Colors.teal,
      // ),
      body: SizedBox(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // AppBAr
            Positioned(
                top: 50,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Constants.primaryColor.withOpacity(.15),
                        ),
                        child: Icon(
                          Icons.close,
                          color: Constants.primaryColor,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        debugPrint('favorite');
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Constants.primaryColor.withOpacity(.15),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share,
                            color: Constants.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            // Form
            Positioned(
              top: 130,
              left: 20,
              right: 20,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Enter the values below',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _maxTempController,
                        decoration: _buildInputDecoration('Max Temperature'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Max Temperature';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _minTempController,
                        decoration: _buildInputDecoration('Min Temperature'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Min Temperature';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _maxHumidityController,
                        decoration: _buildInputDecoration('Max Humidity'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Max Humidity';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _minHumidityController,
                        decoration: _buildInputDecoration('Min Humidity'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Min Humidity';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _maxSoilMoistureController,
                        decoration: _buildInputDecoration('Max Soil Moisture'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Max Soil Moisture';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _minSoilMoistureController,
                        decoration: _buildInputDecoration('Min Soil Moisture'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Min Soil Moisture';
                          }
                          return null;
                        },
                      ),
                      // const Spacer(),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _saveValues,
                          child: const Text('Submit',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              )),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            backgroundColor: Constants.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
