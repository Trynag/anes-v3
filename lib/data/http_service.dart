import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/strings.dart';
import '../models/action_model.dart';
import '../models/dangers_model.dart';
import '../models/login_model.dart';
import '../models/work_model.dart';

class HttpService {
  Future<Login> login({user, password}) async {
    var url = Uri.parse('${constURL}login/');
    final res =
        await http.post(url, body: {'username': user, 'password': password});

    if (res.statusCode == 200 || res.statusCode == 201) {
      return Login.fromJson(jsonDecode(res.body));
    } else {
      throw "falló al logearse";
    }
  }

  Future<List<DangerClass>> getDangerClasses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse("${constURLApi}danger-classes/");

    try {
      final res = await http.get(url, headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Accept": "application/json",
        'Authorization': 'JWT ${prefs.getString('token')}'
      });

      if (res.statusCode == 200 || res.statusCode == 201) {
        var requestBody = jsonDecode(utf8.decode(res.bodyBytes));
        List<dynamic> body = requestBody['results'];

        List<DangerClass> dangerClasses = body
            .map(
              (dynamic item) => DangerClass.fromJson(item),
            )
            .toList();
        return dangerClasses;
      } else {
        throw "Falló al buscar danger classes. Código de estado: ${res.statusCode}";
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error al obtener las clases de peligro: $error");
      }
      throw "Falló al buscar danger classes. Detalles: $error";
    }
  }

  Future<WorkModel> createWork({required data}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse("${constURLApi}works/");

    try {
      final res = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          'Authorization': 'JWT ${prefs.getString('token')}'
        },
        body: jsonEncode(data),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        return WorkModel.fromJson(jsonDecode(utf8.decode(res.bodyBytes)));
      } else {
        throw "Falló al crear work. Código de estado: ${res.statusCode}, Mensaje: ${res.body}";
      }
    } catch (error) {
      if (kDebugMode) print("Error al crear work: $error");
      throw "Falló al crear work. Detalles: $error";
    }
  }

  Future<ActionModel> createAction({required data}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse("${constURLApi}actions/");
    final res = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization': 'JWT ${prefs.getString('token')}'
      },
      body: jsonEncode(data),
    );
    if (res.statusCode == 200 || res.statusCode == 201) {
      return ActionModel.fromJson(jsonDecode(res.body));
    } else {
      throw "Falló al crear Action";
    }
  }

  Future createRisk({required data, required img}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse("${constURLApi}risk-evaluations/");

    var request = http.MultipartRequest("POST", url);

    request.fields['deficiency_lvl'] = data['deficiency_lvl'].toString();
    request.fields['exposure_lvl'] = data['exposure_lvl'].toString();
    request.fields['probability_lvl'] = data['probability_lvl'].toString();
    request.fields['interpretation_probability_lvl'] =
        data['interpretation_probability_lvl'].toString();
    request.fields['consequence_lvl'] = data['consequence_lvl'].toString();
    request.fields['risk_lvl'] = data['risk_lvl'].toString();
    request.fields['interpretation_risk_lvl'] =
        data['interpretation_risk_lvl'].toString();
    request.fields['risk_accept'] = data['risk_accept'].toString();
    request.fields['action'] = data['action'].toString();
    request.fields['work'] = data['work'].toString();
    request.fields['state'] = data['state'].toString();
    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('image', img.path);
    request.files.add(multipartFile);
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "JWT ${prefs.getString('token')}"
    };
    request.headers.addAll(headers);
    final res = await request.send();
    if (res.statusCode == 200 || res.statusCode == 201) {
      return res;
    } else {
      throw "Falló al crear Action";
    }
  }
}
