import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hw1/modules/exchangData.dart';
import 'package:hw1/modules/exchange_view_model.dart';
import 'package:hw1/services/Exchange_mock_services.dart';

class ExchangeView extends StatefulWidget {
  const ExchangeView({super.key});

  @override
  State<ExchangeView> createState() => _ExchangeViewState();
}

class _ExchangeViewState extends State<ExchangeView> {
  final ExchangeViewModel _viewModel = ExchangeViewModel();
  final formkey = GlobalKey<FormState>();
  var inputcontroller = TextEditingController();
  var cryptocontroller = TextEditingController();
  ExchangeData? variable;
  ExchangeData data = ExchangeData();
  String test = "";

  onSetstate(String x) {
    setState(() {
      test = x;
      //print(test);
    });
  }

  onSetP(temp, input) {
    setState(() {
      input = int.parse(input);
      price = temp * input!;
    });
  }

  @override
  double? price = 0.0;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
            key: formkey,
            child: Column(
              children: [
                FutureBuilder(
                  future: _viewModel.onService(
                    name: test,
                  ),
                  builder: (BuildContext context,
                      AsyncSnapshot<ExchangeData?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        height: 100,
                        color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "เป็นจำนวนเงิน",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            Text("$price บาท",
                                style: const TextStyle(
                                    fontSize: 24, color: Colors.white))
                          ],
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "crypto"),
                    autofocus: true,
                    validator: (str) {
                      if (str!.isEmpty) {
                        return "กรุณาป้อนข้อมูล";
                      }
                      return null;
                    },
                    controller: cryptocontroller,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    decoration:
                        const InputDecoration(labelText: "จำนวนที่ต้องการแลก"),
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    validator: (str) {
                      if (str!.isEmpty) {
                        return "กรุณาป้อนข้อมูล";
                      }
                      return null;
                    },
                    controller: inputcontroller,
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        onSetstate(cryptocontroller.text);
                        variable = await _viewModel.onService(
                            name: cryptocontroller.text);
                        //print(variable?.last);
                        onSetP(variable?.last, inputcontroller.text);
                      }
                    },
                    child: const Text("แลก")),
              ],
            )));
  }
}
