import 'dart:ffi';

class Crypto {
  int id;
  int cmc_rank;
  String name;
  String symbol;
  dynamic circulating_supply;
  dynamic total_supply;
  dynamic max_supply;

  Crypto(
    this.id,
    this.cmc_rank,
    this.name,
    this.symbol,
    this.circulating_supply,
    this.total_supply,
    this.max_supply,
  );

  factory Crypto.fromMapJson(Map<String, dynamic> jsonMapObject) {
    return Crypto(
      jsonMapObject['id'],
      jsonMapObject['cmc_rank'],
      jsonMapObject['name'],
      jsonMapObject['symbol'],
      jsonMapObject['circulating_supply'],
      jsonMapObject['total_supply'],
      jsonMapObject['max_supply'],
    );
  }
}
