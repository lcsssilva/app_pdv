import 'package:flutter/material.dart';
import 'package:get/get.dart';


final colorDrawerWhite = Colors.white.withOpacity(0.8);
const grayColor =  Color.fromRGBO(204, 204, 204, 0.8);
const whiteConstColor = Color.fromRGBO(255, 255, 255, 0.8);
const backgroundColorLogo =  Color.fromRGBO(191, 147, 72, 1.0);
const backgroundColorDark =  Color.fromRGBO(43, 43, 43, 1.0);
const styleColorBlue = Color.fromRGBO(0, 103, 254, 1);
const styleColorDark = TextStyle(
  color: Color.fromRGBO(0, 0, 0, 1),
  fontSize: 22);
const styleColorWhite = TextStyle(
  color: whiteConstColor,
  fontSize: 20
);


const colorAndSizeRegisterProduct = TextStyle(
    color:grayColor,
    fontSize: 16);

const borderNone = OutlineInputBorder(

  borderSide: BorderSide(

  )
);

const errorBorderInline = UnderlineInputBorder(
  borderSide: BorderSide(
      color: Colors.red
  ),
);

const focusBorderInline = UnderlineInputBorder(
  borderSide: BorderSide(
      color: styleColorBlue
  ),
);

const enableBorderInline = UnderlineInputBorder(
  borderSide: BorderSide(
      color: Color.fromRGBO(204, 204, 204, 0.8)
  ),
);


void loading(context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const AlertDialog(
            content: Row(children: [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text('Carregando....'),
            ]),
          ));
}

void confirmAlert(context,String text){
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      content: Text(text, textAlign: TextAlign.center),
      actions: [
        TextButton(onPressed: () => Get.back(), child: const Text('NÃO')),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () => Get.back(),
            child: const Text('SIM')),
      ],
    ),
  );
}

void error(context,Map text) {
  showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: const Color(0xCD000000),
      builder: (_) => AlertDialog(
            icon: const Icon(Icons.error_outline, color: Colors.red, size: 60),
            title: const Text("Error!"),
            content: Text(text.map((key, value) => value[0]).toString(),
                textAlign: TextAlign.center),
            actions: [
              ElevatedButton(
                  onPressed: () => Get.back(), child: const Text('Ok')),
            ],
          ));
}


void success(String text,context,{action}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
            icon: const Icon(Icons.check_circle_outline,
                color: Colors.green, size: 60),
            content: Text(text, textAlign: TextAlign.center),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    if (action == "back") {
                      Get.back();
                      Get.back();
                    }else{
                      Get.back();
                    }
                  },
                  child: const Text('Ok')),
            ],
          ));
}
