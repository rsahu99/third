import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../common/constants.dart';
import '../models/_models.dart';
import '_api.dart';

class SampleApi extends Api<Sample> {
  static SampleApi? _instance;

  factory SampleApi() => _instance ??= SampleApi._internal();

  SampleApi._internal() {
    // initialization logic here
  }

  @override
  Future<bool> delete(String id) async {
    final http.Response response = await http.delete(
      Uri.parse(Constants.apiUrl+'/sample/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return (response.statusCode == 200);
  }

  @override
  Future<Sample> create(Sample item) async {
    final response = await http.post(
      Uri.parse(Constants.apiUrl+'/sample'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(item.toJson()),
    );

    if (response.statusCode == 201) {
      return Sample.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create $item.');
    }
  }

  @override
  Future<List<Sample>> queryAll() async {
    final response = await http.get(Uri.parse(Constants.apiUrl+'/sample'));

    if (response.statusCode == 200) {
	  return (jsonDecode(response.body) as List).map((item) => Sample.fromJson(item)).toList();
    } else {
      throw Exception('Failed to query Sample.');
    }
  }
  
  @override
  Future<Sample?> queryById(String id) async {
    final response = await http.get(Uri.parse(Constants.apiUrl+'/sample/$id'));

    if (response.statusCode == 200) {
      return Sample.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }
	return null;
  }

  @override
  Future<Sample> update(Sample item, String id) async {
    final response = await http.put(
      Uri.parse(Constants.apiUrl+'/sample/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(item.toJson()),
    );

    if (response.statusCode == 200) {
      return Sample.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to update $item.');
    }
  }
}