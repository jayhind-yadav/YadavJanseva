import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:yjs_kendra/screens/show_customer.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  static final RegExp nameRegExp = RegExp('[a-zA-Z]');
  bool? login = false;
  late TextEditingController name, mobile;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = TextEditingController();
    mobile = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: FutureBuilder<bool>(
          future: checkLogin(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
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
                else {
                  if (snapshot.data == true)
                    return ListView(
                      padding: const EdgeInsets.all(8.0),
                      children: [
                        Card(
                          color: Colors.white,
                          elevation: 0,
                          margin: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      _buildAvatar(
                                          'http://sohnagcsc.in/logo.png'),
                                      FutureBuilder<List<String?>>(
                                          future: getNameNumber(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<List<String?>>
                                                  snapshot) {
                                            if (snapshot.hasData) {
                                              return ListTile(
                                                title: Center(
                                                    child: Text(
                                                  'Hello Mr. ' +
                                                      snapshot.data![0]
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20.0),
                                                )),
                                                subtitle: Center(
                                                  child: Text(
                                                    '+91-' +
                                                        snapshot.data![1]
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20.0),
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return Center(
                                                  child: ListTile(
                                                title: Text('Guest'),
                                              ));
                                            }
                                          })
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Card(
                          color: Colors.white,
                          elevation: 0,
                          margin: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () async {
                                  SharedPreferences.getInstance().then((value) {
                                    print(value.getString('mobile').toString());
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ShowCustomer(
                                                custNum: value
                                                    .getString('mobile')
                                                    .toString(),
                                              )),
                                    );
                                  });
                                },
                                child: ListTile(
                                  leading: Icon(Icons.search),
                                  title:
                                      Text('अपने प्रमाण पत्र की स्थिति देखे'),
                                  trailing: Icon(Icons.arrow_forward),
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.share),
                                title: Text('Share app'),
                                trailing: Icon(Icons.arrow_forward),
                              ),
                              ListTile(
                                leading: Icon(Icons.message),
                                title: Text('Send us Feedback'),
                                trailing: Icon(Icons.arrow_forward),
                              ),
                              ListTile(
                                leading: Icon(Icons.facebook),
                                title: Text('Follow Us'),
                                trailing: Icon(Icons.arrow_forward),
                              ),
                              ListTile(
                                leading: Icon(Icons.privacy_tip),
                                title: Text('Privacy Policy'),
                                trailing: Icon(Icons.arrow_forward),
                              ),
                              InkWell(
                                onTap: () async {
                                  SharedPreferences preferences =
                                      await SharedPreferences.getInstance();
                                  await preferences.clear();
                                  setState(() {
                                    login = false;
                                  });
                                },
                                child: ListTile(
                                  leading: Icon(Icons.arrow_circle_up_rounded),
                                  title: Text('Logout'),
                                  trailing: Icon(Icons.arrow_forward),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  else {
                    return ListView(
                      padding: const EdgeInsets.all(8.0),
                      children: [
                        Card(
                          color: Colors.white,
                          elevation: 0,
                          margin: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Material(
                                            elevation: 2.0,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                            child: TextFormField(
                                              validator: (value) => value!.isEmpty
                                                  ? 'Enter Your Name'
                                                  : (nameRegExp.hasMatch(value)
                                                  ? null
                                                  : 'Enter a Valid Name'),
                                              controller: name,
                                              onChanged: (String value) {},
                                              cursorColor: Colors.deepOrange,
                                              decoration: InputDecoration(
                                                  hintText: "Enter Your Name",
                                                  prefixIcon: Material(
                                                    elevation: 0,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(30)),
                                                    child: Icon(
                                                      Icons.person,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 25,
                                                          vertical: 13)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Material(
                                            elevation: 2.0,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                            child: TextFormField(
                                              validator: (value){
                                          if (value == null || value.isEmpty) {
                                          return 'Please Enter Mobile/Id';
                                          }
                                          else if(value.length!=10)
                                          return 'Mobile should be 10 digit';
                                          return null;
                                          },
                                              controller: mobile,
                                              onChanged: (String value) {},
                                              cursorColor: Colors.deepOrange,
                                              keyboardType: TextInputType.number,
                                              decoration: InputDecoration(
                                                  hintText: "Enter Your Mobile",
                                                  prefixIcon: Material(
                                                    elevation: 0,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(30)),
                                                    child: Icon(
                                                      Icons.send_to_mobile_sharp,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 25,
                                                          vertical: 13)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                fixedSize: Size.fromWidth(200),
                                                padding: EdgeInsets.all(15),
                                              ),
                                              child: Text(
                                                "Login",
                                              ),
                                              onPressed: () async {
                                                if (formKey.currentState!.validate()) {
                                                addStringToSF('name', name.text);
                                                addStringToSF(
                                                    'mobile', mobile.text);
                                                setState(() {
                                                  login = true;
                                                });
                                              }
                                              }
                                            )),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Card(
                          color: Colors.white,
                          elevation: 0,
                          margin: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.share),
                                title: Text('Share app'),
                                trailing: Icon(Icons.arrow_forward),
                              ),
                              ListTile(
                                leading: Icon(Icons.message),
                                title: Text('Send us Feedback'),
                                trailing: Icon(Icons.arrow_forward),
                              ),
                              ListTile(
                                leading: Icon(Icons.facebook),
                                title: Text('Follow Us'),
                                trailing: Icon(Icons.arrow_forward),
                              ),
                              ListTile(
                                leading: Icon(Icons.privacy_tip),
                                title: Text('Privacy Policy'),
                                trailing: Icon(Icons.arrow_forward),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }
                }
            }
          }),
    );
  }

  Future<List<String?>> getNameNumber() async {
    List<String?> nameNumber = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nameNumber.add(prefs.getString('name'));
    nameNumber.add(prefs.getString('mobile'));
    return nameNumber;
  }

  CircleAvatar _buildAvatar(String image, {double radius = 80}) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: radius,
      child: CircleAvatar(
        radius: radius - 3,
        backgroundImage: NetworkImage(image),
      ),
    );
  }

  addStringToSF(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString('mobile');
    if (stringValue != null)
      return true;
    else
      return false;
  }
}
