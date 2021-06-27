import 'package:flutter/material.dart';
class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}
class _TodoState extends State<Todo> {
  var output='';
  List<dynamic>lst=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('TODO',
        style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold, ),
      )),backgroundColor: Colors.orangeAccent),
      body: ListView.builder(itemCount: lst.length,
          itemBuilder: (context,index){
            return Container(
                height: 50,color: Colors.orangeAccent,margin: EdgeInsets.only(top: 15),
                child: ListTile(
                  title: Text("${lst[index]}",style: TextStyle(
                      color: Colors.pink,fontWeight:FontWeight.bold,fontSize: 18),),
                  trailing: Container(
                    width: 50,
                    child: Row(
                      children: [
                        GestureDetector(onTap:(){
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              backgroundColor: Colors.orangeAccent,
                              title: Text('Edit Item',),
                              content: TextField(
                                onChanged: (value){
                                  output=value;
                                },
                              ),
                              actions: [
                                ElevatedButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                      setState(() {
                                        lst.replaceRange(index, index+1, {output});
                                      }
                                      );
                                    },
                                    child: Text('Edit'))],
                            );
                          });
                        },child: Icon(Icons.edit)),
                        GestureDetector(onTap:(){
                          setState(() {
                            lst.removeAt(index);
                          });
                        },child: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                ));
          }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, builder: (context){
          return AlertDialog(
            backgroundColor: Colors.orangeAccent,

            title: Text('Add Item',style: TextStyle(
                backgroundColor: Colors.blueGrey,fontWeight: FontWeight.bold),
            ),
            content: TextField(
              onChanged: (value){
                output=value;
              },
            ),
            actions: [
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
                setState(() {
                  lst.add(output);
                }
                );
              },
                  child: Text('Save')),
            ],);
        });},
        backgroundColor: Colors.pink,
        child: Text('Add',style: TextStyle(color: Colors.white60  ,fontWeight: FontWeight.bold),),
      ),
    );
  }
}