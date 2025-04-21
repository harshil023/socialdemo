class Demo {
  Demo({
      this.shopId, 
      this.variantId, 
      this.status,});

  Demo.fromJson(dynamic json) {
    shopId = json['shop_id'];
    variantId = json['variant_id'];
    status = json['status'];
  }
  num? shopId;
  num? variantId;
  num? status;
Demo copyWith({  num? shopId,
  num? variantId,
  num? status,
}) => Demo(  shopId: shopId ?? this.shopId,
  variantId: variantId ?? this.variantId,
  status: status ?? this.status,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['shop_id'] = shopId;
    map['variant_id'] = variantId;
    map['status'] = status;
    return map;
  }

}