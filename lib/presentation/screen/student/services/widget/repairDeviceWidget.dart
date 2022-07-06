import 'package:flutter/material.dart';

class RepairDeviceWidget extends StatelessWidget {
  const RepairDeviceWidget({
    Key? key,
    required this.isItem1Checked,
    required this.isItem2Checked,
    required this.isItem3Checked,
    required this.item1Fun,
    required this.item2Fun,
    required this.item3Fun,
    required this.item1Name,
    required this.item2Name,
    required this.item3Name,
    required this.item1Img,
    required this.item2Img,
    required this.item3Img
  }) : super(key: key);

  final bool isItem1Checked;
  final bool isItem2Checked;
  final bool isItem3Checked;

  final String item1Name;
  final String item2Name;
  final String item3Name;

  final String item1Img;
  final String item2Img;
  final String item3Img;

  final Function item1Fun;
 final  Function item2Fun;
  final Function item3Fun;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 18, right: 18),
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
                      children:  [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image(
                            image: AssetImage(item1Img),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(item1Name),
                      ],
                    ),
                    Checkbox(
                      value: isItem1Checked,
                      onChanged: (bool? value) {
                        item1Fun(value);
                          // isLightChecked = value!;
                       
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children:  [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image(
                            image: AssetImage(item2Img),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(item2Name),
                      ],
                    ),
                    Checkbox(
                      value: isItem2Checked,
                      onChanged: (bool? value) {
                        item2Fun(value);
                        // This is where we update the state when the checkbox is tapped
                        // setState(() {
                        //   isPlugChecked = value!;
                        // });
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children:  [
                        CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Image(
                              image: AssetImage(item3Img),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Text(item3Name),
                      ],
                    ),
                    Checkbox(
                      value: isItem3Checked,
                      onChanged: (bool? value) {
                        item3Fun(value);
                        // This is where we update the state when the checkbox is tapped
                        // setState(() {
                        //   isFanChecked = value!;
                        // });
                      },
                    )
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
                  "Select the repaire devices",
                  style: TextStyle(
                    backgroundColor: Colors.white,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}