class RegHotels {
  String? destId;
  String? destType;
  


  RegHotels({this.destId, this.destType});

  RegHotels.fromJson(Map<String, dynamic> json) {
    destId = json['dest_id'];
    destType = json['dest_type'];
  }
}
