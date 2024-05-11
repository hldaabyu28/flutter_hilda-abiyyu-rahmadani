import 'package:flutter/material.dart';
import 'package:open_ai/services/recomendation_service.dart';
import 'package:open_ai/views/result.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _budgetController = TextEditingController();
  TextEditingController _cameraController = TextEditingController();
  TextEditingController _storageController = TextEditingController();
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _getRecommendations() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await RecommendationService.getRecommendations(
        budget: _budgetController.text,
        camera: _cameraController.text,
        storage: _storageController.text,
      );

      if (mounted) {
        setState(() {
          isLoading = false;
        });

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ResultScreen(gptResponseData: result);
            },
          ),
        );
      }
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Failed to send a request. Please try again.'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recomendation Smartphone" , style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 86, 79, 219),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
            children: [
              TextFormField(
                controller: _budgetController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Budget IDR",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter valid numbers';
                  }
                  return null;
                  
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _cameraController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Camera MP",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter valid numbers';
                  }
                  return null;
                  
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _storageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Storage GB",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter valid numbers';
                  }
                  return null;
                  
                },
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: isLoading && _formKey.currentState!.validate() != false
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 86, 79, 219)),
                      ),
                        onPressed: _getRecommendations,
                        child: Text("Get Recommendations" , style: TextStyle(color: Colors.white),),
                      ),
              )
              
            ],

          ),
          ),
        ),
      ),
    );
  }
}