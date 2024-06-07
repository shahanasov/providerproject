import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register17/bd/provider.dart';
import 'package:register17/screens.dart/details.dart';
import 'package:register17/screens.dart/register.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   StudentProvider studentProvider=Provider.of<StudentProvider>(context) ;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search))
        ],
        centerTitle: true,
        title: const Text('Students'),
      ),
      body: ListenableBuilder(
        listenable: studentProvider,
        builder: (context, _) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(thickness: 1,),
            itemCount: studentProvider.studentList.length,
            itemBuilder: (context,index){
            return  Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListTile(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsPage(studentModel: studentProvider.studentList[index],)));
                },
                title:  Text(studentProvider.studentList[index].name),
                leading: const CircleAvatar(),
                subtitle:  Text(studentProvider.studentList[index].batch),
              ),
            );
          });
        }
      ),
      floatingActionButton: FloatingActionButton.extended(label: const Row(
        children: [
          Text('Add'),
          Icon(Icons.add)
        ],
      ),
        onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Register()));
      }),
    );
  }
}