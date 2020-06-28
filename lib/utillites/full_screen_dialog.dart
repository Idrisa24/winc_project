import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class AddEntryDialog extends StatefulWidget {
  AddEntryDialog({Key key}) : super(key: key);
  @override
  AddEntryDialogState createState() => new AddEntryDialogState();
}

class AddEntryDialogState extends State<AddEntryDialog> {
  var _dialogFormKey = GlobalKey<FormState>();
  double _minumumMargin = 5.0;
  double _minumumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.teal,
      appBar: new AppBar(
        backgroundColor: Colors.teal,
        elevation: 0.3,
        title: const Text('New product'),
        actions: [
          new FlatButton(
              onPressed: () {},
              child: new Text('SAVE',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.white))),
        ],
      ),
      body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: Card(
                child: Form(
                  key: _dialogFormKey,
                  child: Container(
                    padding: EdgeInsets.all(_minumumPadding),
                    margin: EdgeInsets.only(
                        top: _minumumMargin, bottom: _minumumMargin),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Product Title',
                            hintText: 'Enter product title',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          maxLength: 150,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            hintText: 'Enter product description',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Padding(
                          padding: EdgeInsets.all(_minumumPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    MoneyInputFormatter(
                                        leadingSymbol: 'Tz',
                                        useSymbolPadding: true,
                                        mantissaLength: 2),
                                  ],
                                  decoration: InputDecoration(
                                    labelText: 'Price',
                                    hintText: 'Product Price',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Quantity',
                                    hintText: 'Product Qnt',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
