import 'package:flutter/material.dart';
import 'package:yjs_kendra/screens/service_doc.dart';
class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  List<Color> colors = [
    Colors.blue,
    Colors.purple,
    Colors.redAccent,
    Colors.lightBlueAccent,
    Colors.lightGreenAccent,
    Colors.redAccent
  ];
  List<String> services = ["आय","जाति","निवास","राशन कार्ड","पैन कार्ड","पासपोर्ट","CCC आनलाईन","पेंशन आनलाईन","आधार प्रिन्टिंग","फोटो कापी","लेमिनेशन","रेल टिकट","ई-मेल","खतौनी","टाईपिंग","आधार ATM"];
  int cp=0;
  @override
  Widget build(BuildContext context) {

    return GridView.count(
      padding: EdgeInsets.all(20.0),
      mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        crossAxisCount: 2,
      childAspectRatio: 3.5/2,
      children: List.generate(services.length, (index)
    {
      if(index%5==0)
        cp=0;
      else
        cp++;
      return InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ServiceDocument(serviceType: services[index],)),
          );
        },
        child: Container(
            decoration: BoxDecoration(
              color: colors[cp],
              border: Border.all(color: Colors.grey, width: 3.0),
            ),
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: Text(
                services[index],
                style: Theme
                    .of(context)
                    .textTheme
                    .headline5,
              ) ,
            ),
          ),
      );
    }),
    );
  }
}
