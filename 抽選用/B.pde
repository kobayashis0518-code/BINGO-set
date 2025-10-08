void draw() {
  background(255);        // 背景を白にする
  textSize(50);           // 数字表示用のフォントサイズ
  fill(0);                // 文字色を黒に設定

  // マウスが押されていた場合、次の数字を表示用配列に追加
  if(press == true){
    hyouji[i] = number[i];  // number配列の数字をhyouji配列にコピー
    i = i + 1;              // カウンターを進める
    press = false;          // マウス押下フラグをリセット
  }

  textSize(30);            // ビンゴ表示用の文字サイズに設定

  // 表示済みの数字をすべて描画
  for(int k = 0; k < i; k += 1){

    // 数字の列(B〜O)に応じて色を変える
    switch((hyouji[k]-1)/15) {  
      case 0:
        fill(255,0,0);     // B列は赤
        break;
      case 1:
        fill(0,0,255);     // I列は青
        break;
      case 2:
        fill(0,255,0);     // N列は緑
        break;
      case 3:
        fill(255,255,0);   // G列は黄
        break;
      case 4:
        fill(255,0,255);   // O列は紫
        break;
    }

    // 文字を表示
    // 横位置: 10個ごとに改行 (k%10)
    // 縦位置: 行番号に応じて下にずらす ((k/10)+1)
    text(bingo[(hyouji[k]-1)/15] + str(hyouji[k]), 75 * (k % 10) + 5, ((k / 10) + 1) * 50);
  }
}
