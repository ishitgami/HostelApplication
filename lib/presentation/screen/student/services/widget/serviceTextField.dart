import 'package:flutter/material.dart';

class ServiceTextField extends StatelessWidget {
  const ServiceTextField({
    Key? key,
    required this.onServiceDecChange,
  }) : super(key: key);

  final Function onServiceDecChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextFormField(
        onChanged: ((value) {
          onServiceDecChange(value);
          // 
        }
            ),
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.grey)),
            hintText:
                "Type about repair devices here...... 🖍",
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
                borderRadius:
                    BorderRadius.circular(10))),
        maxLines: 5,
        keyboardType: TextInputType.multiline,
        maxLength: 1000,
        cursorColor: Colors.black,
      ),
    );
  }
}