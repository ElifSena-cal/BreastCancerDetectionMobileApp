import 'package:breast_cancer/features/data/view/train_view.dart';
import 'package:flutter/material.dart';

import '../model/data.dart';
import '../view_model/data_view_model.dart';

class DataEntryPage extends StatefulWidget {
  @override
  _DataEntryPageState createState() => _DataEntryPageState();
}

class _DataEntryPageState extends State<DataEntryPage> {
  Data data = Data();
  DataViewModel dataViewModel = DataViewModel();
  final Map<String, TextEditingController> controllers = {};

  List<String> featureNames = [];

  @override
  void initState() {
    featureNames = data.getFeatureNames();
    featureNames.remove('diagnosis');
    for (var featureName in featureNames) {
      controllers[featureName] = TextEditingController();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              for (var featureName in featureNames)
                Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: featureName,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      controller: controllers[featureName],
                    )),
              ElevatedButton(
                onPressed: () async {
                  // Kullanıcı verilerini toplama
                  Map<String, double> inputData = {};
                  for (var featureName in featureNames) {
                    double value = double.tryParse(
                            controllers[featureName]?.text ?? '0.0') ??
                        0.0;

                    inputData[featureName] = value;
                  }

                  String result = await dataViewModel.predict(inputData);

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Analysis Result'),
                        content: Text(result), // Sonucu burada gösteriyoruz
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Analyze'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
