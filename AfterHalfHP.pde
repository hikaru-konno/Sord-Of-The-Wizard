//アザトース覚醒後についてのタブ

//ブロックの表示or非表示を判別するためのboolean
boolean[] FiBlock = new boolean[5];
boolean[] Fi2Block = new boolean[5];
boolean[] Fi3Block = new boolean[5];
boolean[] Fi4Block = new boolean[5];
boolean[] Fi5Block = new boolean[5];

int Fcount = 0;//ブロックのカウント

//覚醒演出用エフェクトとカウンター
int clearSpr = 0;
int countSpr = 0;
int clearCcl = 255;
int bigger = 0;

//覚醒するときのシーン
void effectSpr()
{
    countSpr++;

    image(img15, 0, 0);//背景画像の表示
    image(img2, 80, temp);//playerの画像表示

    //敵暗転
    if(countSpr <= 60 * 20)
    {
        image(img9, 1600, -sin(rad) * 50 + 320);
        tint(0, clearSpr);
        clearSpr = clearObj(clearSpr, 3, 255);
        image(img9, 1600, -sin(rad) * 50 + 320);
        noTint();
    }

    //覚醒後の姿を表す
    if(countSpr >= 60 * 2)
    {
        image(img35, 1600, -sin(rad) * 50 + 320);
    }
    //覚醒時のエフェクト
    if(countSpr >= 60 * 2 && countSpr <= 60 * 6)
    {
        player12.play();  //効果音再生
        noFill();
        stroke(0, clearCcl);
        clearCcl = eftNum(clearCcl, 10, 0, 255);//円を透明化していく
        strokeWeight(40);

        //円を拡大していく
        circle(1750, (-sin(rad) * 50 + 320) + 150, bigger);
        if(bigger <= 1920)
        {
            bigger = bigger + 100;
        }
        if(bigger > 1920)
        {
            bigger = 0;
        }
    }
    //戦闘シーンに戻る
    if(countSpr > 60 * 6)
    {
        xx = -360;
        xx2 = -360;
        sceneid = 2;
        count = 0;
        //ブロックの表示をリセット
        for(int i = 0; i < 5; i++)
        {
          iBlock[i] = true;
          i2Block[i] = true;
          i3Block[i] = true;
          i4Block[i] = true;
          i5Block[i] = true;
        }   
    } 
}

