class LatestNewsModel {
  String? id;
  String? title;
  String? description;
  String? url;
  String? author;
  String? image;
  String? language;
  List<String>? category;
  String? published;

  LatestNewsModel(
      {this.id,
      this.title,
      this.description,
      this.url,
      this.author,
      this.image,
      this.language,
      this.category,
      this.published});

  LatestNewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    author = json['author'];
    image = json['image'];
    language = json['language'];
    category = json['category'].cast<String>();
    published = json['published'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['author'] = author;
    data['image'] = image;
    data['language'] = language;
    data['category'] = category;
    data['published'] = published;
    return data;
  }
}
