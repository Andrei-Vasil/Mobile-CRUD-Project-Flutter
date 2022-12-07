import 'cat.dart';
import '../dao/cat_dao.dart';

class Repository {
  static late final CatDao dao;

  Future<List<Cat>> get catList async => await dao.findAllCats();

  Future<bool> addCat(Cat cat) async {
    try {
      await dao.insertCat(cat);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> deleteCatById(String id) async {
    try {
      final cat = await dao.findCatById(id);
      if (cat == null) return false;
      dao.deleteCat(cat);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> updateCat(Cat cat) async {
    try {
      await dao.updateCat(cat);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<Cat?> getCatById(String id) async {
    return await dao.findCatById(id);
  }
}

Repository repository = Repository();
