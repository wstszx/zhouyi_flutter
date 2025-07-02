import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zhouyi/models/divination_result.dart' as old_model;

// JSON数据模型，用于解析和存储命理信息
// Model for parsing and storing the divination data from JSON
class DivinationData {
  final String name;
  final String sex;
  final String nylm;
  final String shengxiao;
  final String xingzuo;
  final List<String> geju;
  final String wuxingWangdu;
  final String gongli;
  final String nongli;
  final Map<String, String> bazi;
  final Map<String, String> nayin;
  final Map<String, List<String>> shensha;
  final Map<String, dynamic> fx;
  final List<dynamic> detailInfo;
  final String xingxiuGeyao;

  DivinationData({
    required this.name,
    required this.sex,
    required this.nylm,
    required this.shengxiao,
    required this.xingzuo,
    required this.geju,
    required this.wuxingWangdu,
    required this.gongli,
    required this.nongli,
    required this.bazi,
    required this.nayin,
    required this.shensha,
    required this.fx,
    required this.detailInfo,
    required this.xingxiuGeyao,
  });

  factory DivinationData.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return DivinationData(
      name: data['name'],
      sex: data['sex'],
      nylm: data['nylm'],
      shengxiao: data['shengxiao'],
      xingzuo: data['xingzuo'],
      geju: List<String>.from(data['geju']),
      wuxingWangdu: data['wuxing_wangdu'],
      gongli: data['gongli'],
      nongli: data['nongli'],
      bazi: Map<String, String>.from(data['bazi']),
      nayin: Map<String, String>.from(data['nayin']),
      shensha: (data['shensha'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, List<String>.from(value)),
      ),
      fx: Map<String, dynamic>.from(data['FX']),
      detailInfo: List<dynamic>.from(data['detail_info']),
      xingxiuGeyao: data['xingxiu_geyao'],
    );
  }

  factory DivinationData.fromOldModel(old_model.Data oldData) {
    final baziMap = {
      'ng': oldData.bazi.ng,
      'nz': oldData.bazi.nz,
      'yg': oldData.bazi.yg,
      'yz': oldData.bazi.yz,
      'rg': oldData.bazi.rg,
      'rz': oldData.bazi.rz,
      'sg': oldData.bazi.sg,
      'sz': oldData.bazi.sz,
    };

    final nayinMap = {
      'nz': oldData.nayin.nz,
      'yz': oldData.nayin.yz,
      'rz': oldData.nayin.rz,
      'sz': oldData.nayin.sz,
    };

    final shenshaMap = {
      'nz': oldData.shensha.nz,
      'yz': oldData.shensha.yz,
      'rz': oldData.shensha.rz,
      'sz': oldData.shensha.sz,
    };

    final fxMap = {
      'ditiansui': oldData.fx.ditiansui,
      'sanmingtonghui': oldData.fx.sanmingtonghui,
    };

    final detailInfoList = oldData.detailInfo.map((info) {
      final liunianInfoList = info.liunianInfo.map((liunian) {
        return {
          'liunian_year': liunian.liunianYear,
          'liunian_ganzhi': liunian.liunianGanzhi,
          'liunian_age': liunian.liunianAge,
          'liunian_yunshi': liunian.liunianYunshi,
        };
      }).toList();

      return {
        'dayun_start_age': info.dayunStartAge,
        'dayun_end_age': info.dayunEndAge,
        'dayun_start_ganzhi': info.dayunStartGanzhi,
        'dayun_nayin': info.dayunNayin,
        'dayun_start_year': info.dayunStartYear,
        'dayun_end_year': info.dayunEndYear,
        'liunian_info': liunianInfoList,
      };
    }).toList();

    return DivinationData(
      name: oldData.name,
      sex: oldData.sex,
      nylm: oldData.nylm,
      shengxiao: oldData.shengxiao,
      xingzuo: oldData.xingzuo,
      geju: oldData.geju,
      wuxingWangdu: oldData.wuxingWangdu,
      gongli: oldData.gongli,
      nongli: oldData.nongli,
      bazi: baziMap,
      nayin: nayinMap,
      shensha: shenshaMap,
      fx: fxMap,
      detailInfo: detailInfoList,
      xingxiuGeyao: oldData.xingxiuGeyao,
    );
  }
}

