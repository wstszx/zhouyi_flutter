import 'package:flutter/material.dart';
import 'package:zhouyi/models/divination_result.dart';

class DivinationResultScreen extends StatelessWidget {
  final DivinationResult result;

  const DivinationResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(result.data.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, '基本信息'),
            ..._buildBasicInfoWidgets(context),
            const SizedBox(height: 24),
            _buildSectionTitle(context, '四柱信息'),
            _buildPillarInfoTable(context),
            const SizedBox(height: 24),
            _buildSectionTitle(context, '格局分析'),
            ..._buildPatternAnalysisWidgets(context),
            const SizedBox(height: 24),
            _buildSectionTitle(context, '大运流年'),
            ..._buildLuckCycleWidgets(context),
            const SizedBox(height: 24),
            _buildSectionTitle(context, '古籍分析'),
            ..._buildAncientBooksWidgets(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
      ),
    );
  }

  List<Widget> _buildBasicInfoWidgets(BuildContext context) {
    return [
      _buildInfoCard(context, '姓名', result.data.name, icon: Icons.person_outline),
      _buildInfoCard(context, '性别', result.data.sex, icon: Icons.wc_outlined),
      _buildInfoCard(context, '公历', result.data.gongli, icon: Icons.calendar_today_outlined),
      _buildInfoCard(context, '农历', result.data.nongli, icon: Icons.calendar_view_month_outlined),
      _buildInfoCard(context, '生肖', result.data.shengxiao, icon: Icons.cruelty_free_outlined),
      _buildInfoCard(context, '星座', result.data.xingzuo, icon: Icons.star_border_outlined),
      _buildInfoCard(context, '姓名五行', result.data.xmwx, icon: Icons.spa_outlined),
      _buildInfoCard(context, '纳音论命', result.data.nylm, icon: Icons.music_note_outlined),
      _buildInfoCard(context, '物候', result.data.wuHou, icon: Icons.thermostat_outlined),
      _buildInfoCard(context, '七政', result.data.getZheng, icon: Icons.brightness_7_outlined),
      _buildInfoCard(context, '月相', result.data.getYueXiang, icon: Icons.nightlight_round_outlined),
      _buildInfoCard(context, '三才五格', result.data.scwg, icon: Icons.looks_3_outlined),
      _buildInfoCard(context, '晚子时规则', result.data.wanzishiliupai, icon: Icons.access_time_outlined),
      _buildInfoCard(context, '起运', result.data.qiyun, icon: Icons.play_arrow_outlined),
      _buildInfoCard(context, '交运', result.data.jiaoyun.toString(), icon: Icons.swap_horiz_outlined),
      _buildInfoCard(context, '换运', result.data.huanyun, icon: Icons.change_circle_outlined),
      _buildInfoCard(context, '当令节气', '${result.data.dl1} (${result.data.dl2})', icon: Icons.wb_sunny_outlined),
      _buildInfoCard(context, '次令节气', '${result.data.cl1} (${result.data.cl2})', icon: Icons.wb_cloudy_outlined),
      _buildInfoCard(context, '司令', result.data.siling.map((e) => e.join(' ')).join(', '), icon: Icons.military_tech_outlined),
      _buildInfoCard(context, '星宿', result.data.xingxiu, icon: Icons.stars_outlined),
      _buildInfoCard(context, '星宿歌诀', result.data.xingxiuGeyao, icon: Icons.menu_book_outlined),
    ];
  }

  Widget _buildPillarInfoTable(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Table(
          border: TableBorder.all(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
          children: [
            _buildTableRow(['项目', '年柱', '月柱', '日柱', '时柱', '胎元', '胎息', '命宫', '身宫'], isHeader: true),
            _buildTableRow(['天干', result.data.bazi.ng, result.data.bazi.yg, result.data.bazi.rg, result.data.bazi.sg, result.data.bazi.tg, result.data.bazi.tg2, result.data.bazi.mg, result.data.bazi.sg2]),
            _buildTableRow(['地支', result.data.bazi.nz, result.data.bazi.yz, result.data.bazi.rz, result.data.bazi.sz, result.data.bazi.tz, result.data.bazi.tz2, result.data.bazi.mz, result.data.bazi.sz2]),
            _buildTableRow(['纳音', result.data.nayin.nz, result.data.nayin.yz, result.data.nayin.rz, result.data.nayin.sz, result.data.nayin.tg, result.data.nayin.tg2, result.data.nayin.mg, result.data.nayin.sg2]),
            _buildTableRow(['空亡', result.data.kongwang.nz, result.data.kongwang.yz, result.data.kongwang.rz, result.data.kongwang.sz, result.data.kongwang.tz, result.data.kongwang.tz2, result.data.kongwang.mz, result.data.kongwang.sz2]),
            _buildTableRow(['神煞', result.data.shensha.nz.join(', '), result.data.shensha.yz.join(', '), result.data.shensha.rz.join(', '), result.data.shensha.sz.join(', '), result.data.shensha.tz.join(', '), result.data.shensha.tz2.join(', '), result.data.shensha.mz.join(', '), result.data.shensha.sz2.join(', ')]),
            _buildTableRow(['长生自座', result.data.zizuo.nz, result.data.zizuo.yz, result.data.zizuo.rz, result.data.zizuo.sz, result.data.zizuo.tz, result.data.zizuo.tz2, result.data.zizuo.mz, result.data.zizuo.sz2]),
            _buildTableRow(['长生星运', result.data.xingyun.nz, result.data.xingyun.yz, result.data.xingyun.rz, result.data.xingyun.sz, result.data.xingyun.tz, result.data.xingyun.tz2, result.data.xingyun.mz, result.data.xingyun.sz2]),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildLuckCycleWidgets(BuildContext context) {
    return result.data.detailInfo.map((dayun) {
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ExpansionTile(
          leading: Icon(Icons.timeline_outlined, color: Theme.of(context).primaryColor),
          title: Text(
            '${dayun.dayunStartGanzhi} (${dayun.dayunStartYear} - ${dayun.dayunEndYear})',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          children: dayun.liunianInfo.map((liunian) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: ListTile(
                  title: Text('${liunian.liunianGanzhi} (${liunian.liunianYear})', style: const TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text('年龄: ${liunian.liunianAge}'),
                      Text('纳音: ${liunian.liunianNayin}'),
                      Text('空亡: ${liunian.liunianKongwang}'),
                      Text('神煞: ${liunian.liunianShensha.join(', ')}'),
                      Text('运势: ${liunian.liunianYunshi}'),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      );
    }).toList();
  }

  List<Widget> _buildPatternAnalysisWidgets(BuildContext context) {
    return [
      _buildInfoCard(context, '五行旺衰', result.data.wuxingWangdu, icon: Icons.local_fire_department_outlined),
      _buildInfoCard(context, '格局', result.data.geju.join(', '), icon: Icons.account_balance_outlined),
      _buildInfoCard(context, '天干留意', result.data.tianganLiuyi, icon: Icons.arrow_upward_outlined),
      _buildInfoCard(context, '地支留意', result.data.dizhiLiuyi, icon: Icons.arrow_downward_outlined),
      _buildInfoCard(context, '命卦', result.data.minggua.zg, icon: Icons.extension_outlined),
    ];
  }

  List<Widget> _buildAncientBooksWidgets(BuildContext context) {
    return [
      _buildInfoCard(context, '袁天罡称骨', result.data.fx.cgg.join('\n'), icon: Icons.balance_outlined),
      _buildInfoCard(context, '穷通宝鉴', result.data.fx.qiongtongbaojian, icon: Icons.book_outlined),
      _buildInfoCard(context, '滴天髓', result.data.fx.ditiansui, icon: Icons.water_drop_outlined),
      _buildInfoCard(context, '三命通会', result.data.fx.sanmingtonghui.join('\n'), icon: Icons.menu_book_outlined),
      _buildInfoCard(context, '八字提要', result.data.fx.bazitiyao.join('\n'), icon: Icons.summarize_outlined),
      _buildInfoCard(context, '神峰通考', result.data.fx.shenfengtongkao.join('\n'), icon: Icons.landscape_outlined),
      _buildInfoCard(context, '天元巫咸', result.data.fx.tianwuwuxian, icon: Icons.auto_awesome_outlined),
      _buildInfoCard(context, '五行精纪', result.data.fx.wuxingjingji.join('\n'), icon: Icons.filter_vintage_outlined),
      _buildInfoCard(context, '李虚中命书', result.data.fx.lixuzhongmingshu.join('\n'), icon: Icons.history_edu_outlined),
      _buildInfoCard(context, '喜用神参考', result.data.fx.xiyongshencankao.join('\n'), icon: Icons.favorite_border_outlined),
      _buildInfoCard(context, '鬼谷星两头钳', result.data.fx.liangtoqian, icon: Icons.content_cut_outlined),
      _buildInfoCard(context, '格物至言', result.data.fx.gewuzhiyan, icon: Icons.science_outlined),
      _buildInfoCard(context, '万公论命', result.data.fx.wglm, icon: Icons.groups_outlined),
      _buildInfoCard(context, '月日精参', result.data.fx.yrjfx, icon: Icons.calendar_month_outlined),
      _buildInfoCard(context, '内测分析', result.data.fx.zncs.join('\n'), icon: Icons.analytics_outlined),
      _buildInfoCard(context, '综合智能分析', result.data.fx.kwsc2.join('\n'), icon: Icons.psychology_outlined),
      _buildInfoCard(context, '日主分析', '日干心性: ${result.data.fx.rizhufenxi.riGanXinXing}\n日干支层次: ${result.data.fx.rizhufenxi.riGanZhiCengCi}\n日干支分析: ${result.data.fx.rizhufenxi.riGanZhiFenXi}', icon: Icons.person_search_outlined),
      _buildInfoCard(context, '星座分析', '角色: ${result.data.fx.xingZuo.jiaoSe}\n月份: ${result.data.fx.xingZuo.yueFen}\n特点: ${result.data.fx.xingZuo.teDian}\n象: ${result.data.fx.xingZuo.xiang}\n掌管宫位: ${result.data.fx.xingZuo.zhangGuanGongWei}\n最大特征: ${result.data.fx.xingZuo.zuiDaTeZheng}\n主管星: ${result.data.fx.xingZuo.zhuGuanXing}\n性格特征: ${result.data.fx.xingZuo.xingGeTeZheng}', icon: Icons.star_outline),
      _buildInfoCard(context, '宫度论命', result.data.fx.gdlm.join('\n'), icon: Icons.castle_outlined),
      _buildInfoCard(context, '三才五格分析', result.data.fx.scwg.join('\n'), icon: Icons.looks_5_outlined),
      _buildInfoCard(context, '骨相论命', result.data.fx.gxsm.join('\n'), icon: Icons.face_retouching_natural_outlined),
      _buildInfoCard(context, '鬼谷子论婚姻', result.data.fx.ggxth.join('\n'), icon: Icons.favorite_outlined),
      _buildInfoCard(context, '寻物分析', result.data.fx.xwsc.join('\n'), icon: Icons.search_outlined),
      _buildInfoCard(context, '地母经', result.data.fx.diMuJing.join('\n'), icon: Icons.eco_outlined),
      _buildInfoCard(context, '三世书', result.data.fx.sanShi.join('\n'), icon: Icons.import_contacts_outlined),
      _buildInfoCard(context, '邵氏神煞', result.data.fx.shoShengZhai.join('\n'), icon: Icons.shield_outlined),
    ];
  }

  Widget _buildInfoCard(BuildContext context, String label, String? value, {IconData? icon}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (icon != null) ...[
              Icon(icon, color: Theme.of(context).primaryColor, size: 24),
              const SizedBox(width: 16),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(value ?? '暂无数据', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(List<String?> cells, {bool isHeader = false}) {
    return TableRow(
      decoration: BoxDecoration(
        color: isHeader ? Colors.grey.shade100 : null,
      ),
      children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            cell ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        );
      }).toList(),
    );
  }
}