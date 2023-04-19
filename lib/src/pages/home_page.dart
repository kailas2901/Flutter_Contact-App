

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';


class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  List<Contact> contacts = [];

  @override
  void initState() {
    //datafetching here
    getContactInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       drawer: Drawer(
         child: Column(
           children: [
             DrawerHeader(
               child: Image.network("https://images8.alphacoders.com/581/581620.jpg"),



             ),
             ListTile(
               leading: Icon(Icons.add_home_outlined),
               title: Text("Drawer"),
             ),
             ListTile(
               leading: Icon(Icons.add_home_outlined),
               title: Text("Drawer"),
             ),


           ],

         ),
       )
       ,
       appBar: AppBar(
         title: Text("Contacts",
         style:GoogleFonts.acme(fontSize: 15,fontWeight: FontWeight.w400)),
         actions: [
           Icon(Icons.menu_outlined, color: Colors.red,),
           SizedBox(width: 4),
           Icon(Icons.mail_outline),
           SizedBox(width: 8)
         ],
       ),
       body: ListView.builder(
         itemCount: contacts.length,
         itemBuilder: (_,position){
           Contact contact = contacts[position];
           return ListTile(
             title: Text("${contact.displayName}"),
             subtitle: Text("${contact.phones?.map((e) => e.value).toList().join(",")}"),
           );
         },
       ),
     );

  }

  void getContactInfo() async {
    PermissionStatus status = await Permission.contacts.request();
    if(status == PermissionStatus.granted){
      List<Contact> contactsTemp = await ContactsService.getContacts();
      setState(() {
        contacts = contactsTemp;
      });
    }
  }
}