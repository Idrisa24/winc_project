import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:winc_project/utillites/constants.dart';

class BusinessScreen extends StatefulWidget {
  BusinessScreen({Key key}) : super(key: key);

  @override
  _BusinessScreenState createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  var _formKey = GlobalKey<FormState>();
  final double _minimumPadding = 5.0;
  PhoneCountryData _countryData;

  void _onCountrySelected(PhoneCountryData countryData) {
    setState(() {
      _countryData = countryData;
    });
  }

  @override
  void dispose() {
    _businessPhoneController?.dispose();
    super.dispose();
  }

  Widget _getText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Text(text),
    );
  }

  TextEditingController _businessNameController = TextEditingController();
  TextEditingController _businessPhoneController = TextEditingController();
  TextEditingController _businessAddressController = TextEditingController();
  TextEditingController _businessDescriptionController =
      TextEditingController();
  TextEditingController _businessServiceNameController =
      TextEditingController();
  TextEditingController _businessProfessioController = TextEditingController();
  TextEditingController _businessEmailController = TextEditingController();

  Widget _saveButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {},
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Save',
          style: TextStyle(
            color: Color(0xFF26A69A),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: _minimumPadding,
                    bottom: _minimumPadding,
                  ),
                  child: TextFormField(
                    controller: _businessNameController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter your business name';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter a business name',
                      labelText: 'Business name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: _minimumPadding,
                    bottom: _minimumPadding,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    maxLength: 16,
                    inputFormatters: [
                      PhoneInputFormatter(onCountrySelected: _onCountrySelected)
                    ],
                    controller: _businessPhoneController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter your business phone number';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter a business phone number',
                      labelText: 'Business phone number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                _getText(_countryData == null
                    ? 'A country is not detected'
                    : 'The country is: ${_countryData.country}'),
                Padding(
                  padding: EdgeInsets.only(
                    top: _minimumPadding,
                    bottom: _minimumPadding,
                  ),
                  child: TextFormField(
                    controller: _businessAddressController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter your business address';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter a business physical address',
                      labelText: 'Physical address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: _minimumPadding,
                    bottom: _minimumPadding,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _businessEmailController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter your business email';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter a business email',
                      labelText: 'Business email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: _minimumPadding,
                    bottom: _minimumPadding,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    maxLength: 150,
                    controller: _businessDescriptionController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter a short description';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter a short description about your business',
                      labelText: 'Business description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: _minimumPadding,
                    bottom: _minimumPadding,
                  ),
                  child: TextFormField(
                    controller: _businessNameController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter your business name';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter a business name',
                      labelText: 'Business name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: _minimumPadding,
                    bottom: _minimumPadding,
                  ),
                  child: TextFormField(
                    controller: _businessNameController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter your business name';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter a business name',
                      labelText: 'Business name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                _saveButton()
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
