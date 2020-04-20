import 'package:moor_flutter/moor_flutter.dart';
import 'package:nigeriannews/model/articles.dart';

part 'favourites.g.dart';

class Favourites extends Table{
  //IntColumn get id => integer().autoIncrement()();
  TextColumn get author => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get url => text()();
  TextColumn get content => text()();
}
@UseMoor(
  tables: [Favourites]
)
class MyDatabase extends _$MyDatabase{
   MyDatabase(): super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  @override
  
  int get schemaVersion => 1;

  Future<List<Favourite>> get allFavourites => select(favourites).get();

  // void addFavorites(Article article){ 
  //   var favourite = Favourite(
  //    // id: article.contents, 
  //     author: article.author, 
  //     title: article.title, 
  //     description: article.description,
  //     url: article.url,
  //      content: article.contents);
  //   into(favourites).insert(favourite);}

  void addFavourite(Favourite f)=> into(favourites).insert(f);

  void removeFavorites(String ti)=>
     (delete(favourites)..where((t) => t.title.equals(ti))).go();
  


  Stream<bool> isFavourites(String title) {
    return (select(favourites)..where((favourite) => favourite.title.equals(title))).watch().map((favouriteList) => favouriteList.length >1);

}}