// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'divination_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DivinationResult _$DivinationResultFromJson(Map<String, dynamic> json) =>
    DivinationResult(
      errcode: (json['errcode'] as num).toInt(),
      errmsg: json['errmsg'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DivinationResultToJson(DivinationResult instance) =>
    <String, dynamic>{
      'errcode': instance.errcode,
      'errmsg': instance.errmsg,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  zhen: Zhen.fromJson(json['zhen'] as Map<String, dynamic>),
  sex: json['sex'] as String,
  name: json['name'] as String,
  xmwx: json['xmwx'] as String,
  nylm: json['nylm'] as String,
  wuHou: json['WuHou'] as String,
  getZheng: json['getZheng'] as String,
  getYueXiang: json['getYueXiang'] as String,
  scwg: json['SCWG'] as String,
  gongli: json['gongli'] as String,
  nongli: json['nongli'] as String,
  wanzishiliupai: json['wanzishiliupai'] as String,
  qiyun: json['qiyun'] as String,
  jiaoyun: DateTime.parse(json['jiaoyun'] as String),
  huanyun: json['huanyun'] as String,
  dl1: json['DL1'] as String,
  cl1: json['CL1'] as String,
  dl2: DateTime.parse(json['DL2'] as String),
  cl2: DateTime.parse(json['CL2'] as String),
  dcxc: (json['DCXC'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
  shengxiao: json['shengxiao'] as String,
  xingzuo: json['xingzuo'] as String,
  siling: (json['siling'] as List<dynamic>)
      .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
      .toList(),
  xingxiu: json['xingxiu'] as String,
  xingxiuGeyao: json['xingxiu_geyao'] as String,
  wuxingWangdu: json['wuxing_wangdu'] as String,
  geju: (json['geju'] as List<dynamic>).map((e) => e as String).toList(),
  tianganLiuyi: json['tiangan_liuyi'] as String,
  dizhiLiuyi: json['dizhi_liuyi'] as String,
  bazi: Bazi.fromJson(json['bazi'] as Map<String, dynamic>),
  nayin: Nayin.fromJson(json['nayin'] as Map<String, dynamic>),
  kongwang: Kongwang.fromJson(json['kongwang'] as Map<String, dynamic>),
  shensha: Shensha.fromJson(json['shensha'] as Map<String, dynamic>),
  zizuo: Zizuo.fromJson(json['zizuo'] as Map<String, dynamic>),
  xingyun: Xingyun.fromJson(json['xingyun'] as Map<String, dynamic>),
  shishen: json['shishen'] as Map<String, dynamic>,
  minggua: Minggua.fromJson(json['minggua'] as Map<String, dynamic>),
  xiyongshen: Xiyongshen.fromJson(json['xiyongshen'] as Map<String, dynamic>),
  fx: Fx.fromJson(json['FX'] as Map<String, dynamic>),
  detailInfo: (json['detail_info'] as List<dynamic>)
      .map((e) => DetailInfo.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'zhen': instance.zhen,
  'sex': instance.sex,
  'name': instance.name,
  'xmwx': instance.xmwx,
  'nylm': instance.nylm,
  'WuHou': instance.wuHou,
  'getZheng': instance.getZheng,
  'getYueXiang': instance.getYueXiang,
  'SCWG': instance.scwg,
  'gongli': instance.gongli,
  'nongli': instance.nongli,
  'wanzishiliupai': instance.wanzishiliupai,
  'qiyun': instance.qiyun,
  'jiaoyun': instance.jiaoyun.toIso8601String(),
  'huanyun': instance.huanyun,
  'DL1': instance.dl1,
  'CL1': instance.cl1,
  'DL2': instance.dl2.toIso8601String(),
  'CL2': instance.cl2.toIso8601String(),
  'DCXC': instance.dcxc,
  'shengxiao': instance.shengxiao,
  'xingzuo': instance.xingzuo,
  'siling': instance.siling,
  'xingxiu': instance.xingxiu,
  'xingxiu_geyao': instance.xingxiuGeyao,
  'wuxing_wangdu': instance.wuxingWangdu,
  'geju': instance.geju,
  'tiangan_liuyi': instance.tianganLiuyi,
  'dizhi_liuyi': instance.dizhiLiuyi,
  'bazi': instance.bazi,
  'nayin': instance.nayin,
  'kongwang': instance.kongwang,
  'shensha': instance.shensha,
  'zizuo': instance.zizuo,
  'xingyun': instance.xingyun,
  'shishen': instance.shishen,
  'minggua': instance.minggua,
  'xiyongshen': instance.xiyongshen,
  'FX': instance.fx,
  'detail_info': instance.detailInfo,
};

Bazi _$BaziFromJson(Map<String, dynamic> json) => Bazi(
  ng: json['ng'] as String,
  nz: json['nz'] as String,
  yg: json['yg'] as String,
  yz: json['yz'] as String,
  rg: json['rg'] as String,
  rz: json['rz'] as String,
  sg: json['sg'] as String,
  sz: json['sz'] as String,
  tg: json['tg'] as String,
  tz: json['tz'] as String,
  tg2: json['Tg'] as String,
  tz2: json['Tz'] as String,
  mg: json['mg'] as String,
  mz: json['mz'] as String,
  sg2: json['Sg'] as String,
  sz2: json['Sz'] as String,
);

Map<String, dynamic> _$BaziToJson(Bazi instance) => <String, dynamic>{
  'ng': instance.ng,
  'nz': instance.nz,
  'yg': instance.yg,
  'yz': instance.yz,
  'rg': instance.rg,
  'rz': instance.rz,
  'sg': instance.sg,
  'sz': instance.sz,
  'tg': instance.tg,
  'tz': instance.tz,
  'Tg': instance.tg2,
  'Tz': instance.tz2,
  'mg': instance.mg,
  'mz': instance.mz,
  'Sg': instance.sg2,
  'Sz': instance.sz2,
};

DetailInfo _$DetailInfoFromJson(Map<String, dynamic> json) => DetailInfo(
  dayunIndex: (json['dayun_index'] as num).toInt(),
  dayunStartYear: (json['dayun_start_year'] as num).toInt(),
  dayunStartAge: (json['dayun_start_age'] as num).toInt(),
  dayunEndYear: (json['dayun_end_year'] as num).toInt(),
  dayunEndAge: (json['dayun_end_age'] as num).toInt(),
  dayunStartGanzhi: json['dayun_start_ganzhi'] as String,
  liunianInfo: (json['liunian_info'] as List<dynamic>)
      .map((e) => LiunianInfo.fromJson(e as Map<String, dynamic>))
      .toList(),
  dayunKongwang: json['dayun_kongwang'] as String?,
  dayunDzStarCs: json['dayun_dz_star_cs'] as String?,
  dayunDzSelfCs: json['dayun_dz_self_cs'] as String?,
  dayunNayin: json['dayun_nayin'] as String?,
  dayunTgLiuyi: json['dayun_tg_liuyi'] as String?,
  dayunDzLiuyi: json['dayun_dz_liuyi'] as String?,
  dayunShensha: (json['dayun_shensha'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  dayunQiangruo: json['dayun_qiangruo'] as String?,
);

Map<String, dynamic> _$DetailInfoToJson(DetailInfo instance) =>
    <String, dynamic>{
      'dayun_index': instance.dayunIndex,
      'dayun_start_year': instance.dayunStartYear,
      'dayun_start_age': instance.dayunStartAge,
      'dayun_end_year': instance.dayunEndYear,
      'dayun_end_age': instance.dayunEndAge,
      'dayun_start_ganzhi': instance.dayunStartGanzhi,
      'liunian_info': instance.liunianInfo,
      'dayun_kongwang': instance.dayunKongwang,
      'dayun_dz_star_cs': instance.dayunDzStarCs,
      'dayun_dz_self_cs': instance.dayunDzSelfCs,
      'dayun_nayin': instance.dayunNayin,
      'dayun_tg_liuyi': instance.dayunTgLiuyi,
      'dayun_dz_liuyi': instance.dayunDzLiuyi,
      'dayun_shensha': instance.dayunShensha,
      'dayun_qiangruo': instance.dayunQiangruo,
    };

LiunianInfo _$LiunianInfoFromJson(Map<String, dynamic> json) => LiunianInfo(
  liunianYear: (json['liunian_year'] as num).toInt(),
  liunianAge: (json['liunian_age'] as num).toInt(),
  liunianGanzhi: json['liunian_ganzhi'] as String,
  liunianKongwang: json['liunian_kongwang'] as String,
  liunianDzStarCs: json['liunian_dz_star_cs'] as String,
  liunianDzSelfCs: json['liunian_dz_self_cs'] as String,
  liunianNayin: json['liunian_nayin'] as String,
  liunianTgLiuyi: json['liunian_tg_liuyi'] as String,
  liunianDzLiuyi: json['liunian_dz_liuyi'] as String,
  liunianShensha: (json['liunian_shensha'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  liunianQiangruo: json['liunian_qiangruo'] as String,
  liunianYunshi: json['liunian_yunshi'] as String,
  liunianTiandiyun: (json['liunian_tiandiyun'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  xiaoyunGanzhi: json['xiaoyun_ganzhi'] as String,
  xiaoyunKongwang: json['xiaoyun_kongwang'] as String,
  xiaoyunDzStarCs: json['xiaoyun_dz_star_cs'] as String,
  xiaoyunDzSelfCs: json['xiaoyun_dz_self_cs'] as String,
  xiaoyunNayin: json['xiaoyun_nayin'] as String,
  xiaoyunShensha: (json['xiaoyun_shensha'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$LiunianInfoToJson(LiunianInfo instance) =>
    <String, dynamic>{
      'liunian_year': instance.liunianYear,
      'liunian_age': instance.liunianAge,
      'liunian_ganzhi': instance.liunianGanzhi,
      'liunian_kongwang': instance.liunianKongwang,
      'liunian_dz_star_cs': instance.liunianDzStarCs,
      'liunian_dz_self_cs': instance.liunianDzSelfCs,
      'liunian_nayin': instance.liunianNayin,
      'liunian_tg_liuyi': instance.liunianTgLiuyi,
      'liunian_dz_liuyi': instance.liunianDzLiuyi,
      'liunian_shensha': instance.liunianShensha,
      'liunian_qiangruo': instance.liunianQiangruo,
      'liunian_yunshi': instance.liunianYunshi,
      'liunian_tiandiyun': instance.liunianTiandiyun,
      'xiaoyun_ganzhi': instance.xiaoyunGanzhi,
      'xiaoyun_kongwang': instance.xiaoyunKongwang,
      'xiaoyun_dz_star_cs': instance.xiaoyunDzStarCs,
      'xiaoyun_dz_self_cs': instance.xiaoyunDzSelfCs,
      'xiaoyun_nayin': instance.xiaoyunNayin,
      'xiaoyun_shensha': instance.xiaoyunShensha,
    };

Fx _$FxFromJson(Map<String, dynamic> json) => Fx(
  cgg: (json['cgg'] as List<dynamic>).map((e) => e as String).toList(),
  qiongtongbaojian: json['qiongtongbaojian'] as String,
  ditiansui: json['ditiansui'] as String,
  sanmingtonghui: (json['sanmingtonghui'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  bazitiyao: (json['bazitiyao'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  shenfengtongkao: (json['shenfengtongkao'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  tianwuwuxian: json['tianwuwuxian'] as String,
  wuxingjingji: (json['wuxingjingji'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  lixuzhongmingshu: (json['lixuzhongmingshu'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  xiyongshencankao: (json['xiyongshencankao'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  liangtoqian: json['liangtoqian'] as String,
  gewuzhiyan: json['gewuzhiyan'] as String,
  wglm: json['WGLM'] as String,
  yrjfx: json['YRJPFX'] as String,
  zncs: (json['zncs'] as List<dynamic>).map((e) => e as String).toList(),
  kwsc2: (json['KWSC2'] as List<dynamic>).map((e) => e as String).toList(),
  rizhufenxi: Rizhufenxi.fromJson(json['rizhufenxi'] as Map<String, dynamic>),
  xingZuo: XingZuo.fromJson(json['XingZuo'] as Map<String, dynamic>),
  gdlm: (json['GDLM'] as List<dynamic>).map((e) => e as String).toList(),
  scwg: (json['SCWG'] as List<dynamic>).map((e) => e as String).toList(),
  gxsm: (json['GXSM'] as List<dynamic>).map((e) => e as String).toList(),
  ggxth: (json['GGXTH'] as List<dynamic>).map((e) => e as String).toList(),
  xwsc: (json['XWSC'] as List<dynamic>).map((e) => e as String).toList(),
  diMuJing: (json['DiMuJing'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  sanShi: (json['SanShi'] as List<dynamic>).map((e) => e as String).toList(),
  shoShengZhai: (json['ShoShengZhai'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$FxToJson(Fx instance) => <String, dynamic>{
  'cgg': instance.cgg,
  'qiongtongbaojian': instance.qiongtongbaojian,
  'ditiansui': instance.ditiansui,
  'sanmingtonghui': instance.sanmingtonghui,
  'bazitiyao': instance.bazitiyao,
  'shenfengtongkao': instance.shenfengtongkao,
  'tianwuwuxian': instance.tianwuwuxian,
  'wuxingjingji': instance.wuxingjingji,
  'lixuzhongmingshu': instance.lixuzhongmingshu,
  'xiyongshencankao': instance.xiyongshencankao,
  'liangtoqian': instance.liangtoqian,
  'gewuzhiyan': instance.gewuzhiyan,
  'WGLM': instance.wglm,
  'YRJPFX': instance.yrjfx,
  'zncs': instance.zncs,
  'KWSC2': instance.kwsc2,
  'rizhufenxi': instance.rizhufenxi,
  'XingZuo': instance.xingZuo,
  'GDLM': instance.gdlm,
  'SCWG': instance.scwg,
  'GXSM': instance.gxsm,
  'GGXTH': instance.ggxth,
  'XWSC': instance.xwsc,
  'DiMuJing': instance.diMuJing,
  'SanShi': instance.sanShi,
  'ShoShengZhai': instance.shoShengZhai,
};

Rizhufenxi _$RizhufenxiFromJson(Map<String, dynamic> json) => Rizhufenxi(
  riGanXinXing: json['日干心性'] as String,
  riGanZhiCengCi: json['日干支层次'] as String,
  riGanZhiFenXi: json['日干支分析'] as String,
  xingGeFenXi: json['性格分析'] as String,
  aiQingFenXi: json['爱情分析'] as String,
  shiYeFenXi: json['事业分析'] as String,
  caiYunFenXi: json['财运分析'] as String,
  jianKangFenXi: json['健康分析'] as String,
);

Map<String, dynamic> _$RizhufenxiToJson(Rizhufenxi instance) =>
    <String, dynamic>{
      '日干心性': instance.riGanXinXing,
      '日干支层次': instance.riGanZhiCengCi,
      '日干支分析': instance.riGanZhiFenXi,
      '性格分析': instance.xingGeFenXi,
      '爱情分析': instance.aiQingFenXi,
      '事业分析': instance.shiYeFenXi,
      '财运分析': instance.caiYunFenXi,
      '健康分析': instance.jianKangFenXi,
    };

XingZuo _$XingZuoFromJson(Map<String, dynamic> json) => XingZuo(
  jiaoSe: json['角色'] as String,
  yueFen: json['月份'] as String,
  teDian: json['特点'] as String,
  xiang: json['象'] as String,
  zhangGuanGongWei: json['掌管宫位'] as String,
  zuiDaTeZheng: json['最大特征'] as String,
  zhuGuanXing: json['主管星'] as String,
  xingGeTeZheng: json['性格特征'] as String,
  youDian: json['优点'] as String,
  queDian: json['缺点'] as String,
);

Map<String, dynamic> _$XingZuoToJson(XingZuo instance) => <String, dynamic>{
  '角色': instance.jiaoSe,
  '月份': instance.yueFen,
  '特点': instance.teDian,
  '象': instance.xiang,
  '掌管宫位': instance.zhangGuanGongWei,
  '最大特征': instance.zuiDaTeZheng,
  '主管星': instance.zhuGuanXing,
  '性格特征': instance.xingGeTeZheng,
  '优点': instance.youDian,
  '缺点': instance.queDian,
};

Kongwang _$KongwangFromJson(Map<String, dynamic> json) => Kongwang(
  nz: json['nz'] as String,
  yz: json['yz'] as String,
  rz: json['rz'] as String,
  sz: json['sz'] as String,
  tz: json['tz'] as String,
  tz2: json['Tz'] as String,
  mz: json['mz'] as String,
  sz2: json['Sz'] as String,
);

Map<String, dynamic> _$KongwangToJson(Kongwang instance) => <String, dynamic>{
  'nz': instance.nz,
  'yz': instance.yz,
  'rz': instance.rz,
  'sz': instance.sz,
  'tz': instance.tz,
  'Tz': instance.tz2,
  'mz': instance.mz,
  'Sz': instance.sz2,
};

Minggua _$MingguaFromJson(Map<String, dynamic> json) => Minggua(
  zg: json['zg'] as String,
  b: json['b'] as String,
  db: json['db'] as String,
  d: json['d'] as String,
  dn: json['dn'] as String,
  n: json['n'] as String,
  xn: json['xn'] as String,
  x: json['x'] as String,
  xb: json['xb'] as String,
  jbk: json['jbk'] as String,
  fsk: json['fsk'] as String,
);

Map<String, dynamic> _$MingguaToJson(Minggua instance) => <String, dynamic>{
  'zg': instance.zg,
  'b': instance.b,
  'db': instance.db,
  'd': instance.d,
  'dn': instance.dn,
  'n': instance.n,
  'xn': instance.xn,
  'x': instance.x,
  'xb': instance.xb,
  'jbk': instance.jbk,
  'fsk': instance.fsk,
};

Nayin _$NayinFromJson(Map<String, dynamic> json) => Nayin(
  nz: json['nz'] as String,
  yz: json['yz'] as String,
  rz: json['rz'] as String,
  sz: json['sz'] as String,
  tg: json['tg'] as String,
  tg2: json['Tg'] as String,
  mg: json['mg'] as String,
  sg2: json['Sg'] as String,
);

Map<String, dynamic> _$NayinToJson(Nayin instance) => <String, dynamic>{
  'nz': instance.nz,
  'yz': instance.yz,
  'rz': instance.rz,
  'sz': instance.sz,
  'tg': instance.tg,
  'Tg': instance.tg2,
  'mg': instance.mg,
  'Sg': instance.sg2,
};

Shensha _$ShenshaFromJson(Map<String, dynamic> json) => Shensha(
  nz: (json['nz'] as List<dynamic>).map((e) => e as String).toList(),
  yz: (json['yz'] as List<dynamic>).map((e) => e as String).toList(),
  rz: (json['rz'] as List<dynamic>).map((e) => e as String).toList(),
  sz: (json['sz'] as List<dynamic>).map((e) => e as String).toList(),
  tz: (json['tz'] as List<dynamic>).map((e) => e as String).toList(),
  tz2: (json['Tz'] as List<dynamic>).map((e) => e as String).toList(),
  mz: (json['mz'] as List<dynamic>).map((e) => e as String).toList(),
  sz2: (json['Sz'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$ShenshaToJson(Shensha instance) => <String, dynamic>{
  'nz': instance.nz,
  'yz': instance.yz,
  'rz': instance.rz,
  'sz': instance.sz,
  'tz': instance.tz,
  'Tz': instance.tz2,
  'mz': instance.mz,
  'Sz': instance.sz2,
};

Xingyun _$XingyunFromJson(Map<String, dynamic> json) => Xingyun(
  nz: json['nz'] as String,
  yz: json['yz'] as String,
  rz: json['rz'] as String,
  sz: json['sz'] as String,
  tz: json['tz'] as String,
  tz2: json['Tz'] as String,
  mz: json['mz'] as String,
  sz2: json['Sz'] as String,
);

Map<String, dynamic> _$XingyunToJson(Xingyun instance) => <String, dynamic>{
  'nz': instance.nz,
  'yz': instance.yz,
  'rz': instance.rz,
  'sz': instance.sz,
  'tz': instance.tz,
  'Tz': instance.tz2,
  'mz': instance.mz,
  'Sz': instance.sz2,
};

Xiyongshen _$XiyongshenFromJson(Map<String, dynamic> json) => Xiyongshen(
  qiangruo: json['qiangruo'] as List<dynamic>,
  zh: json['zh'] as List<dynamic>,
  ltgxTongJi: (json['LTGXTongJi'] as List<dynamic>)
      .map((e) => num.tryParse(e.toString())?.toInt() ?? 0)
      .toList(),
  zaoShi: json['ZaoShi'] as String,
  wdlsf: json['WDLSSF'] as List<dynamic>,
  ydwxsf: json['YDWXSF'] as List<dynamic>,
  phYongShen: (json['PHYongShen'] as List<dynamic>)
      .map((e) => e.toString())
      .toList(),
  thYongShen: json['THYongShen'] as List<dynamic>,
  pdXiYongShen: json['PDXiYongShen'] as List<dynamic>,
  hoTianXiYongFx: json['HoTianXiYongFX'] as List<dynamic>,
);

Map<String, dynamic> _$XiyongshenToJson(Xiyongshen instance) =>
    <String, dynamic>{
      'qiangruo': instance.qiangruo,
      'zh': instance.zh,
      'LTGXTongJi': instance.ltgxTongJi,
      'ZaoShi': instance.zaoShi,
      'WDLSSF': instance.wdlsf,
      'YDWXSF': instance.ydwxsf,
      'PHYongShen': instance.phYongShen,
      'THYongShen': instance.thYongShen,
      'PDXiYongShen': instance.pdXiYongShen,
      'HoTianXiYongFX': instance.hoTianXiYongFx,
    };

Zhen _$ZhenFromJson(Map<String, dynamic> json) => Zhen(
  sheng: json['sheng'] as String,
  shi: json['shi'] as String,
  xian: json['xian'] as String,
  bw: (json['bw'] as num).toDouble(),
  dj: (json['dj'] as num).toDouble(),
  ztysc: json['ZTYSC'] as String,
  xls: json['xls'],
  bjhs: json['bjhs'],
  zQrq: json['Z_QRQ'] as String,
);

Map<String, dynamic> _$ZhenToJson(Zhen instance) => <String, dynamic>{
  'sheng': instance.sheng,
  'shi': instance.shi,
  'xian': instance.xian,
  'bw': instance.bw,
  'dj': instance.dj,
  'ZTYSC': instance.ztysc,
  'xls': instance.xls,
  'bjhs': instance.bjhs,
  'Z_QRQ': instance.zQrq,
};

Zizuo _$ZizuoFromJson(Map<String, dynamic> json) => Zizuo(
  nz: json['nz'] as String,
  yz: json['yz'] as String,
  rz: json['rz'] as String,
  sz: json['sz'] as String,
  tz: json['tz'] as String,
  tz2: json['Tz'] as String,
  mz: json['mz'] as String,
  sz2: json['Sz'] as String,
);

Map<String, dynamic> _$ZizuoToJson(Zizuo instance) => <String, dynamic>{
  'nz': instance.nz,
  'yz': instance.yz,
  'rz': instance.rz,
  'sz': instance.sz,
  'tz': instance.tz,
  'Tz': instance.tz2,
  'mz': instance.mz,
  'Sz': instance.sz2,
};
