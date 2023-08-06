import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:yjs_kendra/custom_widget/header.dart';
import 'package:yjs_kendra/modals/cust_modal.dart';

class ShowCustomer extends StatefulWidget {
  const ShowCustomer({Key? key, required this.custNum}) : super(key: key);
  final String? custNum;

  @override
  _ShowCustomerState createState() => _ShowCustomerState();
}

class _ShowCustomerState extends State<ShowCustomer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String url =
        'http://164.100.181.28/edistrict/showStatushome.aspx?application_no=';
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 130.0),
        child: Header(),
      ),
      body: FutureBuilder<CustModal>(
        future: getData(), // async work
        builder: (BuildContext context, AsyncSnapshot<CustModal> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: Text(
                  'Loading....',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              );
            default:
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              else
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25.0,
                    ),
                    Center(
                      child: Text(
                        'नमस्कार ${snapshot.data!.name}  जी\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () => snapshot.data!.income!.length == 15
                            ? _launchURL(url + '${snapshot.data!.income}')
                            : showAlertDialog(
                                context, 'आपने आय नहीं भरवाया है।'),
                        child: ListTile(
                          leading: Image.asset('lib/assets/images/fin.jpeg'),
                          title: Text(
                            'आय प्रमाणपत्र की स्थिति जानें',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        )),
                    TextButton(
                      onPressed: () => snapshot.data!.cast!.length == 15
                          ? _launchURL(url + '${snapshot.data!.cast}')
                          : showAlertDialog(
                              context, 'आपने जाति नहीं भरवाया है।'),
                      child: ListTile(
                        leading: Image.asset('lib/assets/images/fin.jpeg'),
                        title: Text(
                          'जाति प्रमाणपत्र की स्थिति जानें',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () => snapshot.data!.domicile!.length == 15
                            ? _launchURL(url + '${snapshot.data!.domicile}')
                            : showAlertDialog(
                                context, 'आपने निवास नहीं भरवाया है।'),
                        child: ListTile(
                          leading: Image.asset('lib/assets/images/fin.jpeg'),
                          title: Text(
                            'निवास प्रमाणपत्र की स्थिति जानें',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ))
                  ],
                );
          }
        },
      ),
    );
  }

  Future<CustModal> getData() async {
    String custNumMob = widget.custNum.toString();
    //print(custNumMob);
    late CustModal data;
    if (custNumMob.length < 10) {
      try {
        Uri url = Uri.parse(
            'http://www.cscsohnag.in/cdata.php?cn=' + custNumMob);
        http.Response response = await http.get(url);
        data = CustModal.fromJson(jsonDecode(response.body));
      }catch(E){
        showAlertDialog(context, 'Your Customer Id Not Found');
      }
    } else {
      try {
        Uri url =
        Uri.parse('https://www.cscsohnag.in/clist.php?mobile=' + custNumMob);
        http.Response response = await http.get(url);
        data = CustModal.fromJson(jsonDecode(response.body));
      }catch(E){
        showAlertDialog(context, 'Your Mobile No. Not Found');
      }
    }
    return data;
  }

  _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
    /*if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }*/
  }

  showAlertDialog(BuildContext context, String msg) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(msg),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
