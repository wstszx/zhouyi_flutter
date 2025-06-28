import 'package:flutter/material.dart';
import 'package:zhouyi/models/divination_result.dart';

class DivinationResultScreen extends StatelessWidget {
  final DivinationResult result;

  const DivinationResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Updated tab count
      child: Scaffold(
        appBar: AppBar(
          title: Text(result.data.name),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: '基本信息'),
              Tab(text: '四柱信息'),
              Tab(text: '大运流年'),
              Tab(text: '格局分析'),
              Tab(text: '古籍分析'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildBasicInfoTab(context),
            _buildPillarInfoTab(context),
            _buildLuckCycleTab(context),
            _buildPatternAnalysisTab(context),
            _buildAncientBooksTab(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicInfoTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('姓名', result.data.name),
          _buildInfoRow('性别', result.data.sex),
          _buildInfoRow('公历', result.data.gongli),
          _buildInfoRow('农历', result.data.nongli),
          _buildInfoRow('生肖', result.data.shengxiao),
          _buildInfoRow('星座', result.data.xingzuo),
          _buildInfoRow('姓名五行', result.data.xmwx),
          _buildInfoRow('纳音论命', result.data.nylm),
          _buildInfoRow('物候', result.data.wuHou),
          _buildInfoRow('七政', result.data.getZheng),
          _buildInfoRow('月相', result.data.getYueXiang),
          _buildInfoRow('三才五格', result.data.scwg),
          _buildInfoRow('晚子时规则', result.data.wanzishiliupai),
          _buildInfoRow('起运', result.data.qiyun),
          _buildInfoRow('交运', result.data.jiaoyun.toString()),
          _buildInfoRow('换运', result.data.huanyun),
          _buildInfoRow('当令节气', '${result.data.dl1} (${result.data.dl2})'),
          _buildInfoRow('次令节气', '${result.data.cl1} (${result.data.cl2})'),
          _buildInfoRow('司令', result.data.siling.map((e) => e.join(' ')).join(', ')),
          _buildInfoRow('星宿', result.data.xingxiu),
          _buildInfoRow('星宿歌诀', result.data.xingxiuGeyao),
        ],
      ),
    );
  }

  Widget _buildPillarInfoTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Table(
        border: TableBorder.all(),
        children: [
          _buildTableRow(['项目', '年柱', '月柱', '日柱', '时柱', '胎元', '胎息', '命宫', '身宫']),
          _buildTableRow(['天干', result.data.bazi.ng, result.data.bazi.yg, result.data.bazi.rg, result.data.bazi.sg, result.data.bazi.tg, result.data.bazi.tg2, result.data.bazi.mg, result.data.bazi.sg2]),
          _buildTableRow(['地支', result.data.bazi.nz, result.data.bazi.yz, result.data.bazi.rz, result.data.bazi.sz, result.data.bazi.tz, result.data.bazi.tz2, result.data.bazi.mz, result.data.bazi.sz2]),
          _buildTableRow(['纳音', result.data.nayin.nz, result.data.nayin.yz, result.data.nayin.rz, result.data.nayin.sz, result.data.nayin.tg, result.data.nayin.tg2, result.data.nayin.mg, result.data.nayin.sg2]),
          _buildTableRow(['空亡', result.data.kongwang.nz, result.data.kongwang.yz, result.data.kongwang.rz, result.data.kongwang.sz, result.data.kongwang.tz, result.data.kongwang.tz2, result.data.kongwang.mz, result.data.kongwang.sz2]),
          _buildTableRow(['神煞', result.data.shensha.nz.join(', '), result.data.shensha.yz.join(', '), result.data.shensha.rz.join(', '), result.data.shensha.sz.join(', '), result.data.shensha.tz.join(', '), result.data.shensha.tz2.join(', '), result.data.shensha.mz.join(', '), result.data.shensha.sz2.join(', ')]),
          _buildTableRow(['长生自座', result.data.zizuo.nz, result.data.zizuo.yz, result.data.zizuo.rz, result.data.zizuo.sz, result.data.zizuo.tz, result.data.zizuo.tz2, result.data.zizuo.mz, result.data.zizuo.sz2]),
          _buildTableRow(['长生星运', result.data.xingyun.nz, result.data.xingyun.yz, result.data.xingyun.rz, result.data.xingyun.sz, result.data.xingyun.tz, result.data.xingyun.tz2, result.data.xingyun.mz, result.data.xingyun.sz2]),
        ],
      ),
    );
  }

  Widget _buildLuckCycleTab(BuildContext context) {
    return ListView.builder(
      itemCount: result.data.detailInfo.length,
      itemBuilder: (context, index) {
        final dayun = result.data.detailInfo[index];
        return ExpansionTile(
          title: Text('${dayun.dayunStartGanzhi} (${dayun.dayunStartYear} - ${dayun.dayunEndYear})'),
          children: dayun.liunianInfo.map((liunian) {
            return ExpansionTile(
              title: Text('  ${liunian.liunianGanzhi} (${liunian.liunianYear})'),
              children: [
                _buildInfoRow('    年龄', liunian.liunianAge.toString()),
                _buildInfoRow('    纳音', liunian.liunianNayin),
                _buildInfoRow('    空亡', liunian.liunianKongwang),
                _buildInfoRow('    神煞', liunian.liunianShensha.join(', ')),
                _buildInfoRow('    运势', liunian.liunianYunshi),
              ],
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildPatternAnalysisTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('五行旺衰', result.data.wuxingWangdu),
          _buildInfoRow('格局', result.data.geju.join(', ')),
          _buildInfoRow('天干留意', result.data.tianganLiuyi),
          _buildInfoRow('地支留意', result.data.dizhiLiuyi),
          _buildInfoRow('命卦', result.data.minggua.zg),
        ],
      ),
    );
  }

  Widget _buildAncientBooksTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('袁天罡称骨', result.data.fx.cgg.join('\n')),
          _buildInfoRow('穷通宝鉴', result.data.fx.qiongtongbaojian),
          _buildInfoRow('滴天髓', result.data.fx.ditiansui),
          _buildInfoRow('三命通会', result.data.fx.sanmingtonghui.join('\n')),
          _buildInfoRow('八字提要', result.data.fx.bazitiyao.join('\n')),
          _buildInfoRow('神峰通考', result.data.fx.shenfengtongkao.join('\n')),
          _buildInfoRow('天元巫咸', result.data.fx.tianwuwuxian),
          _buildInfoRow('五行精纪', result.data.fx.wuxingjingji.join('\n')),
          _buildInfoRow('李虚中命书', result.data.fx.lixuzhongmingshu.join('\n')),
          _buildInfoRow('喜用神参考', result.data.fx.xiyongshencankao.join('\n')),
          _buildInfoRow('鬼谷星两头钳', result.data.fx.liangtoqian),
          _buildInfoRow('格物至言', result.data.fx.gewuzhiyan),
          _buildInfoRow('万公论命', result.data.fx.wglm),
          _buildInfoRow('月日精参', result.data.fx.yrjfx),
          _buildInfoRow('内测分析', result.data.fx.zncs.join('\n')),
          _buildInfoRow('综合智能分析', result.data.fx.kwsc2.join('\n')),
          _buildInfoRow('日主分析', '日干心性: ${result.data.fx.rizhufenxi.riGanXinXing}\n日干支层次: ${result.data.fx.rizhufenxi.riGanZhiCengCi}\n日干支分析: ${result.data.fx.rizhufenxi.riGanZhiFenXi}'),
          _buildInfoRow('星座分析', '角色: ${result.data.fx.xingZuo.jiaoSe}\n月份: ${result.data.fx.xingZuo.yueFen}\n特点: ${result.data.fx.xingZuo.teDian}\n象: ${result.data.fx.xingZuo.xiang}\n掌管宫位: ${result.data.fx.xingZuo.zhangGuanGongWei}\n最大特征: ${result.data.fx.xingZuo.zuiDaTeZheng}\n主管星: ${result.data.fx.xingZuo.zhuGuanXing}\n性格特征: ${result.data.fx.xingZuo.xingGeTeZheng}'),
          _buildInfoRow('宫度论命', result.data.fx.gdlm.join('\n')),
          _buildInfoRow('三才五格分析', result.data.fx.scwg.join('\n')),
          _buildInfoRow('骨相论命', result.data.fx.gxsm.join('\n')),
          _buildInfoRow('鬼谷子论婚姻', result.data.fx.ggxth.join('\n')),
          _buildInfoRow('寻物分析', result.data.fx.xwsc.join('\n')),
          _buildInfoRow('地母经', result.data.fx.diMuJing.join('\n')),
          _buildInfoRow('三世书', result.data.fx.sanShi.join('\n')),
          _buildInfoRow('邵氏神煞', result.data.fx.shoShengZhai.join('\n')),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 100, child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(child: Text(value ?? '')),
        ],
      ),
    );
  }

  TableRow _buildTableRow(List<String?> cells) {
    return TableRow(
      children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(cell ?? '', textAlign: TextAlign.center),
        );
      }).toList(),
    );
  }
}