import 'dart:async';

import 'package:uuid/uuid.dart' as uuid;
import 'package:flutter/foundation.dart';

import '../models/_models.dart';
import '_dao.dart';

class SampleDao extends Dao<Sample> {
  static SampleDao? _instance;

  factory SampleDao() => _instance ??= SampleDao._internal();

  SampleDao._internal() {
    // initialization logic here
  }
  
  final Map<String, Sample> _storage = {};
  final StreamController<List<Sample>> _streamController =
      StreamController<List<Sample>>.broadcast();

  @override
  Future<Sample?> delete(String id) async {
    var removed = _storage.remove(id);
    _emit();
    return removed;
  }
  
  @override
  Future<bool> deleteAll() async {
    _storage.clear();
    _emit();
    return true;
  }

  @override
  Sample? get(String id) {
    return _storage[id];
  }
  
  @override
  List<Sample> getAll() {
    return _storage.values.toList();
  }

  @override
  Future<Sample> insert(Sample item) async {
    var id = const uuid.Uuid().v4();
    //var newSample = Sample(name: item.name)..id = id;
	var newSample = item..id = id;
    _storage[id] = newSample;
    _emit();
    return newSample;
  }

  @override
  Future<List<Sample>> fetchAll() async {
    return _storage.values.toList();
  }
  
  @override
  Future<Sample?> fetch(String id) async {
    return _storage[id];
  }

  @override
  Future<Sample> update(Sample item, String id) async {
    _storage[id] = item;
    _emit();
    return item..id = id;
  }

  @override
  Stream<List<Sample>> subscribe() => _streamController.stream;

  void _emit() {
    _streamController.add(_storage.values.toList());
  }
}