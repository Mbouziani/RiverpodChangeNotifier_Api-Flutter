import 'package:demo_riverpod_api/Controler/data_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardItem extends StatelessWidget {
  final int index;

  const CardItem({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final data = ref.read(DataFuture);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    spreadRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: [
                CardRow(
                    Title: 'Name:',
                    description: data.user[index].name.toString()),
                CardRow(
                    Title: 'Username:',
                    description: data.user[index].username.toString()),
                CardRow(
                    Title: 'Email:',
                    description: data.user[index].email.toString()),
                CardRow(
                    Title: 'Street:',
                    description: data.user[index].address!.street.toString()),
                CardRow(
                    Title: 'Suite:',
                    description: data.user[index].address!.suite.toString()),
                CardRow(
                    Title: 'City:',
                    description: data.user[index].address!.city.toString()),
                CardRow(
                    Title: 'ZipeCode',
                    description: data.user[index].address!.zipcode.toString()),
                CardRow(
                    Title: 'Phone :',
                    description: data.user[index].phone.toString()),
                CardRow(
                    Title: 'Website :',
                    description: data.user[index].website.toString()),
                CardRow(
                    Title: 'Cmp Name :',
                    description: data.user[index].company!.name.toString()),
                CardRow(
                    Title: 'Cmp CatchPh :',
                    description:
                        data.user[index].company!.catchPhrase.toString()),
                CardRow(
                    Title: 'Cmp bs :',
                    description: data.user[index].company!.bs.toString()),
              ]),
            ),
          ),
        );
      },
    );
  }
}

class CardRow extends StatelessWidget {
  final String Title, description;

  const CardRow({Key? key, required this.Title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              description,
              maxLines: 3,
              style: TextStyle(
                color: Colors.grey[900],
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
