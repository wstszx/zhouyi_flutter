import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'divination_result.g.dart';

DivinationResult divinationResultFromJson(String str) => DivinationResult.fromJson(json.decode(str));

String divinationResultToJson(DivinationResult data) => json.encode(data.toJson());

@JsonSerializable()
class DivinationResult {
    final int errcode;
    final String errmsg;
    final Data data;

    DivinationResult({
        required this.errcode,
        required this.errmsg,
        required this.data,
    });

    factory DivinationResult.fromJson(Map<String, dynamic> json) => _$DivinationResultFromJson(json);
    Map<String, dynamic> toJson() => _$DivinationResultToJson(this);
}

@JsonSerializable()
class Data {
    final Zhen zhen;
    final String sex;
    final String name;
    final String xmwx;
    final String nylm;
    @JsonKey(name: 'WuHou')
    final String wuHou;
    final String getZheng;
    final String getYueXiang;
    @JsonKey(name: 'SCWG')
    final String scwg;
    final String gongli;
    final String nongli;
    final String wanzishiliupai;
    final String qiyun;
    final DateTime jiaoyun;
    final String huanyun;
    @JsonKey(name: 'DL1')
    final String dl1;
    @JsonKey(name: 'CL1')
    final String cl1;
    @JsonKey(name: 'DL2')
    final DateTime dl2;
    @JsonKey(name: 'CL2')
    final DateTime cl2;
    @JsonKey(name: 'DCXC')
    final List<int> dcxc;
    final String shengxiao;
    final String xingzuo;
    final List<List<String>> siling;
    final String xingxiu;
    @JsonKey(name: 'xingxiu_geyao')
    final String xingxiuGeyao;
    @JsonKey(name: 'wuxing_wangdu')
    final String wuxingWangdu;
    final List<String> geju;
    @JsonKey(name: 'tiangan_liuyi')
    final String tianganLiuyi;
    @JsonKey(name: 'dizhi_liuyi')
    final String dizhiLiuyi;
    final Bazi bazi;
    final Nayin nayin;
    final Kongwang kongwang;
    final Shensha shensha;
    final Zizuo zizuo;
    final Xingyun xingyun;
    final Map<String, dynamic> shishen;
    final Minggua minggua;
    final Xiyongshen xiyongshen;
    @JsonKey(name: 'FX')
    final Fx fx;
    @JsonKey(name: 'detail_info')
    final List<DetailInfo> detailInfo;

