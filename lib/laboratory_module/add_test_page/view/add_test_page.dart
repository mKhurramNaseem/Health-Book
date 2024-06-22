import 'package:flutter/material.dart';

class AddTestPage extends StatelessWidget {
  const AddTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Test'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // const Text('Add New Test'),
              SizedBox(
                width: width * 0.8,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.8,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 10,
                ),
              ),
              SizedBox(
                width: width * 0.8,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
