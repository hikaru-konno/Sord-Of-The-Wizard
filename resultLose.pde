//負けシーンについてのタブ

int countL = 0;//カウンター
int loseY = 400;//選択肢カーソル(?)の初期位置

//負けたときのシーンに関する関数
void resultLose()
{
  countL++;
  player5.pause();//戦闘BGMの終了

  //黒フェードアウト
  tint( 255.0, 5 );
  image( img26, 0, 0 );
  noTint();
  
  //2秒経過でリトライ画面
  if(countL >= 60*2)
  {
    //テキストの表示
    textSize(30);
    fill(192, 194, 177);
    text("リトライ", 800, 450);
    text("ゲームを終了する", 800, 510);
    
    //テキストボックスの表示　透明度を用いてフェードアウト表現
    noStroke();
    fill(255, 255, 255, 50);
    rect(0, loseY, width, 65);
    noFill();
    
    //十字キーで選択肢操作
    if(keyCode == LEFT)
    {
       loseY = 400;
    }
    if(keyCode == RIGHT)
    {
       loseY = 460;
    }
    if(keyPressed)
    {     
      //上の選択肢を選ぶと戦闘シーンへ
      if(key == '\n' && loseY == 400)
      {
        //変数などの値をすべてリセット
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
      
      //下の選択肢を選ぶとゲームの終了
      if(key == '\n' && loseY == 460)
      {
         exit();
      }
    }
  }
}
