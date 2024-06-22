import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_book/laboratory_module/add_test_page/view/add_test_page.dart';
import 'package:health_book/models/laboratory.dart';

class ProfilePart extends StatelessWidget {
  final Laboratory laboratory;
  const ProfilePart({
    super.key,
    required this.laboratory,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.15,
                    child: Image.network(laboratory.logo),),
                Text(laboratory.name)
              ],
            ),
            Text(laboratory.address),
            ListView.builder(
              shrinkWrap: true,
              itemCount: laboratory.tests.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Text(laboratory.tests[index].name),
                  trailing: Text(
                    laboratory.tests[index].price.toString(),
                  ),
                  leading: const Icon(Icons.arrow_drop_down),
                  children: [
                    Text(laboratory.tests[index].userDescription),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Update"),
                    ),
                  ],
                );
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => const AddTestPage(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
