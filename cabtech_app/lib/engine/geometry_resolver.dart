import 'dom_obj.dart';

class GeometryResolver {
  static int countResolvableObjects(DomObj domObj) {
    return domObj.objects.where((o) => o.isGeometric).length;
  }
}