//FcreateBlock():アザトース覚醒後のブロックの表示or非表示と移動中の処理を行う関数
void FcreateBlock()
{
  if(boss >= 9)
  {
  Fcount++;
  //First:緑色のブロックを展開
  if(Fcount >= 60 * 6)//6秒以降
  {
    int xB = 1300, yB = -194;//ブロックのX座標を1300、Y座標を-194に設定
    for(int i = 0; i < 5; i++)
    {
       yB += 194;//iの数だけブロックのy座標を194可算し並べていく
       if(FiBlock[i])//FiBlock[i]がtrueならばブロックを表示する
       {
         image(img10, xB - Fcount + 90 * 5, yB);//ブロックを左に移動させる
       }
      if(((xx + 30 > ((xB - Fcount + 90 * 5)) && xx + 30 < ((xB - Fcount + 90 * 5) + 92)) && (yy > yB && yy < (yB + 194)) && FiBlock[i]) || /*右端の頂点がブロックに入ったとき*/
      ((xx - 30 > ((xB - Fcount + 90 * 5)) && xx - 30 < ((xB - Fcount + 90 * 5) + 92)) && (yy > yB && yy < (yB + 194)) && FiBlock[i]) || /*左端の頂点がブロックに入ったとき*/
      ((xx > ((xB - Fcount + 90 * 5)) && xx < ((xB - Fcount + 90 * 5) + 92)) && (yy - 30 > yB && yy - 30 < (yB + 194)) && FiBlock[i]) || /*上端の頂点がブロックに入ったとき*/
      ((xx > ((xB - Fcount + 90 * 5)) && xx < ((xB - Fcount + 90 * 5) + 92)) && (yy + 30 > yB && yy + 30 < (yB + 194)) && FiBlock[i]) || /*下端の頂点がブロックに入ったとき*/
      ((xx + 20 > ((xB - Fcount + 90 * 5)) && xx + 20 < ((xB - Fcount + 90 * 5) + 92)) && (yy + 20 > yB && yy + 20 < (yB + 194)) && FiBlock[i]) || /*右ななめ上の頂点がブロックに入ったとき*/
      ((xx - 20 > ((xB - Fcount + 90 * 5)) && xx - 20 < ((xB - Fcount + 90 * 5) + 92)) && (yy + 20 > yB && yy + 20 < (yB + 194)) && FiBlock[i]) || /*左ななめ上の頂点がブロックに入ったとき*/
      ((xx + 20 > ((xB - Fcount + 90 * 5)) && xx + 20 < ((xB - Fcount + 90 * 5) + 92)) && (yy - 20 > yB && yy - 20 < (yB + 194)) && FiBlock[i]) || /*右ななめ下の頂点がブロックに入ったとき*/
      ((xx - 20 > ((xB - Fcount + 90 * 5)) && xx - 20 < ((xB - Fcount + 90 * 5) + 92)) && (yy - 20 > yB && yy - 20 < (yB + 194)) && FiBlock[i]))    /*左ななめ下の頂点がブロックに入ったとき*/
      {
        player3.play();  //再生
        player3.rewind(); 
        dx = -dx;//スター1を反射
        FiBlock[i] = false;//FiBlock[i]をfalseにしてブロックの表示させなくする
        colflagB++;//スコアを増やす
      }
      if(
      ((xx2 + 150 > ((xB - Fcount + 90 * 5)) && xx2 + 150 < ((xB - Fcount + 90 * 5) + 92)) && (yy2 > yB && yy2 < (yB + 194)) && FiBlock[i]) || /*必殺技の右端の頂点がブロックに入ったとき*/
      ((xx2 - 150 > ((xB - Fcount + 90 * 5)) && xx2 - 150 < ((xB - Fcount + 90 * 5) + 92)) && (yy2 > yB && yy2 < (yB + 194)) && FiBlock[i]) || /*必殺技の左端の頂点がブロックに入ったとき*/
      ((xx2 > ((xB - Fcount + 90 * 5)) && xx2 < ((xB - Fcount + 90 * 5) + 92)) && (yy2 - 150 > yB && yy2 - 150 < (yB + 194)) && FiBlock[i]) || /*必殺技の上端の頂点がブロックに入ったとき*/
      ((xx2 > ((xB - Fcount + 90 * 5)) && xx2 < ((xB - Fcount + 90 * 5) + 92)) && (yy2 + 150 > yB && yy2 + 150 < (yB + 194)) && FiBlock[i]) || /*必殺技の下端の頂点がブロックに入ったとき*/
      ((xx2 + 90 > ((xB - Fcount + 90 * 5)) && xx2 + 90 < ((xB - Fcount + 90 * 5) + 92)) && (yy2 + 90 > yB && yy2 + 90 < (yB + 194)) && FiBlock[i]) || /*必殺技の右ななめ上の頂点がブロックに入ったとき*/
      ((xx2 - 90 > ((xB - Fcount + 90 * 5)) && xx2 - 90 < ((xB - Fcount + 90 * 5) + 92)) && (yy2 + 90 > yB && yy2 + 90 < (yB + 194)) && FiBlock[i]) || /*必殺技の左ななめ上の頂点がブロックに入ったとき*/
      ((xx2 + 90 > ((xB - Fcount + 90 * 5)) && xx2 + 90 < ((xB - Fcount + 90 * 5) + 92)) && (yy2 - 90 > yB && yy2 - 90 < (yB + 194)) && FiBlock[i]) || /*必殺技の右ななめ下の頂点がブロックに入ったとき*/
      ((xx2 - 90 > ((xB - Fcount + 90 * 5)) && xx2 - 90 < ((xB - Fcount + 90 * 5) + 92)) && (yy2 - 90 > yB && yy2 - 90 < (yB + 194)) && FiBlock[i])    /*必殺技の左ななめ下の頂点がブロックに入ったとき*/
      )
      {
        player3.play();  //再生
        player3.rewind(); 
        FiBlock[i] = false;//ブロックを非表示
        colflagB++;//スコアを増やす
      }
      if((xB - Fcount + 90 * 5) < 360 && FiBlock[i]) /*ダメージライン内に入ったとき*/
      {
        FiBlock[i] = false;//ブロックを非表示
      }
      if((xB - Fcount + 90 * 5) == 360 && FiBlock[i])//ブロックがダメージライン内に入ったとき
      {
        colflagP++;//ダメージライン内入った数を数える
        playClr = 20;//アニメーション用
      }
    }
  }
  
  //Second:赤色のブロックを展開
  if(Fcount >= 60 * 7)//7秒以降
  {
    int xB = 1300, yB = -194;//ブロックのX座標を1300、Y座標を-194、速度を10に設定
    for(int i = 0; i < 5; i++)
    {
       yB += 194;//iの数だけブロックのy座標を194可算し並べていく
       if(Fi2Block[i])//FiBlock[i]がtrueならばブロックを表示する
       {
         image(img11, xB - Fcount + 90 * 6, yB);//ブロックを左に移動させる
       }
      if(((xx + 30 > ((xB - Fcount + 90 * 6)) && xx + 30 < ((xB - Fcount + 90 * 6) + 92)) && (yy > yB && yy < (yB + 194)) && Fi2Block[i]) || /*右端の頂点がブロックに入ったとき*/
      ((xx - 30 > ((xB - Fcount + 90 * 6)) && xx - 30 < ((xB - Fcount + 90 * 6) + 92)) && (yy > yB && yy < (yB + 194)) && Fi2Block[i]) || /*左端の頂点がブロックに入ったとき*/
      ((xx > ((xB - Fcount + 90 * 6)) && xx < ((xB - Fcount + 90 * 6) + 92)) && (yy - 30 > yB && yy - 30 < (yB + 194)) && Fi2Block[i]) || /*上端の頂点がブロックに入ったとき*/
      ((xx > ((xB - Fcount + 90 * 6)) && xx < ((xB - Fcount + 90 * 6) + 92)) && (yy + 30 > yB && yy + 30 < (yB + 194)) && Fi2Block[i]) || /*下端の頂点がブロックに入ったとき*/
      ((xx + 20 > ((xB - Fcount + 90 * 6)) && xx + 20 < ((xB - Fcount + 90 * 6) + 92)) && (yy + 20 > yB && yy + 20 < (yB + 194)) && Fi2Block[i]) || /*右ななめ上の頂点がブロックに入ったとき*/
      ((xx - 20 > ((xB - Fcount + 90 * 6)) && xx - 20 < ((xB - Fcount + 90 * 6) + 92)) && (yy + 20 > yB && yy + 20 < (yB + 194)) && Fi2Block[i]) || /*左ななめ上の頂点がブロックに入ったとき*/
      ((xx + 20 > ((xB - Fcount + 90 * 6)) && xx + 20 < ((xB - Fcount + 90 * 6) + 92)) && (yy - 20 > yB && yy - 20 < (yB + 194)) && Fi2Block[i]) || /*右ななめ下の頂点がブロックに入ったとき*/
      ((xx - 20 > ((xB - Fcount + 90 * 6)) && xx - 20 < ((xB - Fcount + 90 * 6) + 92)) && (yy - 20 > yB && yy - 20 < (yB + 194)) && Fi2Block[i]) )   /*左ななめ下の頂点がブロックに入ったとき*/
      {
        player3.play();  //再生
        player3.rewind(); 
        dx = -dx;//スター1を反射
        Fi2Block[i] = false;//FiBlock[i]をfalseにしてブロックの表示させなくする
        colflagB++;//スコアを増やす
      }
      if(
      ((xx2 + 150 > ((xB - Fcount + 90 * 6)) && xx2 + 150 < ((xB - Fcount + 90 * 6) + 92)) && (yy2 > yB && yy2 < (yB + 194)) && Fi2Block[i]) || /*必殺技の右端の頂点がブロックに入ったとき*/
      ((xx2 - 150 > ((xB - Fcount + 90 * 6)) && xx2 - 150 < ((xB - Fcount + 90 * 6) + 92)) && (yy2 > yB && yy2 < (yB + 194)) && Fi2Block[i]) || /*必殺技の左端の頂点がブロックに入ったとき*/
      ((xx2 > ((xB - Fcount + 90 * 6)) && xx2 < ((xB - Fcount + 90 * 6) + 92)) && (yy2 - 150 > yB && yy2 - 150 < (yB + 194)) && Fi2Block[i]) || /*必殺技の上端の頂点がブロックに入ったとき*/
      ((xx2 > ((xB - Fcount + 90 * 6)) && xx2 < ((xB - Fcount + 90 * 6) + 92)) && (yy2 + 150 > yB && yy2 + 150 < (yB + 194)) && Fi2Block[i]) || /*必殺技の下端の頂点がブロックに入ったとき*/
      ((xx2 + 90 > ((xB - Fcount + 90 * 6)) && xx2 + 90 < ((xB - Fcount + 90 * 6) + 92)) && (yy2 + 90 > yB && yy2 + 90 < (yB + 194)) && Fi2Block[i]) || /*必殺技の右ななめ上の頂点がブロックに入ったとき*/
      ((xx2 - 90 > ((xB - Fcount + 90 * 6)) && xx2 - 90 < ((xB - Fcount + 90 * 6) + 92)) && (yy2 + 90 > yB && yy2 + 90 < (yB + 194)) && Fi2Block[i]) || /*必殺技の左ななめ上の頂点がブロックに入ったとき*/
      ((xx2 + 90 > ((xB - Fcount + 90 * 6)) && xx2 + 90 < ((xB - Fcount + 90 * 6) + 92)) && (yy2 - 90 > yB && yy2 - 90 < (yB + 194)) && Fi2Block[i]) || /*必殺技の右ななめ下の頂点がブロックに入ったとき*/
      ((xx2 - 90 > ((xB - Fcount + 90 * 6)) && xx2 - 90 < ((xB - Fcount + 90 * 6) + 92)) && (yy2 - 90 > yB && yy2 - 90 < (yB + 194)) && Fi2Block[i])    /*必殺技の左ななめ下の頂点がブロックに入ったとき*/
      )
      {
        player3.play();  //再生
        player3.rewind(); 
        Fi2Block[i] = false;//ブロックを非表示
        colflagB++;//スコアを増やす
      }
      if((xB - Fcount + 90 * 6) < 360 && Fi2Block[i]) /*ダメージライン内に入ったとき*/
      {
        Fi2Block[i] = false;//ブロックを非表示
      }
      if((xB - Fcount + 90 * 6) == 360 && Fi2Block[i])//ブロックがダメージライン内に入ったとき
      {
        colflagP++;//ダメージライン内入った数を数える
        playClr = 20;//アニメーション用
      }
    }
  }
  
   //Third:水色のブロックを展開
  if(Fcount >= 60 * 8)//8秒以降
  {
    int xB = 1300, yB = -194;//ブロックのX座標を1300、Y座標を-194、速度を10に設定
    for(int i = 0; i < 5; i++)
    {
       yB += 194;//iの数だけブロックのy座標を194可算し並べていく
       if(Fi3Block[i])//FiBlock[i]がtrueならばブロックを表示する
       {
         image(img12, xB - Fcount + 90 * 7, yB);//ブロックを左に移動させる
       }
      if(((xx + 30 > ((xB - Fcount + 90 * 7)) && xx + 30 < ((xB - Fcount + 90 * 7) + 92)) && (yy > yB && yy < (yB + 194)) && Fi3Block[i]) || /*右端の頂点がブロックに入ったとき*/
      ((xx - 30 > ((xB - Fcount + 90 * 7)) && xx - 30 < ((xB - Fcount + 90 * 7) + 92)) && (yy > yB && yy < (yB + 194)) && Fi3Block[i]) || /*左端の頂点がブロックに入ったとき*/
      ((xx > ((xB - Fcount + 90 * 7)) && xx < ((xB - Fcount + 90 * 7) + 92)) && (yy - 30 > yB && yy - 30 < (yB + 194)) && Fi3Block[i]) || /*上端の頂点がブロックに入ったとき*/
      ((xx > ((xB - Fcount + 90 * 7)) && xx < ((xB - Fcount + 90 * 7) + 92)) && (yy + 30 > yB && yy + 30 < (yB + 194)) && Fi3Block[i]) || /*下端の頂点がブロックに入ったとき*/
      ((xx + 20 > ((xB - Fcount + 90 * 7)) && xx + 20 < ((xB - Fcount + 90 * 7) + 92)) && (yy + 20 > yB && yy + 20 < (yB + 194)) && Fi3Block[i]) || /*右ななめ上の頂点がブロックに入ったとき*/
      ((xx - 20 > ((xB - Fcount + 90 * 7)) && xx - 20 < ((xB - Fcount + 90 * 7) + 92)) && (yy + 20 > yB && yy + 20 < (yB + 194)) && Fi3Block[i]) || /*左ななめ上の頂点がブロックに入ったとき*/
      ((xx + 20 > ((xB - Fcount + 90 * 7)) && xx + 20 < ((xB - Fcount + 90 * 7) + 92)) && (yy - 20 > yB && yy - 20 < (yB + 194)) && Fi3Block[i]) || /*右ななめ下の頂点がブロックに入ったとき*/
      ((xx - 20 > ((xB - Fcount + 90 * 7)) && xx - 20 < ((xB - Fcount + 90 * 7) + 92)) && (yy - 20 > yB && yy - 20 < (yB + 194)) && Fi3Block[i]))    /*左ななめ下の頂点がブロックに入ったとき*/
      {
        player3.play();  //再生
        player3.rewind(); 
        dx = -dx;//スター1を反射
        Fi3Block[i] = false;//FiBlock[i]をfalseにしてブロックの表示させなくする
        colflagB++;//スコアを増やす
      }
      if(
      ((xx2 + 150 > ((xB - Fcount + 90 * 7)) && xx2 + 150 < ((xB - Fcount + 90 * 7) + 92)) && (yy2 > yB && yy2 < (yB + 194)) && Fi3Block[i]) || /*必殺技の右端の頂点がブロックに入ったとき*/
      ((xx2 - 150 > ((xB - Fcount + 90 * 7)) && xx2 - 150 < ((xB - Fcount + 90 * 7) + 92)) && (yy2 > yB && yy2 < (yB + 194)) && Fi3Block[i]) || /*必殺技の左端の頂点がブロックに入ったとき*/
      ((xx2 > ((xB - Fcount + 90 * 7)) && xx2 < ((xB - Fcount + 90 * 7) + 92)) && (yy2 - 150 > yB && yy2 - 150 < (yB + 194)) && Fi3Block[i]) || /*必殺技の上端の頂点がブロックに入ったとき*/
      ((xx2 > ((xB - Fcount + 90 * 7)) && xx2 < ((xB - Fcount + 90 * 7) + 92)) && (yy2 + 150 > yB && yy2 + 150 < (yB + 194)) && Fi3Block[i]) || /*必殺技の下端の頂点がブロックに入ったとき*/
      ((xx2 + 90 > ((xB - Fcount + 90 * 7)) && xx2 + 90 < ((xB - Fcount + 90 * 7) + 92)) && (yy2 + 90 > yB && yy2 + 90 < (yB + 194)) && Fi3Block[i]) || /*必殺技の右ななめ上の頂点がブロックに入ったとき*/
      ((xx2 - 90 > ((xB - Fcount + 90 * 7)) && xx2 - 90 < ((xB - Fcount + 90 * 7) + 92)) && (yy2 + 90 > yB && yy2 + 90 < (yB + 194)) && Fi3Block[i]) || /*必殺技の左ななめ上の頂点がブロックに入ったとき*/
      ((xx2 + 90 > ((xB - Fcount + 90 * 7)) && xx2 + 90 < ((xB - Fcount + 90 * 7) + 92)) && (yy2 - 90 > yB && yy2 - 90 < (yB + 194)) && Fi3Block[i]) || /*必殺技の右ななめ下の頂点がブロックに入ったとき*/
      ((xx2 - 90 > ((xB - Fcount + 90 * 7)) && xx2 - 90 < ((xB - Fcount + 90 * 7) + 92)) && (yy2 - 90 > yB && yy2 - 90 < (yB + 194)) && Fi3Block[i])    /*必殺技の左ななめ下の頂点がブロックに入ったとき*/
      )
      {
        player3.play();  //再生
        player3.rewind(); 
        Fi3Block[i] = false;//ブロックを非表示
        colflagB++;//スコアを増やす
      }
      if((xB - Fcount + 90 * 7) < 360 && Fi3Block[i]) /*ダメージライン内に入ったとき*/
      {
        Fi3Block[i] = false;//ブロックを非表示
      }
      if((xB - Fcount + 90 * 7) == 360 && Fi3Block[i])//ブロックがダメージライン内に入ったとき
      {
        colflagP++;//ダメージライン内入った数を数える
        playClr = 20;//アニメーション用
      }
    }
  }
  
   //fourth:白色のブロックを展開
  if(Fcount >= 60 * 9)//9秒以降
  {
    int xB = 1300, yB = -194;//ブロックのX座標を1300、Y座標を-194、速度を10に設定
    for(int i = 0; i < 5; i++)
    {
       yB += 194;//iの数だけブロックのy座標を194可算し並べていく
       if(Fi4Block[i])//FiBlock[i]がtrueならばブロックを表示する
       {
         image(img13, xB - Fcount + 90 * 8, yB);//ブロックを左に移動させる
       }
      if(((xx + 30 > ((xB - Fcount + 90 * 8)) && xx + 30 < ((xB - Fcount + 90 * 8) + 92)) && (yy > yB && yy < (yB + 194)) && Fi4Block[i]) || /*右端の頂点がブロックに入ったとき*/
      ((xx - 30 > ((xB - Fcount + 90 * 8)) && xx - 30 < ((xB - Fcount + 90 * 8) + 92)) && (yy > yB && yy < (yB + 194)) && Fi4Block[i]) || /*左端の頂点がブロックに入ったとき*/
      ((xx > ((xB - Fcount + 90 * 8)) && xx < ((xB - Fcount + 90 * 8) + 92)) && (yy - 30 > yB && yy - 30 < (yB + 194)) && Fi4Block[i]) || /*上端の頂点がブロックに入ったとき*/
      ((xx > ((xB - Fcount + 90 * 8)) && xx < ((xB - Fcount + 90 * 8) + 92)) && (yy + 30 > yB && yy + 30 < (yB + 194)) && Fi4Block[i]) || /*下端の頂点がブロックに入ったとき*/
      ((xx + 20 > ((xB - Fcount + 90 * 8)) && xx + 20 < ((xB - Fcount + 90 * 8) + 92)) && (yy + 20 > yB && yy + 20 < (yB + 194)) && Fi4Block[i]) || /*右ななめ上の頂点がブロックに入ったとき*/
      ((xx - 20 > ((xB - Fcount + 90 * 8)) && xx - 20 < ((xB - Fcount + 90 * 8) + 92)) && (yy + 20 > yB && yy + 20 < (yB + 194)) && Fi4Block[i]) || /*左ななめ上の頂点がブロックに入ったとき*/
      ((xx + 20 > ((xB - Fcount + 90 * 8)) && xx + 20 < ((xB - Fcount + 90 * 8) + 92)) && (yy - 20 > yB && yy - 20 < (yB + 194)) && Fi4Block[i]) || /*右ななめ下の頂点がブロックに入ったとき*/
      ((xx - 20 > ((xB - Fcount + 90 * 8)) && xx - 20 < ((xB - Fcount + 90 * 8) + 92)) && (yy - 20 > yB && yy - 20 < (yB + 194)) && Fi4Block[i]) )  /*左ななめ下の頂点がブロックに入ったとき*/
      {
        player3.play();  //再生
        player3.rewind(); 
        dx = -dx;//スター1を反射
        Fi4Block[i] = false;//FiBlock[i]をfalseにしてブロックの表示させなくする
        colflagB++;//スコアを増やす
      }
      if(
      ((xx2 + 150 > ((xB - Fcount + 90 * 8)) && xx2 + 150 < ((xB - Fcount + 90 * 8) + 92)) && (yy2 > yB && yy2 < (yB + 194)) && Fi4Block[i]) || /*必殺技の右端の頂点がブロックに入ったとき*/
      ((xx2 - 150 > ((xB - Fcount + 90 * 8)) && xx2 - 150 < ((xB - Fcount + 90 * 8) + 92)) && (yy2 > yB && yy2 < (yB + 194)) && Fi4Block[i]) || /*必殺技の左端の頂点がブロックに入ったとき*/
      ((xx2 > ((xB - Fcount + 90 * 8)) && xx2 < ((xB - Fcount + 90 * 8) + 92)) && (yy2 - 150 > yB && yy2 - 150 < (yB + 194)) && Fi4Block[i]) || /*必殺技の上端の頂点がブロックに入ったとき*/
      ((xx2 > ((xB - Fcount + 90 * 8)) && xx2 < ((xB - Fcount + 90 * 8) + 92)) && (yy2 + 150 > yB && yy2 + 150 < (yB + 194)) && Fi4Block[i]) || /*必殺技の下端の頂点がブロックに入ったとき*/
      ((xx2 + 90 > ((xB - Fcount + 90 * 8)) && xx2 + 90 < ((xB - Fcount + 90 * 8) + 92)) && (yy2 + 90 > yB && yy2 + 90 < (yB + 194)) && Fi4Block[i]) || /*必殺技の右ななめ上の頂点がブロックに入ったとき*/
      ((xx2 - 90 > ((xB - Fcount + 90 * 8)) && xx2 - 90 < ((xB - Fcount + 90 * 8) + 92)) && (yy2 + 90 > yB && yy2 + 90 < (yB + 194)) && Fi4Block[i]) || /*必殺技の左ななめ上の頂点がブロックに入ったとき*/
      ((xx2 + 90 > ((xB - Fcount + 90 * 8)) && xx2 + 90 < ((xB - Fcount + 90 * 8) + 92)) && (yy2 - 90 > yB && yy2 - 90 < (yB + 194)) && Fi4Block[i]) || /*必殺技の右ななめ下の頂点がブロックに入ったとき*/
      ((xx2 - 90 > ((xB - Fcount + 90 * 8)) && xx2 - 90 < ((xB - Fcount + 90 * 8) + 92)) && (yy2 - 90 > yB && yy2 - 90 < (yB + 194)) && Fi4Block[i])    /*必殺技の左ななめ下の頂点がブロックに入ったとき*/
      )
      {
        player3.play();  //再生
        player3.rewind(); 
        Fi4Block[i] = false;//ブロックを非表示
        colflagB++;//スコアを増やす
      }
      if((xB - Fcount + 90 * 8) < 360 && Fi4Block[i]) /*ダメージライン内に入ったとき*/
      {
        Fi4Block[i] = false;//ブロックを非表示
      }
      if((xB - Fcount + 90 * 8) == 360 && Fi4Block[i])//ブロックがダメージライン内に入ったとき
      {
        colflagP++;//ダメージライン内入った数を数える
        playClr = 20;//アニメーション用
      }
    }
  }
  
   //Fifth:青色のブロックを展開
  if(Fcount >= 60 * 10)//10秒以降
  {
    int xB = 1300, yB = -194;//ブロックのX座標を1300、Y座標を-194、速度を10に設定
    for(int i = 0; i < 5; i++)
    {
       yB += 194;//iの数だけブロックのy座標を194可算し並べていく
       if(Fi5Block[i])//FiBlock[i]がtrueならばブロックを表示する
       {
         image(img14, xB - Fcount + 90 * 9, yB);//ブロックを左に移動させる
       }
      if(((xx + 30 > ((xB - Fcount + 90 * 9)) && xx + 30 < ((xB - Fcount + 90 * 9) + 92)) && (yy > yB && yy < (yB + 194)) && Fi5Block[i]) || /*右端の頂点がブロックに入ったとき*/
      ((xx - 30 > ((xB - Fcount + 90 * 9)) && xx - 30 < ((xB - Fcount + 90 * 9) + 92)) && (yy > yB && yy < (yB + 194)) && Fi5Block[i]) || /*左端の頂点がブロックに入ったとき*/
      ((xx > ((xB - Fcount + 90 * 9)) && xx < ((xB - Fcount + 90 * 9) + 92)) && (yy - 30 > yB && yy - 30 < (yB + 194)) && Fi5Block[i]) || /*上端の頂点がブロックに入ったとき*/
      ((xx > ((xB - Fcount + 90 * 9)) && xx < ((xB - Fcount + 90 * 9) + 92)) && (yy + 30 > yB && yy + 30 < (yB + 194)) && Fi5Block[i]) || /*下端の頂点がブロックに入ったとき*/
      ((xx + 20 > ((xB - Fcount + 90 * 9)) && xx + 20 < ((xB - Fcount + 90 * 9) + 92)) && (yy + 20 > yB && yy + 20 < (yB + 194)) && Fi5Block[i]) || /*右ななめ上の頂点がブロックに入ったとき*/
      ((xx - 20 > ((xB - Fcount + 90 * 9)) && xx - 20 < ((xB - Fcount + 90 * 9) + 92)) && (yy + 20 > yB && yy + 20 < (yB + 194)) && Fi5Block[i]) || /*左ななめ上の頂点がブロックに入ったとき*/
      ((xx + 20 > ((xB - Fcount + 90 * 9)) && xx + 20 < ((xB - Fcount + 90 * 9) + 92)) && (yy - 20 > yB && yy - 20 < (yB + 194)) && Fi5Block[i]) || /*右ななめ下の頂点がブロックに入ったとき*/
      ((xx - 20 > ((xB - Fcount + 90 * 9)) && xx - 20 < ((xB - Fcount + 90 * 9) + 92)) && (yy - 20 > yB && yy - 20 < (yB + 194)) && Fi5Block[i]))   /*左ななめ下の頂点がブロックに入ったとき*/
      {
        player3.play();  //再生
        player3.rewind(); 
        dx = -dx;//スター1を反射
        Fi5Block[i] = false;//FiBlock[i]をfalseにしてブロックの表示させなくする
        colflagB++;//スコアを増やす
      }
      if(
      ((xx2 + 150 > ((xB - Fcount + 90 * 9)) && xx2 + 150 < ((xB - Fcount + 90 * 9) + 92)) && (yy2 > yB && yy2 < (yB + 194)) && Fi5Block[i]) || /*必殺技の右端の頂点がブロックに入ったとき*/
      ((xx2 - 150 > ((xB - Fcount + 90 * 9)) && xx2 - 150 < ((xB - Fcount + 90 * 9) + 92)) && (yy2 > yB && yy2 < (yB + 194)) && Fi5Block[i]) || /*必殺技の左端の頂点がブロックに入ったとき*/
      ((xx2 > ((xB - Fcount + 90 * 9)) && xx2 < ((xB - Fcount + 90 * 9) + 92)) && (yy2 - 150 > yB && yy2 - 150 < (yB + 194)) && Fi5Block[i]) || /*必殺技の上端の頂点がブロックに入ったとき*/
      ((xx2 > ((xB - Fcount + 90 * 9)) && xx2 < ((xB - Fcount + 90 * 9) + 92)) && (yy2 + 150 > yB && yy2 + 150 < (yB + 194)) && Fi5Block[i]) || /*必殺技の下端の頂点がブロックに入ったとき*/
      ((xx2 + 90 > ((xB - Fcount + 90 * 9)) && xx2 + 90 < ((xB - Fcount + 90 * 9) + 92)) && (yy2 + 90 > yB && yy2 + 90 < (yB + 194)) && Fi5Block[i]) || /*必殺技の右ななめ上の頂点がブロックに入ったとき*/
      ((xx2 - 90 > ((xB - Fcount + 90 * 9)) && xx2 - 90 < ((xB - Fcount + 90 * 9) + 92)) && (yy2 + 90 > yB && yy2 + 90 < (yB + 194)) && Fi5Block[i]) || /*必殺技の左ななめ上の頂点がブロックに入ったとき*/
      ((xx2 + 90 > ((xB - Fcount + 90 * 9)) && xx2 + 90 < ((xB - Fcount + 90 * 9) + 92)) && (yy2 - 90 > yB && yy2 - 90 < (yB + 194)) && Fi5Block[i]) || /*必殺技の右ななめ下の頂点がブロックに入ったとき*/
      ((xx2 - 90 > ((xB - Fcount + 90 * 9)) && xx2 - 90 < ((xB - Fcount + 90 * 9) + 92)) && (yy2 - 90 > yB && yy2 - 90 < (yB + 194)) && Fi5Block[i])    /*必殺技の左ななめ下の頂点がブロックに入ったとき*/
      )
      {
        player3.play();  //再生
        player3.rewind(); 
        Fi5Block[i] = false;//ブロックを非表示
        colflagB++;//スコアを増やす
      }
      if((xB - Fcount + 90 * 9) < 360 && Fi5Block[i]) /*ダメージライン内に入ったとき*/
      {
        Fi5Block[i] = false;//ブロックを非表示
      }
      if((xB - Fcount + 90 * 9) == 360 && Fi5Block[i])//ブロックがダメージライン内に入ったとき
      {
        colflagP++;//ダメージライン内入った数を数える
        playClr = 20;//アニメーション用
      }
    }
  }
  
  //23秒経過するとFcountの値が0にリセットされ、ブロックの非表示を解除する
    if(Fcount >= 60 * 30)
    {
      Fcount = 0;
      for(int i = 0; i < 5; i++)
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