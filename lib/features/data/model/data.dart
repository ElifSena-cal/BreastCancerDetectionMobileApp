class Data {
  String? diagnosis;
  double? radiusMean;
  double? textureMean;
  double? perimeterMean;
  int? areaMean;
  double? smoothnessMean;
  double? compactnessMean;
  double? concavityMean;
  double? concavePointsMean;
  double? symmetryMean;
  double? fractalDimensionMean;
  double? radiusSe;
  double? textureSe;
  double? perimeterSe;
  double? areaSe;
  double? smoothnessSe;
  double? compactnessSe;
  double? concavitySe;
  double? concavePointsSe;
  double? symmetrySe;
  double? fractalDimensionSe;
  double? radiusWorst;
  double? textureWorst;
  double? perimeterWorst;
  int? areaWorst;
  double? smoothnessWorst;
  double? compactnessWorst;
  double? concavityWorst;
  double? concavePointsWorst;
  double? symmetryWorst;
  double? fractalDimensionWorst;

  Data(
      {this.diagnosis,
      this.radiusMean,
      this.textureMean,
      this.perimeterMean,
      this.areaMean,
      this.smoothnessMean,
      this.compactnessMean,
      this.concavityMean,
      this.concavePointsMean,
      this.symmetryMean,
      this.fractalDimensionMean,
      this.radiusSe,
      this.textureSe,
      this.perimeterSe,
      this.areaSe,
      this.smoothnessSe,
      this.compactnessSe,
      this.concavitySe,
      this.concavePointsSe,
      this.symmetrySe,
      this.fractalDimensionSe,
      this.radiusWorst,
      this.textureWorst,
      this.perimeterWorst,
      this.areaWorst,
      this.smoothnessWorst,
      this.compactnessWorst,
      this.concavityWorst,
      this.concavePointsWorst,
      this.symmetryWorst,
      this.fractalDimensionWorst});

  Data.fromJson(Map<String, dynamic> json) {
    diagnosis = json['diagnosis'];
    radiusMean = json['radius_mean'];
    textureMean = json['texture_mean'];
    perimeterMean = json['perimeter_mean'];
    areaMean = json['area_mean'];
    smoothnessMean = json['smoothness_mean'];
    compactnessMean = json['compactness_mean'];
    concavityMean = json['concavity_mean'];
    concavePointsMean = json['concave points_mean'];
    symmetryMean = json['symmetry_mean'];
    fractalDimensionMean = json['fractal_dimension_mean'];
    radiusSe = json['radius_se'];
    textureSe = json['texture_se'];
    perimeterSe = json['perimeter_se'];
    areaSe = json['area_se'];
    smoothnessSe = json['smoothness_se'];
    compactnessSe = json['compactness_se'];
    concavitySe = json['concavity_se'];
    concavePointsSe = json['concave points_se'];
    symmetrySe = json['symmetry_se'];
    fractalDimensionSe = json['fractal_dimension_se'];
    radiusWorst = json['radius_worst'];
    textureWorst = json['texture_worst'];
    perimeterWorst = json['perimeter_worst'];
    areaWorst = json['area_worst'];
    smoothnessWorst = json['smoothness_worst'];
    compactnessWorst = json['compactness_worst'];
    concavityWorst = json['concavity_worst'];
    concavePointsWorst = json['concave points_worst'];
    symmetryWorst = json['symmetry_worst'];
    fractalDimensionWorst = json['fractal_dimension_worst'];
  }
  List<String> getFeatureNames() {
    return Data().toJson().keys.toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['diagnosis'] = this.diagnosis;
    data['radius_mean'] = this.radiusMean;
    data['texture_mean'] = this.textureMean;
    data['perimeter_mean'] = this.perimeterMean;
    data['area_mean'] = this.areaMean;
    data['smoothness_mean'] = this.smoothnessMean;
    data['compactness_mean'] = this.compactnessMean;
    data['concavity_mean'] = this.concavityMean;
    data['concave points_mean'] = this.concavePointsMean;
    data['symmetry_mean'] = this.symmetryMean;
    data['fractal_dimension_mean'] = this.fractalDimensionMean;
    data['radius_se'] = this.radiusSe;
    data['texture_se'] = this.textureSe;
    data['perimeter_se'] = this.perimeterSe;
    data['area_se'] = this.areaSe;
    data['smoothness_se'] = this.smoothnessSe;
    data['compactness_se'] = this.compactnessSe;
    data['concavity_se'] = this.concavitySe;
    data['concave points_se'] = this.concavePointsSe;
    data['symmetry_se'] = this.symmetrySe;
    data['fractal_dimension_se'] = this.fractalDimensionSe;
    data['radius_worst'] = this.radiusWorst;
    data['texture_worst'] = this.textureWorst;
    data['perimeter_worst'] = this.perimeterWorst;
    data['area_worst'] = this.areaWorst;
    data['smoothness_worst'] = this.smoothnessWorst;
    data['compactness_worst'] = this.compactnessWorst;
    data['concavity_worst'] = this.concavityWorst;
    data['concave points_worst'] = this.concavePointsWorst;
    data['symmetry_worst'] = this.symmetryWorst;
    data['fractal_dimension_worst'] = this.fractalDimensionWorst;
    return data;
  }
}
