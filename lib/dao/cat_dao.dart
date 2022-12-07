import 'package:floor/floor.dart';
import '../model/cat.dart';

@dao
abstract class CatDao {
  @Query('SELECT * FROM Cat')
  Future<List<Cat>> findAllCats();

  @Query('SELECT * FROM Cat WHERE id = :id')
  Future<Cat?> findCatById(String id);

  @insert
  Future<void> insertCat(Cat cat);

  @delete
  Future<void> deleteCat(Cat cat);

  @update
  Future<void> updateCat(Cat cat);
}
