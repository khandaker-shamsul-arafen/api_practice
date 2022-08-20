import 'Dataseries.dart';

class Wea {
  Wea({
      required this.product,
      required this.init,
      required this.dataseries,});

   Wea.fromJson(dynamic json) {
    product = json['product'];
    init = json['init'];
    if (json['dataseries'] != null) {
      dataseries = [];
      json['dataseries'].forEach((v) {
        dataseries.add(Dataseries.fromJson(v));
      });
    }
  }
 late String product;
  late String init;
 late List<Dataseries> dataseries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product'] = product;
    map['init'] = init;
    if (dataseries != null) {
      map['dataseries'] = dataseries.map((v) => v.toJson()).toList();
    }
    return map;
  }

}