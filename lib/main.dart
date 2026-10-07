// 引入 Flutter 的 Material Design 元件庫，提供豐富的 UI 元件（如 AppBar、Scaffold、ListView 等）
import 'package:flutter/material.dart';

// 應用程式的進入點（Entry Point）
void main() {
  // 啟動並運行 Flutter 應用程式，將 MyApp 設置為根元件
  runApp(const MyApp());
}

// MyApp 是整個應用程式的根元件（Root Widget）
// 繼承 StatelessWidget 表示這是一個「無狀態元件」，內部狀態不會隨時間改變
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // build 方法負責描述該元件在螢幕上如何呈現
  @override
  Widget build(BuildContext context) {
    // MaterialApp 是 Material 風格應用的頂層容器，負責路由、主題等設定
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 隱藏右上角的 DEBUG 橫幅標籤
      title: 'ListView 1-30', // 應用程式名稱
      theme: ThemeData(
        // 使用種子色彩自動生成符合 Material 3 規範的一套配色
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, // 啟用 Material 3 設計規範
      ),
      // 設定應用程式啟動後顯示的第一個頁面（首頁）
      home: const NumberListPage(),
    );
  }
}

// 首頁畫面元件：同樣為無狀態元件
class NumberListPage extends StatelessWidget {
  const NumberListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 定義頂部應用程式列（AppBar）
    var appBar = AppBar(
      title: const Text('1 到 30 列表'), // 標題文字
      backgroundColor: Theme.of(context).colorScheme.inversePrimary, // 背景顏色取自主題色
    );

    // 定義列表清單（ListView）
    var listView = ListView(
      children: [
        ListTile(title: Text("第一項")), // 列表的第一個項目
        ListTile(title: Text("第二項")), // 列表的第二個項目
        ListTile(title: Text("第三項")), // 列表的第三個項目
      ],
    );

    // Scaffold 是頁面結構的骨架，提供了 AppBar、抽屜選單、主體內容等基本版面配置
    return Scaffold(
      appBar: appBar,  // 頂部導覽列
      body: listView,  // 畫面主體內容
    );
  }
}

