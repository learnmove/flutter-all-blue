class TopListDataBeanEntity {
  String message;
  List<TopListDataBeanData> data;
  int code;

  TopListDataBeanEntity({this.message, this.data, this.code});

  TopListDataBeanEntity.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    if (json['Data'] != null) {
      data = new List<TopListDataBeanData>();
      (json['Data'] as List).forEach((v) {
        data.add(new TopListDataBeanData.fromJson(v));
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

class TopListDataBeanData {
  String title;
  String url;
  String desc;

  TopListDataBeanData({this.title, this.url, this.desc});

  TopListDataBeanData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    data['desc'] = this.desc;
    return data;
  }
}
