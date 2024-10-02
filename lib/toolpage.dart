import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:flutter/material.dart';

class Toolpage extends StatefulWidget {
  const Toolpage({
    super.key,
  });

  final String tit = "Tool Example";

  @override
  State<Toolpage> createState() => _ToolpageState();
}

class _ToolpageState extends State<Toolpage> {
  String inputString = "";
  final List<String> listHash = ["MD5", "SHA-1", "SHA-256", "SHA384"];
  List<String> res = [];
  final TEXTINPUTLISTENER = TextEditingController();


  @override
  void initState() {

    for (var i = 0; i < 4; i++) {
        res.add("");
    }
    super.initState();

    _hashF();
    TEXTINPUTLISTENER.addListener(_hashF);
    
  }


  void _hashF() {
    res.clear();
    var byte = utf8.encode(TEXTINPUTLISTENER.text);
    setState(() {
      List<String> tempRes = [md5.convert(byte).toString(),sha1.convert(byte).toString(),sha256.convert(byte).toString(),sha384.convert(byte).toString()];
    ///res = res;
    ///
      res.addAll(tempRes);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        title: Text(
          widget.tit,
          style: TextStyle(
              foreground: Paint()
                ..shader =
                    const LinearGradient(colors: [Colors.white, Colors.black])
                        .createShader(const Rect.fromLTWH(0, 0, 100, 0))),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Text(
              "Your input text :",
              style: TextStyle(
                  foreground: Paint()
                    ..shader = const LinearGradient(colors: [
                      Color.fromARGB(255, 236, 189, 186),
                      Color.fromARGB(255, 7, 197, 197)
                    ]).createShader(const Rect.fromLTWH(0, 0, 100, 0))),
            ),
            TextField(
              controller: TEXTINPUTLISTENER,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple.shade600)),
                hintText: 'please input text to hash',
              ),
            ),
            ListView.builder(
              //important to ListView
              shrinkWrap: true,
              itemCount: listHash.length,
              prototypeItem: ListTile(title: Text("hashResult: ${listHash.first} ::"),),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("hashResult: ${listHash[index]} ::"),
                  subtitle: Text(res[index]),
                );
              },
            )
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 200, 200, 200),
    );
  }
}
