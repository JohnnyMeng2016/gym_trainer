class ActionInfo {
  ActionInfo({
      this.id, 
      this.name, 
      this.nameEn, 
      this.initial, 
      this.initialEn, 
      this.iconName, 
      this.imageName, 
      this.videoName, 
      this.hasVideo, 
      this.actionClassP, 
      this.activityP, 
      this.addSourceP, 
      this.bodyPartsP, 
      this.calculationP, 
      this.guideP, 
      this.guideList, 
      this.guideEnP, 
      this.guideListEn, 
      this.addCount,});

  ActionInfo.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameEn = json['name_en'];
    initial = json['initial'];
    initialEn = json['initial_en'];
    iconName = json['iconName'];
    imageName = json['imageName'];
    videoName = json['videoName'];
    hasVideo = json['hasVideo'];
    actionClassP = json['actionClass_p'];
    activityP = json['activity_p'];
    addSourceP = json['addSource_p'];
    bodyPartsP = json['bodyParts_p'];
    calculationP = json['calculation_p'];
    guideP = json['guide_p'];
    guideEnP = json['guideEn_p'];
    addCount = json['addCount'];
  }
  String? id;
  String? name;
  String? nameEn;
  String? initial;
  String? initialEn;
  String? iconName;
  String? imageName;
  String? videoName;
  bool? hasVideo;
  int? actionClassP;
  int? activityP;
  int? addSourceP;
  int? bodyPartsP;
  int? calculationP;
  String? guideP;
  List<dynamic>? guideList;
  String? guideEnP;
  List<dynamic>? guideListEn;
  int? addCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['name_en'] = nameEn;
    map['initial'] = initial;
    map['initial_en'] = initialEn;
    map['iconName'] = iconName;
    map['imageName'] = imageName;
    map['videoName'] = videoName;
    map['hasVideo'] = hasVideo;
    map['actionClass_p'] = actionClassP;
    map['activity_p'] = activityP;
    map['addSource_p'] = addSourceP;
    map['bodyParts_p'] = bodyPartsP;
    map['calculation_p'] = calculationP;
    map['guide_p'] = guideP;
    if (guideList != null) {
      map['guideList'] = guideList?.map((v) => v.toJson()).toList();
    }
    map['guideEn_p'] = guideEnP;
    if (guideListEn != null) {
      map['guideListEn'] = guideListEn?.map((v) => v.toJson()).toList();
    }
    map['addCount'] = addCount;
    return map;
  }

}