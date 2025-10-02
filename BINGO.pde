int[][] test = new int[5][5];    // 5x5の2次元配列を用意（ビンゴカード用）
int[][] press = new int[5][5];   // 5x5の押下状態を管理する配列

void setup(){
  size(330, 390);                // ウィンドウサイズを設定
  boolean tyouhuku;              // 重複チェック用のフラグ

  // ビンゴカードの数字を生成（列ごとに1〜15,16〜30,...の範囲）
  for(int i=0; i<5; i+=1){      // 列ループ
    for(int j=0; j<5; j+=1){    // 行ループ
      do {      
        tyouhuku = false;                     // 重複チェックフラグを初期化
        test[i][j] = int(random(1 + 15*i, 16 + 15*i)); // 列ごとの範囲で乱数生成

        // 同じ列内で重複していないかチェック
        for (int k = j - 1; k >= 0; k -= 1){
          if(test[i][k] == test[i][j]){
            tyouhuku = true;  // 重複があった場合フラグを立てる
            break;            // 内側のループを抜ける
          }
        }
      } while(tyouhuku == true); // 重複がある場合は再度乱数生成

      press[i][j] = 1;           // 各マスの初期押下状態を1に設定
    }
  }

  test[2][2] = -1;               // 真ん中のマスをフリーに設定（-1）

  // 列ごとに昇順に並び替え（バブルソート） ※フリーは除外
  for (int i = 0; i < 5; i += 1){         
    for (int j = 0; j < 5 - 1; j += 1){         
      for (int k = 0; k < 5 - 1 - j; k += 1){
        if(test[i][k] == -1) {
          // フリーマスなら何もしない
        } 
        else if(test[i][k+1] == -1){
          // 次のマスがフリーの場合はさらに次のマスと比較
          if (test[i][k] > test[i][k+2]) {
            int tmp = test[i][k];        // 値を入れ替え
            test[i][k] = test[i][k+2];
            test[i][k+2] = tmp;
          }
        } 
        else if (test[i][k] > test[i][k+1]){
          int tmp = test[i][k];          // 通常の隣接マス同士を比較して入れ替え
          test[i][k] = test[i][k+1];
          test[i][k+1] = tmp;
        }
      }
    }
  }
}
