//勝利シーンについてのタブ

int countW = -1;//勝利画面のカウンター
int countR = -1;//最大連続ヒット数用のカウンター
int countS = 0;//最大スコア用のカウンター
int sentakushi = 0;//選択肢のカーソルがどっちにあるかを判別するために使う
int winNum = 0;//勝った回数をカウントする
int hiSize = 500;//アニメーション開始位置

//GAME CLEARの文字サイズ
int g1 = 500, a2 = 500, m3 = 500, e4 = 500, c5 = 500,
    l6 = 500, e7 = 500, a8 = 500, r9 = 500;

//勝利シーンに関する関数
void resultWin()
{
  //カウントスタート
  countW++;

  
  //白フェードアウト
  tint( 255.0, 20 );
  image( img27, 0, 0 );
  noTint();
 
  //ボスの撃破音を鳴らす
  if(countW < 60 * 3)
  {
    player20.play();
  }
  //1.5秒経過で画面真っ白
  if(countW >= 30*3)
  {
    image( img27, 0, 0 );
  }
  //2.5秒経過で勝利画面
  if(countW >= 30*5)
  {    
    player10.play();//BGMスターと
    player5.pause();//戦闘BGMの終了
    image(img28, 0, 0);//背景
  }
  if(countW >= 30*5 && countW < 30*8)
  {    
    image(img1, 700, 400);//プレイヤー
    textSize(120);
    fill(0, 0, 0, 50);
    rect(0, 200, width, 100);
    fill(0);
    line(0, 300, width, 300);
    line(0, 267, width, 267);
    line(0, 233, width, 233);
    line(0, 200, width, 200);
    fill(255, 215, 55);

    //game clearの文字を映す
    if(countW >= 150 && countW <= 30 * 8)
    {
      player19.play();
      g1 = eftNum(g1, 70, 120, 120);
      textSize(g1);
      text("G", 450, 300);
    }

    if(countW >= 155 && countW <= 30 * 8)
    {
      textSize(a2);
      a2 = eftNum(a2, 70, 120, 120);
      text("A", 450 + 120, 300);
    }

    if(countW >= 160 && countW <= 30 * 8)
    {
      textSize(m3);
      m3 = eftNum(m3, 70, 120, 120);
      text("M", 450 + 120*2, 300);
    }

    if(countW >= 165 && countW <= 30 * 8)
    {
      textSize(e4);
      e4 = eftNum(e4, 70, 120, 120);
      text("E", 450 + 120*3, 300);
    }

    if(countW >= 170 && countW <= 30 * 8)
    {
      textSize(c5);
      c5 = eftNum(c5, 70, 120, 120);
      text("C", 450 + 120*4, 300);
    }

    if(countW >= 175 && countW <= 30 * 8)
    {
      textSize(l6);
      l6 = eftNum(l6, 70, 120, 120);
      text("L", 450 + 120*5, 300);
    }

    if(countW >= 180 && countW <= 30 * 8)
    {
      textSize(e7);
      e7 = eftNum(e7, 70, 120, 120);
      text("E", 450 + 120*6, 300);
    }

    if(countW >= 185 && countW <= 30 * 8)
    {
      textSize(a8);
      a8 = eftNum(a8, 70, 120, 120);
      text("A", 450 + 120*7, 300);
    }

    if(countW >= 190 && countW <= 30 * 8)
    {
      textSize(r9);
      r9 = eftNum(r9, 70, 120, 120);
      text("R", 450 + 120*8, 300);
    }
  }
  
  //4秒経過でリザルト画面
  if(countW >= 30*8)
  {    
    //テキストボックスの作成
    fill(0, 0, 0, 100);
    rect(350, 200, 1200, 1000, 30);
    noStroke();
    fill(0, 255, 255);
    rect(730, 150, 400, 100);
    triangle(680, 200, 730, 150, 730, 250);
    triangle(1130, 150, 1180, 200, 1130, 250);
    textSize(80);
    fill(0);
    text("リ ザ ル ト", 770, 230);
  }
  
  //4.5秒経過で連続ヒット数の表示
  if(countW >= 30*9)
  {
     textSize(60);
     fill(255);
     text("最大ヒット数", 510, 450);
     //最大連続ヒット数の表示
    if(countR <= maxRef)
    {
      countR++;
    }
    if(countR > maxRef)
    {
      player17.play();
      countR = maxRef;
    }
    textSize(80);
    fill(255);
    text(countR, 1200, 450);
    
    //もし過去の連続ヒット回数より今の連続ヒット回数が大きかったら、ファイルに書き込む
   if(beforeRef < maxRef)
   {
     //ハイスコアの保存
     hirefNum[0] = str(maxRef);
     saveStrings("hirefNum.txt", hirefNum);
   }
  }
  
  //5秒経過でスコアの表示
  if(countW >= 30*10)
  {
    textSize(60);
    fill(255);
    text("スコア", 650, 600);
     //スコアの表示
    if(countS <= score)
    {
      countS = countS + 2212;
    }
    if(countS > score)
    {
      player17.play();
      countS = score;
    }
    textSize(80);
    fill(255);
    text(countS, 1000, 600);
    
    //もし過去の最高スコアより今のが大きかったら、ファイルに書き込む
    if(beforeScore < score)
    {
      //ハイスコアの保存
      hiScore[0] = str(score);
      saveStrings("hiScore.txt", hiScore);
    }
    //ハイスコアのマークを表示
    if(beforeScore < score && countS == score)
    {
      if(hiSize > 40)
      {
        hiSize = hiSize - 60;
      }
      if(hiSize <= 40)
      {
        hiSize = 40;
      }
      player11.play();  //再生
      fill(255, 155, 0);
      ellipse(1275, 510, 320, 70); 
      fill(255);
      textSize(hiSize);
      text("ハイスコア更新", 1150, 525);
    }
  }
    
  //スコア表示で選択肢
  if(countS == score && countW >= 30*10)
  {
    textSize(80);
    fill(255);
    text("ゲーム終了", 500, 840);
    text("再戦する", 1050, 840);
    
    //十字キーで選択肢の操作
    if(keyCode != LEFT && keyCode != RIGHT)
    {
      triangle(470, 800, 500, 820, 470, 840);
    }
    if(keyCode == LEFT)
    {
       triangle(470, 800, 500, 820, 470, 840);
       sentakushi = 1;
    }
    if(keyCode == RIGHT)
    {
       triangle(1000, 800, 1050, 820, 1000, 840);
       sentakushi = 2;
    }
    
    //ゲーム終了を選択するとゲームが終了する
    if(keyPressed)
    {  
      if((sentakushi == 0 || sentakushi == 1) && key == '\n')
      {
        exit();
      }
    
      //再戦するを選択すると戦闘シーンに入り、パラメータをすべて初期化させる
      if(sentakushi == 2 && key == '\n')
      {
        player11.rewind();
        player11.pause();
        player20.rewind();
        player20.pause();
        player17.rewind();
        player17.pause();
        player18.rewind();
        player18.pause();
        player2.rewind();//効果音再再生
        player5.rewind();//BGM再再生
        sceneid = 2;//戦闘シーンに移る
        count = 0;//ゲーム進行中のカウントをリセット
        playHP = 360;//味方の体力をリセット
        enemHP = 360;//敵の体力をリセット
        colflagP = 0;//ダメージラインに入った回数をリセット
        colflagB = 0;//ブロックにスターが当たった回数をリセット
        maxRef = 0;//連続ヒット数の最大コンボをリセット
        rate = 0;//必殺技ゲージのリセット
        countW = 0;//勝利画面のカウンター
        countR = 0;//最大連続ヒット数用のカウンター
        countS = 0;//最大スコア用のカウンター
        countA = 0;//戦闘シーン用のカウンター
        countAnim = 0;//アニメーションのカウンター
        sentakushi = 0;//選択肢のカーソルがどっちにあるかを判別をリセット
        refNum = 0;//スターがラケットに当たった回数をリセット
        starEnables = true;//スターの非表示
        starEnables2 = true;//必殺技の非表示
        counter = 0;//スターが発射されているかどうかの判別をリセット
        counter2 = 0;//必殺技が発射されているかどうかの判別 をリセット
        colflag =0;//ボスとスターの衝突回数をリセット
        score = 0;//スコアのリセット
        countBs = 0;//ボスのアニメーションに関する関数
        clearBs = 0;//フェードアウトの透明度
        clearBs2 = 0;//フェードアウトの透明度
        clearBs3 = 0;//フェードアウトの透明度
        clearBs4 = 0;//フェードアウトの透明度
        clearBs5 = 255;//フェードアウトの透明度
        clearBd = 0;//ボスの透明度
        clearBd2 = 0;//ボスの透明度
        clearBd3 = 255;//ボスの透明度
        picRepx = 0;//ボスの座標調整
        picRepy = 0;//ボスの座標調整
        objScale = 1;//図形の拡大率
        picScalex = 300;//画像の拡大率
        picScaley = 300;//画像の拡大率
        Fcount = 0;//ブロックのカウント
        //覚醒演出用エフェクトとカウンター
        clearSpr = 0;
        countSpr = 0;
        clearCcl = 255;
        bigger = 0;
        countBs = 0;//ボスのアニメーションに関する関数
        clearBs = 0;//フェードアウトの透明度
        clearBs2 = 0;//フェードアウトの透明度
        clearBs3 = 0;//フェードアウトの透明度
        clearBs4 = 0;//フェードアウトの透明度
        clearBs5 = 255;//フェードアウトの透明度
        clearBd = 0;//ボスの透明度
        clearBd2 = 0;//ボスの透明度
        clearBd3 = 255;//ボスの透明度
        picRepx = 0;//ボスの座標調整
        picRepy = 0;//ボスの座標調整
        objScale = 1;//図形の拡大率
        picScalex = 300;//画像の拡大率
        picScaley = 300;//画像の拡大率
        enemClr = 0;
        clearBtl = 255;//バトルシーンに入るときのフェード用カウント
        clearhst = 255;//プレイヤー変身モーション用
        playClr = 0;//ダメージくらったとき用
        boss = 0;//ボス覚醒用の判別
        //GAME CLEARの文字サイズ
        g1 = 500;
        a2 = 500;
        m3 = 500;
        e4 = 500;
        c5 = 500;
        l6 = 500;
        e7 = 500;
        a8 = 500;
        r9 = 500;
        //ブロックの表示をリセット
        for(int i = 0; i < 5; i++)
        {
          iBlock[i] = true;
          i2Block[i] = true;
          i3Block[i] = true;
          i4Block[i] = true;
          i5Block[i] = true;
        }   
        for (int i = 0; i < 5; i++)
        {
          FiBlock[i] = true;
          Fi2Block[i] = true;
          Fi3Block[i] = true;
          Fi4Block[i] = true;
          Fi5Block[i] = true;
        }
      }
    }
  }
}
