import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
// this class compain all the apiaes that have the same things like status code
// throw exception ... etc
// the changes is in Url and the body of data

class Api {
// get method
  Future<Response> get({required String url}) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Accept': 'application/json',
      // todo ask about if there is one token or token changed
      'Authorization': 'Bearer ${'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL3VzZXIvYXV0aC9sb2dpbiIsImlhdCI6MTcxODU0NDQ0NCwibmJmIjoxNzE4NTQ0NDQ0LCJqdGkiOiJmMWJFM3M3MGlJdWJMQzJjIiwic3ViIjoiMTEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.NkWXVQ6OZ4fs1zIohX2OMHuwCd7s67pKQezqnfUojmA'}'
    });
    http.Response response = await http.get(Uri.parse(url),headers: headers);
    dynamic _body;
    try {
      _body = jsonDecode(response.body);
    } catch(e) {
      _body = response.body;
    }
    Response _response = Response(headers: response.headers,body: _body,statusCode: response.statusCode);
    if (response.statusCode == 200) {
      return _response;
    }
    else {
      throw Exception('You have error in the code  ${response.statusCode}');
    }
  }



//post method
  Future<dynamic> post({required String url, @required dynamic body}) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Accept': 'application/json',
      // todo ask about if there is one token or token changed
      'Authorization': 'Bearer ${'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL3VzZXIvYXV0aC9sb2dpbiIsImlhdCI6MTcxODU0NDQ0NCwibmJmIjoxNzE4NTQ0NDQ0LCJqdGkiOiJmMWJFM3M3MGlJdWJMQzJjIiwic3ViIjoiMTEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.NkWXVQ6OZ4fs1zIohX2OMHuwCd7s67pKQezqnfUojmA'}'
    });
    http.Response response = await http.post(Uri.parse(url), body: body, headers: headers);
    dynamic _body;
    try {
      _body = jsonDecode(response.body);
    } catch(e) {
      _body = response.body;
    }
    Response _response = Response(headers: response.headers,body: _body,statusCode: response.statusCode);
    if (response.statusCode == 200) {
      return _response;
    }
    else {
      return _response;
    }
  }


// put method
  Future<dynamic> put(
      {required String url, required dynamic body, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Content-Type': 'application/x-www-form-urlencoded'
      });
    }
    http.Response response = await http.put(
        Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      return jsonData;
    }
    else
      throw Exception('You have error in the code  ${response
          .statusCode} with body ${jsonDecode(response.body)}');
  }


}