import 'package:citasmedicas/models/appoinment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  //get all
  var baseUrl = "https://webapicitamedicaunl.azurewebsites.net";

  Future<List<Appoiment>> getAll() async {
    String url = "$baseUrl/CitaMedica/GetAll";
    final response = await http.get(Uri.parse(url));

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
    String url = "$baseUrl/CitaMedica";
    var body = json.encode(appoiment.toJson());

    final response = await http.post(Uri.parse(url),
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

  //delete appoinment
  Future<bool> delete(Appoiment appoiment) async {
    String url = "$baseUrl/CitaMedica?CitaMedicaId=${appoiment.id}";
    final response = await http.delete(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //put appoinment
  Future<bool> update(Appoiment appoiment) async {
    String url = "$baseUrl/CitaMedica";

    var body = json.encode(appoiment.toJson());

    final response = await http.put(Uri.parse(url),
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
    String url = "$baseUrl/CitaMedica/GetById?CitaMedicaId=$id";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return Appoiment.fromJson(jsonResponse);
    } else {
      return Appoiment();
    }
  }
}

final ApiService apiService = ApiService();
