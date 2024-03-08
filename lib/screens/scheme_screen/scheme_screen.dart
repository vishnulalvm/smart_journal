import 'package:flutter/material.dart';
import 'package:smart_journal/schememodels/scheme_model.dart';



class SchemeButtonHome extends StatelessWidget {
  final List<NewSchemeModel> items;
  const SchemeButtonHome({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schemes'),
      ),

      body:ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(item.imagePath), // Use your image path
          ),
          title: Text(item.title),
          subtitle: Text(item.subtitle),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(item.trailingText1),
              const SizedBox(height: 5), // Add some spacing between text widgets (optional)
              Text(item.trailingText2),
            ],
          ),
        );
      },
    ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        onPressed: (){
        

      },
      child: const Icon(Icons.add,weight: 800,color: Colors.white,),),
    );
    
  }
}