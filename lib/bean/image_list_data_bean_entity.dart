class ImageListDataBeanEntity {
  int res;
  ImageListDataBeanData data;

  ImageListDataBeanEntity({this.res, this.data});

  ImageListDataBeanEntity.fromJson(Map<String, dynamic> json) {
    res = json['res'];
    data = json['data'] != null
        ? new ImageListDataBeanData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['res'] = this.res;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class ImageListDataBeanData {
  String hpMakettime;
  String contentBgcolor;
  String hpImgUrl;
  String maketime;
  String hpTitle;
  int praisenum;
  int sharenum;
  String hpAuthor;
  String hpContent;
  String templateCategory;
  String ipadUrl;
  String wbImgUrl;
  String webUrl;
  String imageFrom;
  ImageListDataBeanDataShareList shareList;
  String hpcontentId;
  String hpImgOriginalUrl;
  String textAuthors;
  String authorId;
  String textFrom;
  String lastUpdateDate;
  String imageAuthors;
  int commentnum;

  ImageListDataBeanData(
      {this.hpMakettime,
      this.contentBgcolor,
      this.hpImgUrl,
      this.maketime,
      this.hpTitle,
      this.praisenum,
      this.sharenum,
      this.hpAuthor,
      this.hpContent,
      this.templateCategory,
      this.ipadUrl,
      this.wbImgUrl,
      this.webUrl,
      this.imageFrom,
      this.shareList,
      this.hpcontentId,
      this.hpImgOriginalUrl,
      this.textAuthors,
      this.authorId,
      this.textFrom,
      this.lastUpdateDate,
      this.imageAuthors,
      this.commentnum});

  ImageListDataBeanData.fromJson(Map<String, dynamic> json) {
    hpMakettime = json['hp_makettime'];
    contentBgcolor = json['content_bgcolor'];
    hpImgUrl = json['hp_img_url'];
    maketime = json['maketime'];
    hpTitle = json['hp_title'];
    praisenum = json['praisenum'];
    sharenum = json['sharenum'];
    hpAuthor = json['hp_author'];
    hpContent = json['hp_content'];
    templateCategory = json['template_category'];
    ipadUrl = json['ipad_url'];
    wbImgUrl = json['wb_img_url'];
    webUrl = json['web_url'];
    imageFrom = json['image_from'];
    shareList = json['share_list'] != null
        ? new ImageListDataBeanDataShareList.fromJson(json['share_list'])
        : null;
    hpcontentId = json['hpcontent_id'];
    hpImgOriginalUrl = json['hp_img_original_url'];
    textAuthors = json['text_authors'];
    authorId = json['author_id'];
    textFrom = json['text_from'];
    lastUpdateDate = json['last_update_date'];
    imageAuthors = json['image_authors'];
    commentnum = json['commentnum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hp_makettime'] = this.hpMakettime;
    data['content_bgcolor'] = this.contentBgcolor;
    data['hp_img_url'] = this.hpImgUrl;
    data['maketime'] = this.maketime;
    data['hp_title'] = this.hpTitle;
    data['praisenum'] = this.praisenum;
    data['sharenum'] = this.sharenum;
    data['hp_author'] = this.hpAuthor;
    data['hp_content'] = this.hpContent;
    data['template_category'] = this.templateCategory;
    data['ipad_url'] = this.ipadUrl;
    data['wb_img_url'] = this.wbImgUrl;
    data['web_url'] = this.webUrl;
    data['image_from'] = this.imageFrom;
    if (this.shareList != null) {
      data['share_list'] = this.shareList.toJson();
    }
    data['hpcontent_id'] = this.hpcontentId;
    data['hp_img_original_url'] = this.hpImgOriginalUrl;
    data['text_authors'] = this.textAuthors;
    data['author_id'] = this.authorId;
    data['text_from'] = this.textFrom;
    data['last_update_date'] = this.lastUpdateDate;
    data['image_authors'] = this.imageAuthors;
    data['commentnum'] = this.commentnum;
    return data;
  }
}

class ImageListDataBeanDataShareList {
  ImageListDataBeanDataShareListQq qq;
  ImageListDataBeanDataShareListWx wx;
  ImageListDataBeanDataShareListWeibo weibo;
  ImageListDataBeanDataShareListWxTimeline wxTimeline;

  ImageListDataBeanDataShareList(
      {this.qq, this.wx, this.weibo, this.wxTimeline});

  ImageListDataBeanDataShareList.fromJson(Map<String, dynamic> json) {
    qq = json['qq'] != null
        ? new ImageListDataBeanDataShareListQq.fromJson(json['qq'])
        : null;
    wx = json['wx'] != null
        ? new ImageListDataBeanDataShareListWx.fromJson(json['wx'])
        : null;
    weibo = json['weibo'] != null
        ? new ImageListDataBeanDataShareListWeibo.fromJson(json['weibo'])
        : null;
    wxTimeline = json['wx_timeline'] != null
        ? new ImageListDataBeanDataShareListWxTimeline.fromJson(
            json['wx_timeline'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.qq != null) {
      data['qq'] = this.qq.toJson();
    }
    if (this.wx != null) {
      data['wx'] = this.wx.toJson();
    }
    if (this.weibo != null) {
      data['weibo'] = this.weibo.toJson();
    }
    if (this.wxTimeline != null) {
      data['wx_timeline'] = this.wxTimeline.toJson();
    }
    return data;
  }
}

class ImageListDataBeanDataShareListQq {
  String imgUrl;
  String link;
  String audio;
  String title;
  String desc;

  ImageListDataBeanDataShareListQq(
      {this.imgUrl, this.link, this.audio, this.title, this.desc});

  ImageListDataBeanDataShareListQq.fromJson(Map<String, dynamic> json) {
    imgUrl = json['imgUrl'];
    link = json['link'];
    audio = json['audio'];
    title = json['title'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imgUrl'] = this.imgUrl;
    data['link'] = this.link;
    data['audio'] = this.audio;
    data['title'] = this.title;
    data['desc'] = this.desc;
    return data;
  }
}

class ImageListDataBeanDataShareListWx {
  String imgUrl;
  String link;
  String audio;
  String title;
  String desc;

  ImageListDataBeanDataShareListWx(
      {this.imgUrl, this.link, this.audio, this.title, this.desc});

  ImageListDataBeanDataShareListWx.fromJson(Map<String, dynamic> json) {
    imgUrl = json['imgUrl'];
    link = json['link'];
    audio = json['audio'];
    title = json['title'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imgUrl'] = this.imgUrl;
    data['link'] = this.link;
    data['audio'] = this.audio;
    data['title'] = this.title;
    data['desc'] = this.desc;
    return data;
  }
}

class ImageListDataBeanDataShareListWeibo {
  String imgUrl;
  String link;
  String audio;
  String title;
  String desc;

  ImageListDataBeanDataShareListWeibo(
      {this.imgUrl, this.link, this.audio, this.title, this.desc});

  ImageListDataBeanDataShareListWeibo.fromJson(Map<String, dynamic> json) {
    imgUrl = json['imgUrl'];
    link = json['link'];
    audio = json['audio'];
    title = json['title'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imgUrl'] = this.imgUrl;
    data['link'] = this.link;
    data['audio'] = this.audio;
    data['title'] = this.title;
    data['desc'] = this.desc;
    return data;
  }
}

class ImageListDataBeanDataShareListWxTimeline {
  String imgUrl;
  String link;
  String audio;
  String title;
  String desc;

  ImageListDataBeanDataShareListWxTimeline(
      {this.imgUrl, this.link, this.audio, this.title, this.desc});

  ImageListDataBeanDataShareListWxTimeline.fromJson(Map<String, dynamic> json) {
    imgUrl = json['imgUrl'];
    link = json['link'];
    audio = json['audio'];
    title = json['title'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imgUrl'] = this.imgUrl;
    data['link'] = this.link;
    data['audio'] = this.audio;
    data['title'] = this.title;
    data['desc'] = this.desc;
    return data;
  }
}
