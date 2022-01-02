import 'package:flutter/material.dart';
import 'package:exercise_database/sql_helper.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.amber,
    ),
    home: const Database(),
  ));
}

class Database extends StatefulWidget {
  const Database({Key? key}) : super(key: key);

  @override
  _DatabaseState createState() => _DatabaseState();
}

class _DatabaseState extends State<Database> {

  List<Map<String,dynamic>> entries = [];
  bool isLoading = true;

  TextEditingController field1 = TextEditingController();
  TextEditingController field2 = TextEditingController();

  void refreshDiary() async {
    final data = await SqlHelper.getAll();
    setState(() {
      entries = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    refreshDiary();
  }

  Future<void> insertEntry() async {
    await SqlHelper.insertItem(field1.text, field2.text);
    refreshDiary();
  }

  Future<void> updateEntry(int id) async {
    await SqlHelper.updateItem(id, field1.text, field2.text);
    refreshDiary();
  }

  Future<void> deleteEntry(int id) async {
    await SqlHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Entry deleted successfully !')));
    refreshDiary();
  }

  void showModal(int? id) async {
    if (id != null) {
      final existingEntry = entries.firstWhere((element) => element['id'] == id);
      field1.text = existingEntry['title'];
      field2.text = existingEntry['description'];
    }
    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                children: [
                  TextField(
                    controller: field1,
                    decoration: const InputDecoration(hintText: 'Title'),
                  ),
                  TextField(
                    controller: field2,
                    decoration: const InputDecoration(hintText: 'Description'),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (id == null) {
                          await insertEntry();
                        }
                        else {
                          await updateEntry(id);
                        }
                        field1.text = '';
                        field2.text = '';
                        Navigator.of(context).pop();
                      },
                      child: Text(id == null ? 'Create New' : 'Update'),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dairy'),
        centerTitle: true,
      ),
      body: isLoading ? const Center(child: CircularProgressIndicator(),) : ListView.builder(
          itemCount: entries.length,
          itemBuilder: (context, index) => Card(
            margin: const EdgeInsets.all(15.0),
            child: ListTile(
              title: Text(entries[index]['title']),
              subtitle: Text(entries[index]['description']),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () => showModal(entries[index]['id']),
                        icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                        onPressed: () => deleteEntry(entries[index]['id']),
                        icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModal(null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
