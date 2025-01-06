import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register17/bd/provider.dart';
import 'package:register17/screens.dart/details.dart';
import 'package:register17/screens.dart/editpage.dart';
import 'package:register17/screens.dart/register.dart';
import 'package:register17/widget/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // StudentProvider studentProvider = Provider.of<StudentProvider>(context);
    // while using valuelistenable builder or provider.of

    
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: (context), delegate: SearchHelp());
              },
              icon: const Icon(Icons.search))
        ],
        centerTitle: true,
        title: const Text('Students'),
      ),
      body: Consumer<StudentProvider>(
        builder: (context,studentProvider,child) {
          return ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                    thickness: 1,
                  ),
              itemCount: studentProvider.studentList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsPage(
                                studentModel:
                                    studentProvider.studentList[index],
                              )));
                    },
                    title: Text(studentProvider.studentList[index].name),
                    leading: const CircleAvatar(),
                    subtitle: Text(studentProvider.studentList[index].batch),
                    trailing: PopupMenuButton<String>(
                      onSelected: (String value) {},
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          onTap: () {
                            studentProvider.deleteStudent(
                                studentProvider.studentList[index].key!);
                          },
                          value: 'option1',
                          child: const Text('Delete'),
                        ),
                        PopupMenuItem<String>(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EditPage(
                                    studentModel:
                                        studentProvider.studentList[index])));
                          },
                          value: 'option2',
                          child: const Text('Edit'),
                        ),
                      ],
                    ),
                  ),
                );
              });
        }
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: const Row(
            children: [Text('Add'), Icon(Icons.add)],
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Register()));
          }),
    );
  }
}
