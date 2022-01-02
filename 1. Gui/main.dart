import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GuiDisplay(),
    theme: ThemeData(
      primarySwatch: Colors.cyan,
    ),
  ));
}


class GuiDisplay extends StatefulWidget {
  const GuiDisplay({Key? key}) : super(key: key);

  @override
  State<GuiDisplay> createState() => _GuiDisplayState();
}

class _GuiDisplayState extends State<GuiDisplay> {

  TextEditingController field1 = TextEditingController();
  TextEditingController field2 = TextEditingController();
  TextEditingController field3 = TextEditingController();
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill generator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                 const Expanded(
                   flex: 5,
                   child: Text('Strawberry Quick (Rs.50) '),
                 ),
                 Expanded(
                   flex: 3,
                   child: TextField(
                     controller: field1,
                     keyboardType: TextInputType.number,
                     decoration: const InputDecoration(hintText: "Enter Quantity",),
                   ),
                 ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 5,
                    child: Text('Cold Coffee (Rs.40) '),
                  ),
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: field2,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(hintText: "Enter Quantity",),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 5,
                    child: Text('Hazelnut Chocolate Shake (Rs.30) '),
                  ),
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: field3,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(hintText: "Enter Quantity",),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      total = int.parse(field1.text)*50 + int.parse(field2.text)*40 + int.parse(field3.text)*30;
                    });
                  },
                  child: const Text('Calculate Total amount'),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(60.0,0,0,0),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 8,
                      child: Text(
                        'Total amount to be paid : ',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        '$total',
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
