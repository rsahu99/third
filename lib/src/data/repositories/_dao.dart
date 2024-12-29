export 'sample_dao.dart';

abstract class Dao<T> {
  Future<T?> delete(String id);
  
  Future<bool> deleteAll();

  T? get(String id);
  
  List<T> getAll();

  Future<T> insert(T item);
  
  Future<List<T>> fetchAll();
  
  Future<T?> fetch(String id);

  Future<T> update(T item, String id);

  Stream<List<T>> subscribe();
}