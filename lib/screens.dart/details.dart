import 'package:flutter/material.dart';
import 'package:register17/bd/model.dart';

class DetailsPage extends StatelessWidget {
  final StudentModel studentModel;
  const DetailsPage({super.key, required this.studentModel});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        title:  Text(studentModel.name),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
             color: const Color.fromARGB(255, 208, 203, 189),
          ),
          height: 500,
          width: 330,
         
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBar(title: const Text('Student At Brototype'),
              automaticallyImplyLeading: false,centerTitle: true,),
              // const SizedBox(height: 20),
              const CircleAvatar(radius: 80,),
              // const SizedBox(height: 20),
              Text(' Name : ${studentModel.name}',style: const TextStyle(fontSize: 30),),
              // const SizedBox(height: 20),
              Text('Batch : ${studentModel.batch}',style: const TextStyle(fontSize: 25),),
              // const SizedBox(height: 20),
              Text("Domain : ${studentModel.domain}",style: const TextStyle(fontSize: 25),)
            ],
          ),
        ),
      ),
    );
  }
}