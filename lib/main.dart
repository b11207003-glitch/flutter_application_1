// 引入 Flutter 的 Material Design 元件庫，提供豐富的 UI 元件與 Material 3 主題支援
import 'package:flutter/material.dart';

// 應用程式的主進入點
void main() {
  // 啟動並運行 Flutter 應用，將 MyApp 根元件掛載至畫面樹狀結構（Widget Tree）
  runApp(const MyApp());
}

/// [MyApp] 是應用程式的根元件。
/// 繼承自 [StatelessWidget]，表示此元件本身不保存可變狀態（無狀態元件）。
class MyApp extends StatelessWidget {
  // 建構子：super.key 用於在 Widget Tree 中唯一標識與管理該元件
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp 是 Flutter 的頂層容器，封裝了主題、路由導航及文字方向等核心設定
    return MaterialApp(
      // 應用程式名稱（用於作業系統的工作管理員或視窗標題）
      title: 'Flutter Demo',
      // 設定全域的主題配色
      theme: ThemeData(
        // 透過單一種子色彩（Colors.deepPurple）自動計算並產生一整套協調的 Material 3 配色方案
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      // 設定應用程式啟動時展示的第一個頁面為 MyHomePage
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/// [MyHomePage] 是應用的主頁面元件。
/// 繼承自 [StatefulWidget]，表示此元件擁有可隨使用者操作而動態改變的狀態（有狀態元件）。
class MyHomePage extends StatefulWidget {
  // 建構子：接收外部傳入的參數，required 表示 title 參數為必填
  const MyHomePage({super.key, required this.title});

  // 從父元件傳入的頁面標題（在 Widget 中定義的屬性需為 final，保持其不可變性）
  final String title;

  @override
  // 建立並返回與此 StatefulWidget 綁定的 State 狀態管理物件
  State<MyHomePage> createState() => _MyHomePageState();
}

/// [_MyHomePageState] 負責保存並管理 [MyHomePage] 的動態狀態與 UI 渲染。
/// 類別名稱以底線開頭（_），代表其為私有類別（Private），僅限於當前檔案內使用。
class _MyHomePageState extends State<MyHomePage> {
  // 計數器變數：記錄按鈕被點擊的次數
  int _counter = 0;

  // 累加計數器的邏輯處理函式
  void _incrementCounter() {
    // setState 是通知 Flutter 狀態已改變的關鍵方法；
    // 它會將此 State 標記為需要重新構建，進而排程再次執行 build() 方法更新畫面
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 每次呼叫 setState 時，此 build 方法都會重新執行以刷新畫面 UI。
    // Scaffold 提供了標準 Material 頁面的視覺架構（包含頂部 AppBar、主體 body 與懸浮按鈕 FAB 等）
    return Scaffold(
      // 頂部應用程式列（導覽列）
      appBar: AppBar(
        // 從當前主題中取得 inversePrimary 顏色作為導覽列背景色
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // 透過 widget.title 存取父層 MyHomePage 傳入的標題文字
        title: Text(widget.title),
      ),
      // 頁面主體內容
      body: Center(
        // Center 元件會將其內部的子元件置於螢幕正中央
        child: Column(
          // mainAxisAlignment 決定垂直主軸的對齊方式，此處設為置中
          mainAxisAlignment: .center,
          // Column 內垂直依序排列的子元件清單
          children: [
            // 靜態說明文字（使用 const 宣告可避免重複重建以提升效能）
            const Text('You have pushed the button this many times:'),
            // 動態文字：顯示當前計數器數值，並套用 Material 主題中的 headlineMedium 字體樣式
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      // 畫面右下角的懸浮動作按鈕
      floatingActionButton: FloatingActionButton(
        // 點擊按鈕時觸發的回呼函式（Callback）
        onPressed: _incrementCounter,
        // 長按按鈕時顯示的提示文字（支援無障礙輔助）
        tooltip: 'Increment',
        // 按鈕內部顯示的加號圖示（使用 const 優化效能）
        child: const Icon(Icons.add),
      ),
    );
  }
}
