import 'package:lustore/app/model/auth.dart';
import 'package:lustore/app/core/api_client.dart';
import 'package:lustore/app/boot/config.dart';
import 'dart:convert';

abstract class Model {
  String action = "";
  Auth auth = Auth();

  actionApi(String _action){
    action = _action;
  }

  Future<dynamic> index() async {
    String token = await auth.refreshJwt();
    final response = await client.get(
      Uri.parse(url + action),
      headers: <String, String>{
        'Accept' : 'application/json',
        'Authorization': 'Bearer ' + token
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(jsonEncode(response.body));
    }
  }

  Future<dynamic> store(data) async {
    String token = await auth.refreshJwt();
    final response = await client.post(
      Uri.parse(url + action),
      headers: <String, String>{
        'Accept' : 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + token
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      Map<String,dynamic> _result  = jsonDecode(response.body);
      if(_result.containsKey('errors')){
            return _result["errors"];
      }
      return _result;
    }
  }

  Future<dynamic> show(id) async {
    String token = await auth.refreshJwt();
    final response = await client.get(
      Uri.parse(url + action + "/" + id.toString()),
      headers: <String, String>{
        'Accept' : 'application/json',
        'Authorization': 'Bearer ' + token
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  Future<dynamic> update(data, id) async {
    String token = await auth.refreshJwt();
    final response = await client.put(
      Uri.parse(url + action + "/" + id.toString()),
      headers: <String, String>{
        'Accept' : 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + token
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return jsonDecode(response.body);
    }
  }

  Future<dynamic> destroy(id) async {
    String token = await auth.refreshJwt();
    final response = await client.delete(
      Uri.parse(url + action + "/" + id.toString()),
      headers: <String, String>{
        'Accept' : 'application/json',
        'Authorization': 'Bearer ' + token
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return jsonDecode(response.body);
    }
  }


}
