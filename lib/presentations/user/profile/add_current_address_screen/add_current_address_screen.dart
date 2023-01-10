import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/domain/address.dart';
import 'package:gestapo/domain/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

LatLng currentLocation = const LatLng(25.1193, 55.3773);

class AddCurrentAddressScreen extends StatefulWidget {
  const AddCurrentAddressScreen({super.key});

  @override
  State<AddCurrentAddressScreen> createState() =>
      _AddCurrentAddressScreenState();
}

class _AddCurrentAddressScreenState extends State<AddCurrentAddressScreen> {
  String mapTheme = '';
  late String lat;
  late String long;

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location service are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permission are dined');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permission are permently denied, We cannot request');
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
    );
  }

  void addMarker(String id, LatLng location) {
    var _marker = Marker(
      markerId: MarkerId(id),
      position: location,
    );
    makers[id] = _marker;
    setState(() {});
  }

  @override
  void initState() {
    getCurrentLocation();
    DefaultAssetBundle.of(context)
        .loadString('assets/mapTheme/night_theme.json')
        .then((value) {
      mapTheme = value;
    });
    super.initState();
  }

  late GoogleMapController mapController;
  Map<String, Marker> makers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Add New Address'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () async {
              Position pos = await getCurrentLocation();
              setState(() {
                currentLocation = LatLng(pos.latitude, pos.longitude);
              });
              addMarker('Me', currentLocation);
              List<Placemark> placemarks =
                  await placemarkFromCoordinates(pos.latitude, pos.longitude);
              log(placemarks.toString());
              String placename =
                  "${placemarks.first.street}, ${placemarks.first.subLocality}, ${placemarks.first.locality}, ${placemarks.first.postalCode}";
              addAddressBottomSheet(placename);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: currentLocation,
          zoom: 15,
        ),
        onMapCreated: (controller) {
          //   controller.setMapStyle(mapTheme);
          mapController = controller;
          mapController.setMapStyle(mapTheme);
          addMarker("Me", currentLocation);
        },
        markers: makers.values.toSet(),
      ),
    );
  }

  Future<void> addNewAddress({
    required String user,
    required String addressName,
    required String addressDetails,
  }) async {
    if (addressName.isEmpty) return;

    await Address.addNewAddress(
      user: user,
      addressName: addressName,
      addressDetails: addressDetails,
    );

    Utils.customSnackbar(
      context: context,
      text: 'Address addedd successfully',
      type: AnimatedSnackBarType.success,
    );
    Navigator.pop(context);
  }

  addAddressBottomSheet(String placeName) {
    return showModalBottomSheet(
      barrierColor: Colors.transparent,
      elevation: 0,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        final addressController = TextEditingController();
        final formKey = GlobalKey<FormState>();
        final user = FirebaseAuth.instance.currentUser!.email;

        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: const EdgeInsets.only(top: 2),
            decoration: const BoxDecoration(
              color: kSpecialGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 5,
                      width: 40,
                      decoration: BoxDecoration(
                        color: kSpecialGrey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    kHeight10,
                    const CommonHeading(text: 'Address Details'),
                    kHeight10,
                    kDividerGrey,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kHeight10,
                        const Text(
                          'Name Address',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        kHeight10,
                        Form(
                          key: formKey,
                          child: CustomTextField(
                            controller: addressController,
                            hintText: 'Address',
                            icon: Icons.location_on_outlined,
                            validator: (address) {
                              if (address != null && address.length < 4) {
                                return 'Enter proper address';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        kHeight10,
                        const Text(
                          'Address Details',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        kHeight10,
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: kLightGrey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            placeName,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        kHeight20,
                        SizedBox(
                          width: double.infinity,
                          child: CommonButton(
                            onPressed: () async {
                              if (!formKey.currentState!.validate()) return;
                              await addNewAddress(
                                user: user!,
                                addressName: addressController.text.trim(),
                                addressDetails: placeName,
                              );
                            },
                            buttonText: 'Add',
                            bgColor: kWhite,
                          ),
                        ),
                        kHeight20,
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
