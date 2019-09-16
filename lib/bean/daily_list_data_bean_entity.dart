class DailyListDataBeanEntity {
  String date;
  List<DailyListDataBeanStory> stories;

  DailyListDataBeanEntity({this.date, this.stories});

  DailyListDataBeanEntity.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['stories'] != null) {
      stories = new List<DailyListDataBeanStory>();
      (json['stories'] as List).forEach((v) {
        stories.add(new DailyListDataBeanStory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.stories != null) {
      data['stories'] = this.stories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DailyListDataBeanStory {
  List<String> images;
  String hint;
  String gaPrefix;
  String imageHue;
  int id;
  String title;
  int type;
  String url;

  DailyListDataBeanStory(
      {this.images,
      this.hint,
      this.gaPrefix,
      this.imageHue,
      this.id,
      this.title,
      this.type,
      this.url});

  DailyListDataBeanStory.fromJson(Map<String, dynamic> json) {
    images = json['images']?.cast<String>();
    hint = json['hint'];
    gaPrefix = json['ga_prefix'];
    imageHue = json['image_hue'];
    id = json['id'];
    title = json['title'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = this.images;
    data['hint'] = this.hint;
    data['ga_prefix'] = this.gaPrefix;
    data['image_hue'] = this.imageHue;
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}
