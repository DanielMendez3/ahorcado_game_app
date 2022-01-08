import 'dart:convert';

GetWordModelResponse getWordModelResponseFromMap(String str) =>
    GetWordModelResponse.fromMap(json.decode(str));

String getWordModelResponseToMap(GetWordModelResponse data) =>
    json.encode(data.toMap());

class GetWordModelResponse {
  GetWordModelResponse({
    required this.apiOwner,
    required this.body,
  });

  ApiOwner apiOwner;
  Body body;

  factory GetWordModelResponse.fromMap(Map<String, dynamic> json) =>
      GetWordModelResponse(
        apiOwner: ApiOwner.fromMap(json["api_owner"]),
        body: Body.fromMap(json["body"]),
      );

  Map<String, dynamic> toMap() => {
        "api_owner": apiOwner.toMap(),
        "body": body.toMap(),
      };
}

class ApiOwner {
  ApiOwner({
    required this.author,
    required this.cafecito,
    required this.instagram,
    required this.github,
    required this.linkedin,
    required this.twitter,
  });

  String author;
  String cafecito;
  String instagram;
  String github;
  String linkedin;
  String twitter;

  factory ApiOwner.fromMap(Map<String, dynamic> json) => ApiOwner(
        author: json["author"],
        cafecito: json["cafecito"],
        instagram: json["instagram"],
        github: json["github"],
        linkedin: json["linkedin"],
        twitter: json["twitter"],
      );

  Map<String, dynamic> toMap() => {
        "author": author,
        "cafecito": cafecito,
        "instagram": instagram,
        "github": github,
        "linkedin": linkedin,
        "twitter": twitter,
      };
}

class Body {
  Body({
    required this.word,
    required this.definition,
    required this.author,
    required this.errorMessage,
    required this.encodingWebName,
    required this.wordOrigin,
    required this.urlDefinitionSource,
    required this.urls,
    required this.definitionMd,
    required this.related,
  });

  String word;
  String definition;
  String author;
  dynamic errorMessage;
  String encodingWebName;
  dynamic wordOrigin;
  dynamic urlDefinitionSource;
  Urls urls;
  String definitionMd;
  List<Related> related;

  factory Body.fromMap(Map<String, dynamic> json) => Body(
        word: json["Word"],
        definition: json["Definition"],
        author: json["Author"],
        errorMessage: json["ErrorMessage"],
        encodingWebName: json["EncodingWebName"],
        wordOrigin: json["WordOrigin"],
        urlDefinitionSource: json["UrlDefinitionSource"],
        urls: Urls.fromMap(json["urls"]),
        definitionMd: json["DefinitionMD"],
        related:
            List<Related>.from(json["Related"].map((x) => Related.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Word": word,
        "Definition": definition,
        "Author": author,
        "ErrorMessage": errorMessage,
        "EncodingWebName": encodingWebName,
        "WordOrigin": wordOrigin,
        "UrlDefinitionSource": urlDefinitionSource,
        "urls": urls.toMap(),
        "DefinitionMD": definitionMd,
        "Related": List<dynamic>.from(related.map((x) => x.toMap())),
      };
}

class Related {
  Related({
    required this.word,
    required this.urls,
  });

  String word;
  Urls urls;

  factory Related.fromMap(Map<String, dynamic> json) => Related(
        word: json["Word"],
        urls: Urls.fromMap(json["urls"]),
      );

  Map<String, dynamic> toMap() => {
        "Word": word,
        "urls": urls.toMap(),
      };
}

class Urls {
  Urls({
    required this.url,
    required this.wiktionary,
    required this.wikipedia,
    required this.thumbnail,
    required this.image,
  });

  String url;
  String wiktionary;
  String wikipedia;
  String thumbnail;
  String image;

  factory Urls.fromMap(Map<String, dynamic> json) => Urls(
        url: json["url"],
        wiktionary: json["wiktionary"],
        wikipedia: json["wikipedia"],
        thumbnail: json["thumbnail"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "wiktionary": wiktionary,
        "wikipedia": wikipedia,
        "thumbnail": thumbnail,
        "image": image,
      };
}
