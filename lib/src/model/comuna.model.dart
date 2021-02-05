class Comuna {
  int _id;
  String _comuna;
  Comuna.fromJson(Map<String, dynamic> jsonObject) {
    this._id=jsonObject['id'];
    this._comuna=jsonObject['name'];
  }
}
