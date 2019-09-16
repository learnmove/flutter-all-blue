class TopTypeBeanEntity {
  String message;
  List<TopTypeBeanData> data;
  int code;

  TopTypeBeanEntity({this.message, this.data, this.code});

  TopTypeBeanEntity.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    if (json['Data'] != null) {
      data = new List<TopTypeBeanData>();
      (json['Data'] as List).forEach((v) {
        data.add(new TopTypeBeanData.fromJson(v));
      });
    }
    code = json['Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['Code'] = this.code;
    return data;
  }
}

class TopTypeBeanData {
  String id;
  String sort;
  String title;

  TopTypeBeanData({this.id, this.sort, this.title});

  TopTypeBeanData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sort = json['sort'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sort'] = this.sort;
    data['title'] = this.title;
    return data;
  }
}
