int[] number = new int[75];   // 1～75の重複なし乱数を格納する配列
int[] hyouji = new int[75];   // 出力用に表示する数字を格納する配列
char[] bingo = {'B','I','N','G','O'};  // ビンゴ列のラベル
int i = 0;                     // 表示用のカウンター
boolean press = false;         // クリックなどの押下状態を管理するフラグ
boolean tyouhuku;              // 重複チェック用のフラグ

void setup(){
  size(800,600);               // ウィンドウサイズを設定

  // 1～75までの数字を重複なしで生成
  for(int k = 0; k < 75; k += 1){   
    do {
      tyouhuku = false;                        // 重複チェックフラグを初期化
      number[k] = int(random(1, 76));          // 1～75の乱数を生成して格納

      // すでに生成された数字と重複していないかチェック
      for(int j = k-1; j >= 0; j -= 1){    
        if(number[k] == number[j]){           // すでに同じ数字があれば
          tyouhuku = true;                    // 重複フラグを立てる
          break;                               // ループを抜けて再生成
        }
      }
    } while(tyouhuku == true);                 // 重複していたらやり直す
  }
}
