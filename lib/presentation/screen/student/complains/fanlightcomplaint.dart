import 'package:flutter/material.dart';

class FanLightComplaints extends StatefulWidget {
  const FanLightComplaints({Key? key}) : super(key: key);

  @override
  State<FanLightComplaints> createState() => _FanLightComplaintsState();
}

class _FanLightComplaintsState extends State<FanLightComplaints> {
  Map<String, bool> values = {};
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Room"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 18.0, left: 18, right: 18),
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: const [
                                CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: Image(
                                      image:
                                          AssetImage("assets/images/light.png"),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("Light"),
                              ],
                            ),
                            Checkbox(
                                value: isChecked,
                                onChanged: (bool? value) {
                                  // This is where we update the state when the checkbox is tapped
                                  setState(() {
                                    isChecked = value!;
                                  });
                                })
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: const [
                                CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: Image(
                                      image:
                                          AssetImage("assets/images/plug.png"),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("Plug"),
                              ],
                            ),
                            Checkbox(
                                value: isChecked,
                                onChanged: (bool? value) {
                                  // This is where we update the state when the checkbox is tapped
                                  setState(() {
                                    isChecked = value!;
                                  });
                                })
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: const [
                                CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: Image(
                                      image:
                                          AssetImage("assets/images/fan.png"),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("Fan"),
                              ],
                            ),
                            Checkbox(
                                value: isChecked,
                                onChanged: (bool? value) {
                                  // This is where we update the state when the checkbox is tapped
                                  setState(() {
                                    isChecked = value!;
                                  });
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 10),
                        child: Text(
                          "Select the repaired devices",
                          style: TextStyle(
                              backgroundColor: Colors.white,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 18, right: 18, bottom: 50),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Complaint ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(":"),
                          Text(
                            " Fan, Light",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              hintText: "Type your complaint here...... 🖍",
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(10))),
                          maxLines: 8,
                          keyboardType: TextInputType.multiline,
                          maxLength: 1000,
                          cursorColor: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 22,
                child: FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.done,
                      size: 30,
                      color: Colors.white,
                    )),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
