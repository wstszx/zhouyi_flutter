import 'package:flutter/material.dart';
import 'package:zhouyi/models/divination_result.dart';

class NativePaipanResultScreen extends StatefulWidget {
  final DivinationResult result;
  
  const NativePaipanResultScreen({
    super.key,
    required this.result,
  });

  @override
  State<NativePaipanResultScreen> createState() => _NativePaipanResultScreenState();
}

class _NativePaipanResultScreenState extends State<NativePaipanResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('排盘结果'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF333333),
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildHeader(),
              const SizedBox(height: 16),
              _buildInfoCard(),
              const SizedBox(height: 16),
              _buildMainTable(),
              const SizedBox(height: 16),
              _buildChengguCard(),
              const SizedBox(height: 16),
              _buildDetailTable(),
              const SizedBox(height: 16),
              _buildDaYunTable(),
              const SizedBox(height: 16),
              _buildCurrentLiunianTable(),
              const SizedBox(height: 16),
              _buildShenshaTable(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        '墨家国学易经开放平台',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFFCC0000),
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    final data = widget.result.data;

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('姓名：', data.name, extraInfo: '${data.name}(${data.xmwx})'),
            const SizedBox(height: 8),
            _buildInfoRow('性别：', data.sex),
            const SizedBox(height: 8),
            _buildInfoRow('生肖：', data.shengxiao),
            const SizedBox(height: 8),
            _buildInfoRow('节气：', '芒种 小暑'),
            const SizedBox(height: 8),
            _buildInfoRow('起运：', '命主于出生后${data.qiyun}后起运'),
            const SizedBox(height: 8),
            _buildInfoRow('交运：', '命主于公历${data.jiaoyun}交运'),
            const SizedBox(height: 8),
            _buildInfoRow('换运：', data.huanyun),
            const SizedBox(height: 8),
            _buildInfoRow('公历：', '${data.gongli} ${data.xingzuo}'),
            const SizedBox(height: 8),
            _buildInfoRow('农历：', '${data.nongli} ${data.getYueXiang} ${data.getZheng}'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {String? extraInfo}) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Color(0xFF333333),
          height: 1.8,
        ),
        children: [
          TextSpan(text: label),
          TextSpan(
            text: value,
            style: const TextStyle(color: Color(0xFF993300)),
          ),
          if (extraInfo != null)
            TextSpan(
              text: ' $extraInfo',
              style: const TextStyle(color: Color(0xFF006600)),
            ),
        ],
      ),
    );
  }

  Widget _buildMainTable() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Table(
        columnWidths: const {
          0: FixedColumnWidth(80),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
          3: FlexColumnWidth(),
          4: FlexColumnWidth(),
        },
        children: [
          _buildTableHeaderRow(),
          _buildShishenRow(),
          _buildTianganRow(),
          _buildDizhiRow(),
          _buildCangganRow(),
          _buildNayinRow(),
          _buildKongwangRow(),
          _buildShenshaRow(),
          _buildXingyunRow(),
          _buildZizuoRow(),
        ],
      ),
    );
  }

  TableRow _buildTableHeaderRow() {
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFF666666)),
      children: [
        _buildTableCell('四柱:', isHeader: true),
        _buildTableCell('年柱', isHeader: true),
        _buildTableCell('月柱', isHeader: true),
        _buildTableCell('日柱', isHeader: true),
        _buildTableCell('时柱', isHeader: true),
      ],
    );
  }

  TableRow _buildShishenRow() {
    final shishen = widget.result.data.shishen;
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFFCCCCCC)),
      children: [
        _buildTableCell('十神:', isHeader: true),
        _buildTableCell('正财', color: _getShishenColor('正财')),
        _buildTableCell('正印', color: _getShishenColor('正印')),
        _buildTableCell('元男', color: const Color(0xFF995001)),
        _buildTableCell('正财', color: _getShishenColor('正财')),
      ],
    );
  }

  TableRow _buildTianganRow() {
    final bazi = widget.result.data.bazi;
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFF999999)),
      children: [
        _buildTableCell('天干:', isHeader: true),
        _buildTableCell(bazi.ng, fontSize: 24, color: _getTianganColor(bazi.ng)),
        _buildTableCell(bazi.yg, fontSize: 24, color: _getTianganColor(bazi.yg)),
        _buildTableCell(bazi.rg, fontSize: 24, color: _getTianganColor(bazi.rg)),
        _buildTableCell(bazi.sg, fontSize: 24, color: _getTianganColor(bazi.sg)),
      ],
    );
  }

  TableRow _buildDizhiRow() {
    final bazi = widget.result.data.bazi;
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFFCCCCCC)),
      children: [
        _buildTableCell('地支:', isHeader: true),
        _buildTableCell(bazi.nz, fontSize: 24, color: _getDizhiColor(bazi.nz)),
        _buildTableCell(bazi.yz, fontSize: 24, color: _getDizhiColor(bazi.yz)),
        _buildTableCell(bazi.rz, fontSize: 24, color: _getDizhiColor(bazi.rz)),
        _buildTableCell(bazi.sz, fontSize: 24, color: _getDizhiColor(bazi.sz)),
      ],
    );
  }

  TableRow _buildCangganRow() {
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFF999999)),
      children: [
        _buildTableCell('藏干:', isHeader: true),
        _buildCangganCell(['甲 劫财', '乙 比肩']),
        _buildCangganCell(['壬 正印', '甲 劫财']),
        _buildCangganCell(['丁 伤官', '己 食神']),
        _buildCangganCell(['甲 劫财', '乙 比肩']),
      ],
    );
  }

  Widget _buildCangganCell(List<String> items) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: items.map((item) => Container(
          margin: const EdgeInsets.symmetric(vertical: 1),
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
        )).toList(),
      ),
    );
  }

  TableRow _buildNayinRow() {
    final nayin = widget.result.data.nayin;
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFFCCCCCC)),
      children: [
        _buildTableCell('纳音:', isHeader: true),
        _buildTableCell(nayin.nz),
        _buildTableCell(nayin.yz),
        _buildTableCell(nayin.rz),
        _buildTableCell(nayin.sz),
      ],
    );
  }

  TableRow _buildKongwangRow() {
    final kongwang = widget.result.data.kongwang;
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFF999999)),
      children: [
        _buildTableCell('空亡:', isHeader: true),
        _buildTableCell(kongwang.nz),
        _buildTableCell(kongwang.yz),
        _buildTableCell(kongwang.rz),
        _buildTableCell(kongwang.sz),
      ],
    );
  }

  TableRow _buildShenshaRow() {
    final shensha = widget.result.data.shensha;
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFFCCCCCC)),
      children: [
        _buildTableCell('神煞:', isHeader: true),
        _buildShenshaCell(shensha.nz),
        _buildShenshaCell(shensha.yz),
        _buildShenshaCell(shensha.rz),
        _buildShenshaCell(shensha.sz),
      ],
    );
  }

  Widget _buildShenshaCell(List<String> items) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: items.map((item) => Container(
          margin: const EdgeInsets.symmetric(vertical: 1),
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
        )).toList(),
      ),
    );
  }

  TableRow _buildXingyunRow() {
    final xingyun = widget.result.data.xingyun;
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFF999999)),
      children: [
        _buildTableCell('星运:', isHeader: true),
        _buildTableCell(xingyun.nz),
        _buildTableCell(xingyun.yz),
        _buildTableCell(xingyun.rz),
        _buildTableCell(xingyun.sz),
      ],
    );
  }

  TableRow _buildZizuoRow() {
    final zizuo = widget.result.data.zizuo;
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFFCCCCCC)),
      children: [
        _buildTableCell('自座:', isHeader: true),
        _buildTableCell(zizuo.nz),
        _buildTableCell(zizuo.yz),
        _buildTableCell(zizuo.rz),
        _buildTableCell(zizuo.sz),
      ],
    );
  }

  Widget _buildTableCell(String text, {
    bool isHeader = false,
    double fontSize = 12,
    Color? color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: color ?? (isHeader ? Colors.white : const Color(0xFF333333)),
        ),
      ),
    );
  }

  // 颜色辅助方法
  Color _getShishenColor(String shishen) {
    switch (shishen) {
      case '七杀': case '正官': return Colors.green;
      case '正财': case '偏财': return Colors.blue;
      case '正印': case '偏印': return Colors.red;
      case '伤官': case '食神': return const Color(0xFFFD7C04);
      case '比肩': case '劫财': return const Color(0xFF995001);
      default: return const Color(0xFF333333);
    }
  }

  Color _getTianganColor(String tiangan) {
    switch (tiangan) {
      case '甲': case '乙': return Colors.green;
      case '丙': case '丁': return Colors.red;
      case '戊': case '己': return const Color(0xFF995001);
      case '庚': case '辛': return const Color(0xFFFD7C04);
      case '壬': case '癸': return Colors.blue;
      default: return const Color(0xFF333333);
    }
  }

  Color _getDizhiColor(String dizhi) {
    switch (dizhi) {
      case '子': case '亥': return Colors.blue;
      case '寅': case '卯': return Colors.green;
      case '巳': case '午': return Colors.red;
      case '申': case '酉': return const Color(0xFFFD7C04);
      case '辰': case '戌': case '丑': case '未': return const Color(0xFF995001);
      default: return const Color(0xFF333333);
    }
  }

  Widget _buildChengguCard() {
    final fx = widget.result.data.fx;
    if (fx == null || fx.cgg.isEmpty) return const SizedBox.shrink();

    return Card(
      elevation: 2,
      child: Container(
        width: double.infinity,
        child: Table(
          columnWidths: const {
            0: FixedColumnWidth(80),
            1: FlexColumnWidth(),
          },
          children: [
            TableRow(
              decoration: const BoxDecoration(color: Color(0xFFCCCCCC)),
              children: [
                _buildTableCell('称骨重量:', isHeader: false),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    '四两八钱',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(color: Color(0xFF999999)),
              children: [
                _buildTableCell('称骨评语:', isHeader: false),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    fx.cgg.isNotEmpty ? fx.cgg.first : '',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailTable() {
    return Card(
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Table(
          columnWidths: const {
            0: FixedColumnWidth(60),
            1: FixedColumnWidth(80),
            2: FixedColumnWidth(80),
            3: FlexColumnWidth(),
            4: FlexColumnWidth(),
            5: FlexColumnWidth(),
            6: FlexColumnWidth(),
            7: FlexColumnWidth(),
          },
          children: [
            _buildDetailHeaderRow(),
            _buildDetailTianganRow(),
            _buildDetailDizhiRow(),
            _buildDetailKongwangRow(),
            _buildDetailXingyunRow(),
            _buildDetailZizuoRow(),
            _buildDetailNayinRow(),
          ],
        ),
      ),
    );
  }

  TableRow _buildDetailHeaderRow() {
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFF999999)),
      children: [
        _buildTableCell('日期', isHeader: true),
        _buildTableCell('流年', isHeader: true),
        _buildTableCell('小运', isHeader: true),
        _buildTableCell('年柱', isHeader: true),
        _buildTableCell('月柱', isHeader: true),
        _buildTableCell('日柱', isHeader: true),
        _buildTableCell('时柱', isHeader: true),
      ],
    );
  }

  TableRow _buildDetailTianganRow() {
    final bazi = widget.result.data.bazi;
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFFEEEEEE)),
      children: [
        _buildTableCell('天干'),
        _buildDetailBzCell(bazi.ng, '杀'),
        _buildDetailBzCell('癸', '才'),
        _buildDetailBzCell(bazi.ng, '杀'),
        _buildDetailBzCell(bazi.yg, '财'),
        _buildDetailBzCell(bazi.rg, '男'),
        _buildDetailBzCell(bazi.sg, '官'),
      ],
    );
  }

  TableRow _buildDetailDizhiRow() {
    final bazi = widget.result.data.bazi;
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFFCCCCCC)),
      children: [
        _buildTableCell('地支'),
        _buildDetailBzCell(bazi.nz, '印劫伤'),
        _buildDetailBzCell('亥', '财官'),
        _buildDetailBzCell(bazi.nz, '印伤劫'),
        _buildDetailBzCell(bazi.yz, '枭比'),
        _buildDetailBzCell(bazi.rz, '印伤劫'),
        _buildDetailBzCell(bazi.sz, '才'),
      ],
    );
  }

  TableRow _buildDetailKongwangRow() {
    final kongwang = widget.result.data.kongwang;
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFFDDDDDD)),
      children: [
        _buildTableCell('空亡'),
        _buildTableCell(kongwang.nz),
        _buildTableCell('子丑'),
        _buildTableCell(kongwang.nz),
        _buildTableCell(kongwang.yz),
        _buildTableCell(kongwang.rz),
        _buildTableCell(kongwang.sz),
      ],
    );
  }

  TableRow _buildDetailXingyunRow() {
    final xingyun = widget.result.data.xingyun;
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFFCCCCCC)),
      children: [
        _buildTableCell('星运'),
        _buildTableCell(xingyun.nz),
        _buildTableCell('胎'),
        _buildTableCell(xingyun.nz),
        _buildTableCell(xingyun.yz),
        _buildTableCell(xingyun.rz),
        _buildTableCell(xingyun.sz),
      ],
    );
  }

  TableRow _buildDetailZizuoRow() {
    final zizuo = widget.result.data.zizuo;
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFFDDDDDD)),
      children: [
        _buildTableCell('自座'),
        _buildTableCell(zizuo.nz),
        _buildTableCell('帝旺'),
        _buildTableCell(zizuo.nz),
        _buildTableCell(zizuo.yz),
        _buildTableCell(zizuo.rz),
        _buildTableCell(zizuo.sz),
      ],
    );
  }

  TableRow _buildDetailNayinRow() {
    final nayin = widget.result.data.nayin;
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFFCCCCCC)),
      children: [
        _buildTableCell('纳音'),
        _buildTableCell(nayin.nz),
        _buildTableCell('大海水'),
        _buildTableCell(nayin.nz),
        _buildTableCell(nayin.yz),
        _buildTableCell(nayin.rz),
        _buildTableCell(nayin.sz),
      ],
    );
  }

  Widget _buildDetailBzCell(String big, String small) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Text(
            big,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: _getTianganColor(big),
            ),
          ),
          Text(
            small,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDaYunTable() {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFF666666),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
            child: const Text(
              '大运信息',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Table(
              columnWidths: const {
                0: FixedColumnWidth(60),
                1: FlexColumnWidth(),
                2: FlexColumnWidth(),
                3: FlexColumnWidth(),
                4: FlexColumnWidth(),
                5: FlexColumnWidth(),
              },
              children: [
                _buildDaYunHeaderRow(),
                _buildDaYunDataRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TableRow _buildDaYunHeaderRow() {
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFFCCCCCC)),
      children: [
        _buildTableCell('大运', isHeader: true),
        _buildTableCell('1-10', isHeader: true),
        _buildTableCell('11-20', isHeader: true),
        _buildTableCell('21-30', isHeader: true),
        _buildTableCell('31-40', isHeader: true),
        _buildTableCell('41-50', isHeader: true),
      ],
    );
  }

  TableRow _buildDaYunDataRow() {
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xFFEEEEEE)),
      children: [
        _buildTableCell('干支'),
        _buildTableCell('甲子'),
        _buildTableCell('乙丑'),
        _buildTableCell('丙寅'),
        _buildTableCell('丁卯'),
        _buildTableCell('戊辰'),
      ],
    );
  }

  Widget _buildCurrentLiunianTable() {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFF666666),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
            child: const Text(
              '当前流年信息',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('流年：', '2023年 癸卯'),
                const SizedBox(height: 8),
                _buildInfoRow('小运：', '癸亥'),
                const SizedBox(height: 8),
                _buildInfoRow('空亡：', '子丑'),
                const SizedBox(height: 8),
                _buildInfoRow('纳音：', '大海水'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShenshaTable() {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFF666666),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
            child: const Text(
              '神煞信息',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('年柱神煞：', '天德 月德 国印'),
                const SizedBox(height: 8),
                _buildInfoRow('月柱神煞：', '天乙贵人 太极贵人'),
                const SizedBox(height: 8),
                _buildInfoRow('日柱神煞：', '桃花 咸池'),
                const SizedBox(height: 8),
                _buildInfoRow('时柱神煞：', '华盖 孤辰'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