    Data({
        required this.zhen,
        required this.sex,
        required this.name,
        required this.xmwx,
        required this.nylm,
        required this.wuHou,
        required this.getZheng,
        required this.getYueXiang,
        required this.scwg,
        required this.gongli,
        required this.nongli,
        required this.wanzishiliupai,
        required this.qiyun,
        required this.jiaoyun,
        required this.huanyun,
        required this.dl1,
        required this.cl1,
        required this.dl2,
        required this.cl2,
        required this.dcxc,
        required this.shengxiao,
        required this.xingzuo,
        required this.siling,
        required this.xingxiu,
        required this.xingxiuGeyao,
        required this.wuxingWangdu,
        required this.geju,
        required this.tianganLiuyi,
        required this.dizhiLiuyi,
        required this.bazi,
        required this.nayin,
        required this.kongwang,
        required this.shensha,
        required this.zizuo,
        required this.xingyun,
        required this.shishen,
        required this.minggua,
        required this.xiyongshen,
        required this.fx,
        required this.detailInfo,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
    Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Bazi {
    final String ng;
    final String nz;
    final String yg;
    final String yz;
    final String rg;
    final String rz;
    final String sg;
    final String sz;
    final String tg;
    final String tz;
    @JsonKey(name: 'Tg')
    final String tg2;
    @JsonKey(name: 'Tz')
    final String tz2;
    final String mg;
    final String mz;
    @JsonKey(name: 'Sg')
    final String sg2;
    @JsonKey(name: 'Sz')
    final String sz2;

    Bazi({
        required this.ng,
        required this.nz,
        required this.yg,
        required this.yz,
        required this.rg,
        required this.rz,
        required this.sg,
        required this.sz,
        required this.tg,
        required this.tz,
        required this.tg2,
        required this.tz2,
        required this.mg,
        required this.mz,
        required this.sg2,
        required this.sz2,
    });

    factory Bazi.fromJson(Map<String, dynamic> json) => _$BaziFromJson(json);
    Map<String, dynamic> toJson() => _$BaziToJson(this);
}

@JsonSerializable()
class DetailInfo {
    @JsonKey(name: 'dayun_index')
    final int dayunIndex;
    @JsonKey(name: 'dayun_start_year')
    final int dayunStartYear;
    @JsonKey(name: 'dayun_start_age')
    final int dayunStartAge;
    @JsonKey(name: 'dayun_end_year')
    final int dayunEndYear;
    @JsonKey(name: 'dayun_end_age')
    final int dayunEndAge;
    @JsonKey(name: 'dayun_start_ganzhi')
    final String dayunStartGanzhi;
    @JsonKey(name: 'liunian_info')
    final List<LiunianInfo> liunianInfo;
    @JsonKey(name: 'dayun_kongwang')
    final String? dayunKongwang;
    @JsonKey(name: 'dayun_dz_star_cs')
    final String? dayunDzStarCs;
    @JsonKey(name: 'dayun_dz_self_cs')
    final String? dayunDzSelfCs;
    @JsonKey(name: 'dayun_nayin')
    final String? dayunNayin;
    @JsonKey(name: 'dayun_tg_liuyi')
    final String? dayunTgLiuyi;
    @JsonKey(name: 'dayun_dz_liuyi')
    final String? dayunDzLiuyi;
    @JsonKey(name: 'dayun_shensha')
    final List<String>? dayunShensha;
    @JsonKey(name: 'dayun_qiangruo')
    final String? dayunQiangruo;

    DetailInfo({
        required this.dayunIndex,
        required this.dayunStartYear,
        required this.dayunStartAge,
        required this.dayunEndYear,
        required this.dayunEndAge,
        required this.dayunStartGanzhi,
        required this.liunianInfo,
        this.dayunKongwang,
        this.dayunDzStarCs,
        this.dayunDzSelfCs,
        this.dayunNayin,
        this.dayunTgLiuyi,
        this.dayunDzLiuyi,
        this.dayunShensha,
        this.dayunQiangruo,
    });

    factory DetailInfo.fromJson(Map<String, dynamic> json) => _$DetailInfoFromJson(json);
    Map<String, dynamic> toJson() => _$DetailInfoToJson(this);
}

@JsonSerializable()
class LiunianInfo {
    @JsonKey(name: 'liunian_year')
    final int liunianYear;
    @JsonKey(name: 'liunian_age')
    final int liunianAge;
    @JsonKey(name: 'liunian_ganzhi')
    final String liunianGanzhi;
    @JsonKey(name: 'liunian_kongwang')
    final String liunianKongwang;
    @JsonKey(name: 'liunian_dz_star_cs')
    final String liunianDzStarCs;
    @JsonKey(name: 'liunian_dz_self_cs')
    final String liunianDzSelfCs;
    @JsonKey(name: 'liunian_nayin')
    final String liunianNayin;
    @JsonKey(name: 'liunian_tg_liuyi')
    final String liunianTgLiuyi;
    @JsonKey(name: 'liunian_dz_liuyi')
    final String liunianDzLiuyi;
    @JsonKey(name: 'liunian_shensha')
    final List<String> liunianShensha;
    @JsonKey(name: 'liunian_qiangruo')
    final String liunianQiangruo;
    @JsonKey(name: 'liunian_yunshi')
    final String liunianYunshi;
    @JsonKey(name: 'liunian_tiandiyun')
    final List<String> liunianTiandiyun;
    @JsonKey(name: 'xiaoyun_ganzhi')
    final String xiaoyunGanzhi;
    @JsonKey(name: 'xiaoyun_kongwang')
    final String xiaoyunKongwang;
    @JsonKey(name: 'xiaoyun_dz_star_cs')
    final String xiaoyunDzStarCs;
    @JsonKey(name: 'xiaoyun_dz_self_cs')
    final String xiaoyunDzSelfCs;
    @JsonKey(name: 'xiaoyun_nayin')
    final String xiaoyunNayin;
    @JsonKey(name: 'xiaoyun_shensha')
    final List<String> xiaoyunShensha;

    LiunianInfo({
        required this.liunianYear,
        required this.liunianAge,
        required this.liunianGanzhi,
        required this.liunianKongwang,
        required this.liunianDzStarCs,
        required this.liunianDzSelfCs,
        required this.liunianNayin,
        required this.liunianTgLiuyi,
        required this.liunianDzLiuyi,
        required this.liunianShensha,
        required this.liunianQiangruo,
        required this.liunianYunshi,
        required this.liunianTiandiyun,
        required this.xiaoyunGanzhi,
        required this.xiaoyunKongwang,
        required this.xiaoyunDzStarCs,
        required this.xiaoyunDzSelfCs,
        required this.xiaoyunNayin,
        required this.xiaoyunShensha,
    });

    factory LiunianInfo.fromJson(Map<String, dynamic> json) => _$LiunianInfoFromJson(json);
    Map<String, dynamic> toJson() => _$LiunianInfoToJson(this);
}

@JsonSerializable()
class Fx {
    final List<String> cgg;
    final String qiongtongbaojian;
    final String ditiansui;
    final List<String> sanmingtonghui;
    final List<String> bazitiyao;
    final List<String> shenfengtongkao;
    final String tianwuwuxian;
    final List<String> wuxingjingji;
    final List<String> lixuzhongmingshu;
    final List<String> xiyongshencankao;
    final String liangtoqian;
    final String gewuzhiyan;
    @JsonKey(name: 'WGLM')
    final String wglm;
    @JsonKey(name: 'YRJPFX')
    final String yrjfx;
    final List<String> zncs;
    @JsonKey(name: 'KWSC2')
    final List<String> kwsc2;
    final Rizhufenxi rizhufenxi;
    @JsonKey(name: 'XingZuo')
    final XingZuo xingZuo;
    @JsonKey(name: 'GDLM')
    final List<String> gdlm;
    @JsonKey(name: 'SCWG')
    final List<String> scwg;
    @JsonKey(name: 'GXSM')
    final List<String> gxsm;
    @JsonKey(name: 'GGXTH')
    final List<String> ggxth;
    @JsonKey(name: 'XWSC')
    final List<String> xwsc;
    @JsonKey(name: 'DiMuJing')
    final List<String> diMuJing;
    @JsonKey(name: 'SanShi')
    final List<String> sanShi;
    @JsonKey(name: 'ShoShengZhai')
    final List<String> shoShengZhai;

    Fx({
        required this.cgg,
        required this.qiongtongbaojian,
        required this.ditiansui,
        required this.sanmingtonghui,
        required this.bazitiyao,
        required this.shenfengtongkao,
        required this.tianwuwuxian,
        required this.wuxingjingji,
        required this.lixuzhongmingshu,
        required this.xiyongshencankao,
        required this.liangtoqian,
        required this.gewuzhiyan,
        required this.wglm,
        required this.yrjfx,
        required this.zncs,
        required this.kwsc2,
        required this.rizhufenxi,
        required this.xingZuo,
        required this.gdlm,
        required this.scwg,
        required this.gxsm,
        required this.ggxth,
        required this.xwsc,
        required this.diMuJing,
        required this.sanShi,
        required this.shoShengZhai,
    });

    factory Fx.fromJson(Map<String, dynamic> json) => _$FxFromJson(json);
    Map<String, dynamic> toJson() => _$FxToJson(this);
}

@JsonSerializable()
class Rizhufenxi {
    @JsonKey(name: '日干心性')
    final String riGanXinXing;
    @JsonKey(name: '日干支层次')
    final String riGanZhiCengCi;
    @JsonKey(name: '日干支分析')
    final String riGanZhiFenXi;
    @JsonKey(name: '性格分析')
    final String xingGeFenXi;
    @JsonKey(name: '爱情分析')
    final String aiQingFenXi;
    @JsonKey(name: '事业分析')
    final String shiYeFenXi;
    @JsonKey(name: '财运分析')
    final String caiYunFenXi;
    @JsonKey(name: '健康分析')
    final String jianKangFenXi;

    Rizhufenxi({
        required this.riGanXinXing,
        required this.riGanZhiCengCi,
        required this.riGanZhiFenXi,
        required this.xingGeFenXi,
        required this.aiQingFenXi,
        required this.shiYeFenXi,
        required this.caiYunFenXi,
        required this.jianKangFenXi,
    });

    factory Rizhufenxi.fromJson(Map<String, dynamic> json) => _$RizhufenxiFromJson(json);
    Map<String, dynamic> toJson() => _$RizhufenxiToJson(this);
}

@JsonSerializable()
class XingZuo {
    @JsonKey(name: '角色')
    final String jiaoSe;
    @JsonKey(name: '月份')
    final String yueFen;
    @JsonKey(name: '特点')
    final String teDian;
    @JsonKey(name: '象')
    final String xiang;
    @JsonKey(name: '掌管宫位')
    final String zhangGuanGongWei;
    @JsonKey(name: '最大特征')
    final String zuiDaTeZheng;
    @JsonKey(name: '主管星')
    final String zhuGuanXing;
    @JsonKey(name: '性格特征')
    final String xingGeTeZheng;
    @JsonKey(name: '优点')
    final String youDian;
    @JsonKey(name: '缺点')
    final String queDian;

    XingZuo({
        required this.jiaoSe,
        required this.yueFen,
        required this.teDian,
        required this.xiang,
        required this.zhangGuanGongWei,
        required this.zuiDaTeZheng,
        required this.zhuGuanXing,
        required this.xingGeTeZheng,
        required this.youDian,
        required this.queDian,
    });

    factory XingZuo.fromJson(Map<String, dynamic> json) => _$XingZuoFromJson(json);
    Map<String, dynamic> toJson() => _$XingZuoToJson(this);
}

@JsonSerializable()
class Kongwang {
    final String nz;
    final String yz;
    final String rz;
    final String sz;
    final String tz;
    @JsonKey(name: 'Tz')
    final String tz2;
    final String mz;
    @JsonKey(name: 'Sz')
    final String sz2;

    Kongwang({
        required this.nz,
        required this.yz,
        required this.rz,
        required this.sz,
        required this.tz,
        required this.tz2,
        required this.mz,
        required this.sz2,
    });

    factory Kongwang.fromJson(Map<String, dynamic> json) => _$KongwangFromJson(json);
    Map<String, dynamic> toJson() => _$KongwangToJson(this);
}

@JsonSerializable()
class Minggua {
    final String zg;
    final String b;
    final String db;
    final String d;
    final String dn;
    final String n;
    final String xn;
    final String x;
    final String xb;
    final String jbk;
    final String fsk;

    Minggua({
        required this.zg,
        required this.b,
        required this.db,
        required this.d,
        required this.dn,
        required this.n,
        required this.xn,
        required this.x,
        required this.xb,
        required this.jbk,
        required this.fsk,
    });

    factory Minggua.fromJson(Map<String, dynamic> json) => _$MingguaFromJson(json);
    Map<String, dynamic> toJson() => _$MingguaToJson(this);
}

@JsonSerializable()
class Nayin {
    final String nz;
    final String yz;
    final String rz;
    final String sz;
    final String tg;
    @JsonKey(name: 'Tg')
    final String tg2;
    final String mg;
    @JsonKey(name: 'Sg')
    final String sg2;

    Nayin({
        required this.nz,
        required this.yz,
        required this.rz,
        required this.sz,
        required this.tg,
        required this.tg2,
        required this.mg,
        required this.sg2,
    });

    factory Nayin.fromJson(Map<String, dynamic> json) => _$NayinFromJson(json);
    Map<String, dynamic> toJson() => _$NayinToJson(this);
}

@JsonSerializable()
class Shensha {
    final List<String> nz;
    final List<String> yz;
    final List<String> rz;
    final List<String> sz;
    final List<String> tz;
    @JsonKey(name: 'Tz')
    final List<String> tz2;
    final List<String> mz;
    @JsonKey(name: 'Sz')
    final List<String> sz2;

    Shensha({
        required this.nz,
        required this.yz,
        required this.rz,
        required this.sz,
        required this.tz,
        required this.tz2,
        required this.mz,
        required this.sz2,
    });

    factory Shensha.fromJson(Map<String, dynamic> json) => _$ShenshaFromJson(json);
    Map<String, dynamic> toJson() => _$ShenshaToJson(this);
}

@JsonSerializable()
class Xingyun {
    final String nz;
    final String yz;
    final String rz;
    final String sz;
    final String tz;
    @JsonKey(name: 'Tz')
    final String tz2;
    final String mz;
    @JsonKey(name: 'Sz')
    final String sz2;

    Xingyun({
        required this.nz,
        required this.yz,
        required this.rz,
        required this.sz,
        required this.tz,
        required this.tz2,
        required this.mz,
        required this.sz2,
    });

    factory Xingyun.fromJson(Map<String, dynamic> json) => _$XingyunFromJson(json);
    Map<String, dynamic> toJson() => _$XingyunToJson(this);
}

@JsonSerializable()
class Xiyongshen {
    final List<dynamic> qiangruo;
    final List<dynamic> zh;
    @JsonKey(name: 'LTGXTongJi')
    final List<int> ltgxTongJi;
    @JsonKey(name: 'ZaoShi')
    final String zaoShi;
    @JsonKey(name: 'WDLSSF')
    final List<dynamic> wdlsf;
    @JsonKey(name: 'YDWXSF')
    final List<dynamic> ydwxsf;
    @JsonKey(name: 'PHYongShen')
    final List<String> phYongShen;
    @JsonKey(name: 'THYongShen')
    final List<dynamic> thYongShen;
    @JsonKey(name: 'PDXiYongShen')
    final List<dynamic> pdXiYongShen;
    @JsonKey(name: 'HoTianXiYongFX')
    final List<dynamic> hoTianXiYongFx;

    Xiyongshen({
        required this.qiangruo,
        required this.zh,
        required this.ltgxTongJi,
        required this.zaoShi,
        required this.wdlsf,
        required this.ydwxsf,
        required this.phYongShen,
        required this.thYongShen,
        required this.pdXiYongShen,
        required this.hoTianXiYongFx,
    });

    factory Xiyongshen.fromJson(Map<String, dynamic> json) => _$XiyongshenFromJson(json);
    Map<String, dynamic> toJson() => _$XiyongshenToJson(this);
}

@JsonSerializable()
class Zhen {
    final String sheng;
    final String shi;
    final String xian;
    final double bw;
    final double dj;
    @JsonKey(name: 'ZTYSC')
    final String ztysc;
    final dynamic xls;
    final dynamic bjhs;
    @JsonKey(name: 'Z_QRQ')
    final String zQrq;

    Zhen({
        required this.sheng,
        required this.shi,
        required this.xian,
        required this.bw,
        required this.dj,
        required this.ztysc,
        this.xls,
        this.bjhs,
        required this.zQrq,
    });

    factory Zhen.fromJson(Map<String, dynamic> json) => _$ZhenFromJson(json);
    Map<String, dynamic> toJson() => _$ZhenToJson(this);
}

@JsonSerializable()
class Zizuo {
    final String nz;
    final String yz;
    final String rz;
    final String sz;
    final String tz;
    @JsonKey(name: 'Tz')
    final String tz2;
    final String mz;
    @JsonKey(name: 'Sz')
    final String sz2;

    Zizuo({
        required this.nz,
        required this.yz,
        required this.rz,
        required this.sz,
        required this.tz,
        required this.tz2,
        required this.mz,
        required this.sz2,
    });

    factory Zizuo.fromJson(Map<String, dynamic> json) => _$ZizuoFromJson(json);
    Map<String, dynamic> toJson() => _$ZizuoToJson(this);
}