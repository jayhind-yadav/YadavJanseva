import 'package:flutter/material.dart';

class   ServiceDocument extends StatefulWidget {
  ServiceDocument({Key? key,required this.serviceType}) : super(key: key);
  final String serviceType;

  @override
  State<ServiceDocument> createState() => _ServiceDocumentState();
}

class _ServiceDocumentState extends State<ServiceDocument> {
  List doc = [];

  var data = {'आय':{'1':'एक फोटो','2':'आधार कार्ड की फोटो कापी'},
  'जाति' : {'1':'एक फोटो','2':'आधार काार्ड की फोटो कापी'},
    'निवास':{'1':'एक फोटो','2':'आधार कार्ड की फोटो कापी'},
    'राशन कार्ड':{'1':'मुखिया का एक फोटो','2':'मुखिया या उसके पिता/पति का बैंक पासबुक की फोटो कापी','3':'सभी सदस्यों के आधार कार्ड की फोटो कापी'},
    'पैन कार्ड':{'1':'दो फोटो','2':'आधार कार्ड की फोटो कापी','3':'ई-मेल आईडी एवंं मोबाईल नं.'},
    'पासपोर्ट':{'1':'हाईस्कूल प्रमाणपत्र की फोटोकापी','2':'आधार कार्ड की फोटो कापी','3':'बैंक पासबुक की फोटो कापी'},
    'CCC आनलाईन':{'1':'एक फोटो','2':'आधार कर्ड की फोटो कापी','3':'हाईस्कूल प्रमाणपत्र की फोटो कापी','4':'हस्ताक्षर एवं बाएं हाथ के अंगूठे का छाप','5':'मोबाईल नं. ओर इमेल आई़डी'},
    'पेंशन आनलाईन' : {'1':'एक फोटो','2':'आधार काार्ड की फोटो कापी','3':'बैंक पासबुक की फोटोकापी','4':'आय प्रमाणपत्र जो 46000 से कम का हो','5':'मोबाईल नं.'},
  };

  @override
  Widget build(BuildContext context) {
    if(data[widget.serviceType] == null)
      {
        Navigator.pop(context);
      }
    doc = data[widget.serviceType]?.values.toList() ?? [''];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: doc.length+1,
          itemBuilder: (BuildContext context, int index) {
            if(index == 0){
              return Center(
                child: Text(widget.serviceType+' बनवाने के लिए निम्नलिखित की आवश्यकता है।\n\n',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),),
              );
            }
            return Text('$index. '+doc[index-1]+'\n',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),);
          },
        ),
      ),
    );
  }
}


