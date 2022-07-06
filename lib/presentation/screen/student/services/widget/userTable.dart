import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/userData_model.dart';

class UserTable extends StatelessWidget {
  const UserTable({
    Key? key,
    required this.tablepadding,
    required this.userData,
    required this.now,
  }) : super(key: key);

  final EdgeInsets tablepadding;
  final Iterable<UserData>? userData;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromARGB(183, 235, 237, 237),
          ),
          child: Table(
            // defaultColumnWidth: FixedColumnWidth(120.0),
            columnWidths: const {
              0: FixedColumnWidth(120),
              1: FlexColumnWidth(),
            },
            border: TableBorder.all(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 1),
            children: [
              TableRow(children: [
                Padding(
                  padding: tablepadding,
                  child: Column(children: const [
                    Center(
                      child: Text(
                        'Name',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ]),
                ),
                Padding(
                  padding: tablepadding,
                  child: Column(children: [
                    Text(
                      userData!.first.firstName +
                          ' ' +
                          userData!.first.lastName,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )
                  ]),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: tablepadding,
                  child: Column(children: const [
                    Text(
                      'Room No.',
                      style: TextStyle(fontSize: 18),
                    )
                  ]),
                ),
                Padding(
                  padding: tablepadding,
                  child: Column(children: [
                    Text(
                      userData!.first.roomNo,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )
                  ]),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: tablepadding,
                  child: Column(children: const [
                    Text(
                      'Date',
                      style: TextStyle(fontSize: 18),
                    )
                  ]),
                ),
                Padding(
                  padding: tablepadding,
                  child: Column(children: [
                    Text(
                      DateTime(now.year, now.month, now.day)
                          .toString()
                          .replaceAll("00:00:00.000", ""),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )
                  ]),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}