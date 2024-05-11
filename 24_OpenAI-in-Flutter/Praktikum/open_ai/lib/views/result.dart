import 'package:flutter/material.dart';
import 'package:open_ai/models/open_ai.dart';

class ResultScreen extends StatelessWidget {
  final GptData gptResponseData;

  const ResultScreen({super.key, required this.gptResponseData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 86, 79, 219),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                gptResponseData.choices[0]!.message!.content!,
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
