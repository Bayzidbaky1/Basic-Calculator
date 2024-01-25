import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  int _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Basic Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Form(
              key: _fromKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 14, right: 14, top: 20, bottom: 14),
                    child: TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Field can't be empty";
                        }
                        return null;
                      },
                      controller: _firstController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Number One",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 14, right: 14, bottom: 14),
                    child: TextFormField(
                      validator: (String? val) {
                        var value = val ?? " ";
                        if (value.isEmpty) {
                          return "Field Can't be Empty";
                        }
                        return null;
                      },
                      controller: _secondController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Number Two",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              if (_fromKey.currentState!.validate()) {
                                int number1 = int.parse(_firstController.text);
                                int number2 = int.parse(_secondController.text);
                                int result = add(number1, number2);
                                _result = result;
                                setState(() {});
                              }
                            },
                            child: const Text("Add")),
                        ElevatedButton(
                            onPressed: () {
                              if (_fromKey.currentState!.validate()) {
                                int number1 = int.parse(_firstController.text);
                                int number2 = int.parse(_secondController.text);
                                int result = sub(number1, number2);
                                _result = result;
                                setState(() {});
                              }
                            },
                            child: const Text("Sub")),
                        ElevatedButton(
                            onPressed: () {
                              clear();
                            },
                            child: const Text("Clear")),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Result : $_result",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  add(int number1, int number2) {
    return number1 + number2;
  }

  sub(int number1, int number2) {
    return number1 - number2;
  }

  clear() {
    _firstController.clear();
    _secondController.clear();
    _result = 0;
    setState(() {});
  }
}
