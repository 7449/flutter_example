class BaseEntity {
  static Map<String, dynamic> checkEntity(Map<String, dynamic> json) {
    if (json['code'] != 0) {
      throw Error();
    }
    return json['data'];
  }
}
