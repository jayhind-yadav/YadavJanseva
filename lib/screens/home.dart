import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yjs_kendra/screens/show_customer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final custController = TextEditingController();
    return ListView(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 0.0, left: 50.0, right: 50.0, bottom: 1.0),
            child: Form(
              key: formKey,
              child: TextFormField(
                controller: custController,
                validator: (value) {
                if (value == null || value.isEmpty) {
                return 'Please Enter Mobile/Id';
                }
                else if(value.length!=10)
                  return 'Mobile should be 10 digit';
                return null;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter Id / Mobile No"),
                  suffixIcon: IconButton(
                    iconSize: 42,
                    icon: Icon(Icons.search_rounded),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowCustomer(
                                custNum: custController.text,
                              )),
                        );
                      }

                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        Divider(),
        CarouselSlider(
          items: [
            carouseItem('lib/assets/images/1.jpg'),
            carouseItem('lib/assets/images/2.jpg'),
            carouseItem('lib/assets/images/3.jpg'),
            carouseItem('lib/assets/images/4.jpg'),
          ],
          options: CarouselOptions(
              autoPlay: true, viewportFraction: 0.95, height: 200.0),
        ),
        Divider(),
        Container(
            //height: 250.0,
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Column(
              children: [
                notificationText(
                    'छात्रवृत्ति की आवेदन तिथी आगे बढी सूचनानुसार 29 से आनलाईल पुनः शुरू'),
                notificationText('छात्रवृत्ति आनलाईन आज से एक बार पुनः शुरू'),
                notificationText(
                    'किसी भी प्रकार का आनलाईन फार्म भरवाने के लिए संपर्क करें।'),
              ],
            )),
        Divider(),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('Contact Us'),
              Row(
                children: [
                  Image(
                    image: AssetImage('lib/assets/images/c.jpg'),
                    height: 60.0,
                    width: 60.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  InkWell(
                      onTap:()=>_makePhoneCall('+91-9455043033'),
                      child: Text('9455043033'))
                ],
              ),
              Row(
                children: [
                  Image(
                    image: AssetImage('lib/assets/images/w.jpg'),
                    height: 60.0,
                    width: 60.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  InkWell(onTap: openWhatsApp, child: Text('+915566297078'))
                ],
              ),
              Row(
                children: [
                  Image(
                    image: AssetImage('lib/assets/images/e.png'),
                    height: 60.0,
                    width: 60.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text('sohnagcsc@gmail.com')
                ],
              )
            ],
          ),
        ),
        Divider(),
      ],
    );
  }

  notificationText(String note) {
    return Row(
      children: [
        Image(
          image: AssetImage('lib/assets/images/sign.jpg'),
          width: 30.0,
          height: 30.0,
        ),
        Expanded(
            child: Text(
          note,
        )),
      ],
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  openWhatsApp() async {
    Uri whatsAppURlAndroid =Uri.parse("whatsapp://send?phone=+915566297078&text=hello");
    if (!await launchUrl(
      whatsAppURlAndroid,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $whatsAppURlAndroid';
    }
    else{
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
    }
  }
}

carouseItem(String imgUrl) {
  return Container(
    padding: EdgeInsets.all(5.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        image: DecorationImage(
          image: AssetImage(imgUrl),
          fit: BoxFit.fill,
        )),
  );
}