// 主屏幕包装器，用于数据转换
class PaipanResultScreen extends StatelessWidget {
  final old_model.DivinationResult result;

  const PaipanResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    // 将旧模型转换为新模型
    final divinationData = DivinationData.fromOldModel(result.data);
    return _PaiPanResultView(data: divinationData);
  }
}


// 主屏幕UI
class _PaiPanResultView extends StatefulWidget {
  final DivinationData data;

  const _PaiPanResultView({required this.data});

  @override
  State<_PaiPanResultView> createState() => _PaiPanResultViewState();
}

class _PaiPanResultViewState extends State<_PaiPanResultView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 背景图片
          SvgPicture.asset(
            'assets/images/background_gradient.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 250.0,
                floating: false,
                pinned: false,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  background: HeaderInfo(data: widget.data),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    controller: _tabController,
                    indicatorColor: const Color(0xFF8B4513),
                    labelColor: const Color(0xFF8B4513),
                    unselectedLabelColor: Colors.grey,
                    indicatorWeight: 2.0,
                    tabs: const [
                      Tab(text: '运势分析'),
                      Tab(text: '神煞解析'),
                      Tab(text: '命盘结构'),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              FortuneAnalysisTab(data: widget.data),
              ShenshaAnalysisTab(data: widget.data),
              ChartStructureTab(data: widget.data),
            ],
          ),
        ),
        ],
      ),
    );
  }
}

// 自定义卡片组件，实现毛玻璃效果
class FrostedCard extends StatelessWidget {
  final Widget child;
  const FrostedCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFDEBEB).withOpacity(0.8),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: child,
    );
  }
}

