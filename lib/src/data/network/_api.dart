export 'sample_api.dart';

abstract class Api<T> {
  Future<bool> delete(String id);

  Future<T> create(T item);
  
  Future<List<T>> queryAll();
  
  Future<T?> queryById(String id);

  Future<T> update(T item, String id);
}