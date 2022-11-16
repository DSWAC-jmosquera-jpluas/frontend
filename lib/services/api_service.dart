import 'package:citasmedicas/models/appoinment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  //get all
  var baseUrl = "http://20.63.79.173:5000";

  Future<List<Appoiment>> getAll() async {
    String url = "$baseUrl/CitaMedica/GetAll";
    var uri = Uri(
        scheme: "http",
        host: "20.63.79.173",
        port: 5000,
        path: "/CitaMedica/GetAll");
    final response = await http.get(uri, headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    });

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((appoiment) => Appoiment.fromJson(appoiment))
          .toList();
    } else {
      return [];
    }
  }

  //save appoinment
  Future<bool> save(Appoiment appoiment) async {
    var uri = Uri(
        scheme: "http", host: "20.63.79.173", port: 5000, path: "/CitaMedica");
    var body = json.encode(appoiment.toJson());

    final response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  //delete appoinment
  Future<bool> delete(Appoiment appoiment) async {
    var uri = Uri(
        scheme: "http",
        host: "20.63.79.173",
        port: 5000,
        path: "/CitaMedica?CitaMedicaId=${appoiment.id}");
    final response = await http.delete(uri);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //put appoinment
  Future<bool> update(Appoiment appoiment) async {
    var uri = Uri(
        scheme: "http", host: "20.63.79.173", port: 5000, path: "/CitaMedica");

    var body = json.encode(appoiment.toJson());

    final response = await http.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //get appoinment by id
  Future<Appoiment> getById(String id) async {
    var uri = Uri(
        scheme: "http",
        host: "20.63.79.173",
        port: 5000,
        path: "/CitaMedica/GetById?CitaMedicaId=$id");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return Appoiment.fromJson(jsonResponse);
    } else {
      return Appoiment();
    }
  }
}

final ApiService apiService = ApiService();
