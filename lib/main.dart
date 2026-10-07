import 'package:flutter/material.dart';

// 應用程式進入點
void main() {
  // 啟動 Flutter 應用程式並掛載根元件 MyApp
  runApp(const MyApp());
}

// 應用程式根元件 (無狀態元件)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 隱藏右上角的除錯標籤 (DEBUG Banner)
      debugShowCheckedModeBanner: false,
      // 應用程式標題
      title: 'ListView 1-30',
      // 設定應用程式的主題樣式
      theme: ThemeData(
        // 以 deepPurple 為種子色自動生成 Material 3 配色方案
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // 設定應用程式啟動時顯示的首頁元件
      home: const NumberListPage(),
    );
  }
}

// 顯示 1 到 30 數字清單的頁面元件 (無狀態元件)
class NumberListPage extends StatelessWidget {
  const NumberListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold 提供頁面的基礎佈局結構 (如導覽列、頁面主體等)
    return Scaffold(
      // 頂部導覽列
      appBar: AppBar(
        title: const Text('1 到 30 列表'), // 導覽列標題
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // 使用主題的反轉主要色彩作為背景
      ),
      // 頁面主體：使用 ListView.builder 動態建構可滾動的清單 (適合長清單，具按需渲染效益)
      body: ListView.builder(
        itemCount: 30, // 清單項目總數量 (生成 30 個項目)
        itemBuilder: (context, index) {
          // index 為項目的索引值 (從 0 到 29)，轉換為 1 到 30 的數值
          final number = index + 1;
          return ListTile(
            // 左側前置元件：圓形頭像 (CircleAvatar)，內部顯示數字
            leading: CircleAvatar(
              child: Text('$number'),
            ),
            // 主要標題文字：顯示數字
            title: Text('$number'),
          );
        },
      ),
    );
  }
}

