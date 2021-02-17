import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

login(String id, String pwd) async {
  var body = {"email": id, "password": pwd};
  var bodyencoded = json.encode(body);
  var url = ''; //your login api
  var response = await http.post(url,
      body: bodyencoded, headers: {"Content-Type": "application/json"});
  var bodydecode = json.decode(response.body);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  return bodydecode['result'];
}

signup(String name, String id, String pwd) async {
  var body = {"name": name, "email": id, "password": pwd};
  var bodyencoded = json.encode(body);
  var url = ''; //your signup api
  var response = await http.post(url,
      body: bodyencoded, headers: {"Content-Type": "application/json"});
  var bodydecode = json.decode(response.body);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  return bodydecode['result'];
}