// 头部信息组件
class HeaderInfo extends StatelessWidget {
  final DivinationData data;
  const HeaderInfo({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(data.name, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF8B4513))),
          const SizedBox(height: 4),
          Text('${data.sex} | ${data.nylm}', style: const TextStyle(fontSize: 16, color: Color(0xFF8B4513))),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Chip(
                label: Text('生肖: ${data.shengxiao}'),
                backgroundColor: const Color(0xFF8B4513).withOpacity(0.2),
                labelStyle: const TextStyle(color: Color(0xFF8B4513)),
              ),
              const SizedBox(width: 12),
              Chip(
                label: Text('星座: ${data.xingzuo}'),
                backgroundColor: const Color(0xFF8B4513).withOpacity(0.2),
                labelStyle: const TextStyle(color: Color(0xFF8B4513)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 核心命盘卡片
class BaziCard extends StatelessWidget {
  final DivinationData data;
  const BaziCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final baziOrder = ['年柱', '月柱', '日柱', '时柱'];
    final baziKeys = [['ng', 'nz'], ['yg', 'yz'], ['rg', 'rz'], ['sg', 'sz']];
    final nayinKeys = ['nz', 'yz', 'rz', 'sz'];

    return FrostedCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: '天命八字', color: Color(0xFF8B4513)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (i) {
                return Column(
                  children: [
                    Text(baziOrder[i], style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B4513).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFF8B4513).withOpacity(0.3)),
                      ),
                      child: Column(
                        children: [
                          Text(data.bazi[baziKeys[i][0]]!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF8B4513))),
                          Text(data.bazi[baziKeys[i][1]]!, style: const TextStyle(fontSize: 16, color: Colors.black87)),
                          const SizedBox(height: 4),
                          Text(data.nayin[nayinKeys[i]]!, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
            const SizedBox(height: 16),
            GridView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              children: [
                InfoItem(label: '格局', value: data.geju.join(', ')),
                InfoItem(label: '五行旺度', value: data.wuxingWangdu),
                InfoItem(label: '公历', value: data.gongli),
                InfoItem(label: '农历', value: data.nongli),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 运势分析标签页
class FortuneAnalysisTab extends StatelessWidget {
  final DivinationData data;
  const FortuneAnalysisTab({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final liunianData = data.detailInfo.isNotEmpty && data.detailInfo[0]['liunian_info'] != null
      ? (data.detailInfo[0]['liunian_info'] as List).take(4).toList()
      : [];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          BaziCard(data: data),
          const SizedBox(height: 16),
          FrostedCard(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionTitle(title: '大运', color: Color(0xFF8B4513)),
                  const SizedBox(height: 12),
                  ...data.detailInfo.take(4).map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Container(
                          padding: const EdgeInsets.only(left: 12),
                          decoration: const BoxDecoration(
                            border: Border(left: BorderSide(color: Color(0xFF8B4513), width: 2)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${item['dayun_start_age']}-${item['dayun_end_age']}岁 (${item['dayun_start_ganzhi']} ${item['dayun_nayin'] ?? ''})',
                                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 16),
                              ),
                              Text(
                                '${item['dayun_start_year']} - ${item['dayun_end_year']}',
                                style: const TextStyle(color: Colors.black54, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          FrostedCard(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionTitle(title: '流年运程 (2023-2026)', color: Color(0xFF8B4513)),
                  const SizedBox(height: 12),
                  ...liunianData.map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Container(
                          padding: const EdgeInsets.only(left: 12),
                          decoration: const BoxDecoration(
                            border: Border(left: BorderSide(color: Color(0xFF8B4513), width: 2)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${item['liunian_year']}年 (${item['liunian_ganzhi']}) - ${item['liunian_age']}岁',
                                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['liunian_yunshi'],
                                style: const TextStyle(color: Colors.black54, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 神煞解析标签页
class ShenshaAnalysisTab extends StatelessWidget {
  final DivinationData data;
  const ShenshaAnalysisTab({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final shenshaPillars = {'年柱': data.shensha['nz'], '月柱': data.shensha['yz'], '日柱': data.shensha['rz'], '时柱': data.shensha['sz']};
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: FrostedCard(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: '神煞详解', color: Color(0xFF8B4513)),
              const SizedBox(height: 16),
              ...shenshaPillars.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(entry.key, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF8B4513))),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: (entry.value ?? []).map((sha) => Chip(
                          label: Text(sha),
                          backgroundColor: const Color(0xFF8B4513).withOpacity(0.1),
                          labelStyle: const TextStyle(color: Color(0xFF8B4513)),
                        )).toList(),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

// 命盘结构标签页
class ChartStructureTab extends StatelessWidget {
  final DivinationData data;
  const ChartStructureTab({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: FrostedCard(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: '命格总览', color: Color(0xFF8B4513)),
              const SizedBox(height: 16),
              CustomExpansionTile(
                title: '滴天髓',
                content: data.fx['ditiansui'],
              ),
              const SizedBox(height: 8),
              CustomExpansionTile(
                title: '三命通会',
                content: (data.fx['sanmingtonghui'] as List).join('\n\n'),
              ),
              const SizedBox(height: 8),
              CustomExpansionTile(
                title: '星宿歌谣',
                content: data.xingxiuGeyao,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 自定义折叠面板
class CustomExpansionTile extends StatefulWidget {
  final String title;
  final String content;

  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: const Color(0xFF8B4513).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF8B4513))),
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: const Color(0xFF8B4513),
                ),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: Container(),
          secondChild: Container(
            padding: const EdgeInsets.all(12.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF8B4513).withOpacity(0.05),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
            ),
            child: Text(
              widget.content,
              style: TextStyle(color: Colors.brown[800], height: 1.6),
            ),
          ),
          crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
      ],
    );
  }
}

// 其他辅助组件
class SectionTitle extends StatelessWidget {
  final String title;
  final Color color;
  const SectionTitle({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: color, width: 4)),
      ),
      padding: const EdgeInsets.only(left: 12),
      child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF8B4513))),
    );
  }
}

class InfoItem extends StatelessWidget {
  final String label;
  final String value;
  const InfoItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54, fontSize: 14)),
          Text(
            value,
            softWrap: true,
            style: const TextStyle(color: Color(0xFF8B4513), fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.transparent, // Make it transparent to show the main background
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}