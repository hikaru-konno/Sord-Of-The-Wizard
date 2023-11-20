//ブロックについてのタブ

//ブロックの表示or非表示を判別するためのboolean
boolean[] iBlock = new boolean[5];
boolean[] i2Block = new boolean[5];
boolean[] i3Block = new boolean[5];
boolean[] i4Block = new boolean[5];
boolean[] i5Block = new boolean[5];

int colflagP = 0;//ダメージライン内にブロックが入った回数
int colflagB = 0;//ブロックにスターが当たった回数

int count = 0;//ブロックのカウント

//createBlock():ブロックの表示or非表示と移動中の処理を行う関数
void createBlock()
{
  count++;
  //First:緑色のブロックを展開
  if(count >= 60 * 1)//1秒以降
  {
    int xB = 1300, yB = -194;//ブロックのX座標を1300、Y座標を-194に設定
    for(int i = 0; i < 5; i++)
    {
       yB += 194;//iの数だけブロックのy座標を194可算し並べていく
       if(iBlock[i])//iBlock[i]がtrueならばブロックを表示する
       {
         image(img10, xB - count, yB);//ブロックを左に移動させる
       }
      if(((xx + 30 > ((xB - count)) && xx + 30 < ((xB - count) + 92)) && (yy > yB && yy < (yB + 194)) && iBlock[i]) || /*右端の頂点がブロックに入ったとき*/
      ((xx - 30 > ((xB - count)) && xx - 30 < ((xB - count) + 92)) && (yy > yB && yy < (yB + 194)) && iBlock[i]) || /*左端の頂点がブロックに入ったとき*/
      ((xx > ((xB - count)) && xx < ((xB - count) + 92)) && (yy - 30 > yB && yy - 30 < (yB + 194)) && iBlock[i]) || /*上端の頂点がブロックに入ったとき*/
      ((xx > ((xB - count)) && xx < ((xB - count) + 92)) && (yy + 30 > yB && yy + 30 < (yB + 194)) && iBlock[i]) || /*下端の頂点がブロックに入ったとき*/
      ((xx + 20 > ((xB - count)) && xx + 20 < ((xB - count) + 92)) && (yy + 20 > yB && yy + 20 < (yB + 194)) && iBlock[i]) || /*右ななめ上の頂点がブロックに入ったとき*/
      ((xx - 20 > ((xB - count)) && xx - 20 < ((xB - count) + 92)) && (yy + 20 > yB && yy + 20 < (yB + 194)) && iBlock[i]) || /*左ななめ上の頂点がブロックに入ったとき*/
      ((xx + 20 > ((xB - count)) && xx + 20 < ((xB - count) + 92)) && (yy - 20 > yB && yy - 20 < (yB + 194)) && iBlock[i]) || /*右ななめ下の頂点がブロックに入ったとき*/
      ((xx - 20 > ((xB - count)) && xx - 20 < ((xB - count) + 92)) && (yy - 20 > yB && yy - 20 < (yB + 194)) && iBlock[i]))    /*左ななめ下の頂点がブロックに入ったとき*/
      {
        player3.play();  //再生
        player3.rewind(); 
        refEffect--;//スターが魔法書で反射したら1、ブロックで反射したら0;
        dx = -dx;//スター1を反射
        iBlock[i] = false;//iBlock[i]をfalseにしてブロックの表示させなくする
        colflagB++;//スコアを増やす
      }
      if(
      ((xx2 + 150 > ((xB - count)) && xx2 + 150 < ((xB - count) + 92)) && (yy2 > yB && yy2 < (yB + 194)) && iBlock[i]) || /*必殺技の右端の頂点がブロックに入ったとき*/
      ((xx2 - 150 > ((xB - count)) && xx2 - 150 < ((xB - count) + 92)) && (yy2 > yB && yy2 < (yB + 194)) && iBlock[i]) || /*必殺技の左端の頂点がブロックに入ったとき*/
      ((xx2 > ((xB - count)) && xx2 < ((xB - count) + 92)) && (yy2 - 150 > yB && yy2 - 150 < (yB + 194)) && iBlock[i]) || /*必殺技の上端の頂点がブロックに入ったとき*/
      ((xx2 > ((xB - count)) && xx2 < ((xB - count) + 92)) && (yy2 + 150 > yB && yy2 + 150 < (yB + 194)) && iBlock[i]) || /*必殺技の下端の頂点がブロックに入ったとき*/
      ((xx2 + 90 > ((xB - count)) && xx2 + 90 < ((xB - count) + 92)) && (yy2 + 90 > yB && yy2 + 90 < (yB + 194)) && iBlock[i]) || /*必殺技の右ななめ上の頂点がブロックに入ったとき*/
      ((xx2 - 90 > ((xB - count)) && xx2 - 90 < ((xB - count) + 92)) && (yy2 + 90 > yB && yy2 + 90 < (yB + 194)) && iBlock[i]) || /*必殺技の左ななめ上の頂点がブロックに入ったとき*/
      ((xx2 + 90 > ((xB - count)) && xx2 + 90 < ((xB - count) + 92)) && (yy2 - 90 > yB && yy2 - 90 < (yB + 194)) && iBlock[i]) || /*必殺技の右ななめ下の頂点がブロックに入ったとき*/
      ((xx2 - 90 > ((xB - count)) && xx2 - 90 < ((xB - count) + 92)) && (yy2 - 90 > yB && yy2 - 90 < (yB + 194)) && iBlock[i])    /*必殺技の左ななめ下の頂点がブロックに入ったとき*/
      )
      {
        player3.play();  //再生
        player3.rewind(); 
        iBlock[i] = false;//ブロックを非表示
        colflagB++;//スコアを増やす
      }
      if((xB - count) < 360 && iBlock[i]) /*ダメージライン内に入ったとき*/
      {
        iBlock[i] = false;//ブロックを非表示
      }
      if((xB - count) == 360 && iBlock[i])//ブロックがダメージライン内に入ったとき
      {
        player18.play();
        player18.rewind();
        colflagP++;//ダメージライン内入った数を数える
        playClr = 20;//アニメーション用
      }
    }
  }
  
  //Second:赤色のブロックを展開
  if(count >= 60 * 2)//2秒以降
  {
    int xB = 1300, yB = -194;//ブロックのX座標を1300、Y座標を-194、速度を10に設定
    for(int i = 0; i < 5; i++)
    {
       yB += 194;//iの数だけブロックのy座標を194可算し並べていく
       if(i2Block[i])//iBlock[i]がtrueならばブロックを表示する
       {
         image(img11, xB - count + 90, yB);//ブロックを左に移動させる
       }
      if(((xx + 30 > ((xB - count + 90)) && xx + 30 < ((xB - count + 90) + 92)) && (yy > yB && yy < (yB + 194)) && i2Block[i]) || /*右端の頂点がブロックに入ったとき*/
      ((xx - 30 > ((xB - count + 90)) && xx - 30 < ((xB - count + 90) + 92)) && (yy > yB && yy < (yB + 194)) && i2Block[i]) || /*左端の頂点がブロックに入ったとき*/
      ((xx > ((xB - count + 90)) && xx < ((xB - count + 90) + 92)) && (yy - 30 > yB && yy - 30 < (yB + 194)) && i2Block[i]) || /*上端の頂点がブロックに入ったとき*/
      ((xx > ((xB - count + 90)) && xx < ((xB - count + 90) + 92)) && (yy + 30 > yB && yy + 30 < (yB + 194)) && i2Block[i]) || /*下端の頂点がブロックに入ったとき*/
      ((xx + 20 > ((xB - count + 90)) && xx + 20 < ((xB - count + 90) + 92)) && (yy + 20 > yB && yy + 20 < (yB + 194)) && i2Block[i]) || /*右ななめ上の頂点がブロックに入ったとき*/
      ((xx - 20 > ((xB - count + 90)) && xx - 20 < ((xB - count + 90) + 92)) && (yy + 20 > yB && yy + 20 < (yB + 194)) && i2Block[i]) || /*左ななめ上の頂点がブロックに入ったとき*/
      ((xx + 20 > ((xB - count + 90)) && xx + 20 < ((xB - count + 90) + 92)) && (yy - 20 > yB && yy - 20 < (yB + 194)) && i2Block[i]) || /*右ななめ下の頂点がブロックに入ったとき*/
      ((xx - 20 > ((xB - count + 90)) && xx - 20 < ((xB - count + 90) + 92)) && (yy - 20 > yB && yy - 20 < (yB + 194)) && i2Block[i]) )   /*左ななめ下の頂点がブロックに入ったとき*/
      {
        player3.play();  //再生
        player3.rewind(); 
        refEffect--;//スターが魔法書で反射したら1、ブロックで反射したら0;
        dx = -dx;//スター1を反射
        i2Block[i] = false;//iBlock[i]をfalseにしてブロックの表示させなくする
        colflagB++;//スコアを増やす
      }
      if(
      ((xx2 + 150 > ((xB - count + 90)) && xx2 + 150 < ((xB - count + 90) + 92)) && (yy2 > yB && yy2 < (yB + 194)) && i2Block[i]) || /*必殺技の右端の頂点がブロックに入ったとき*/
      ((xx2 - 150 > ((xB - count + 90)) && xx2 - 150 < ((xB - count + 90) + 92)) && (yy2 > yB && yy2 < (yB + 194)) && i2Block[i]) || /*必殺技の左端の頂点がブロックに入ったとき*/
      ((xx2 > ((xB - count + 90)) && xx2 < ((xB - count + 90) + 92)) && (yy2 - 150 > yB && yy2 - 150 < (yB + 194)) && i2Block[i]) || /*必殺技の上端の頂点がブロックに入ったとき*/
      ((xx2 > ((xB - count + 90)) && xx2 < ((xB - count + 90) + 92)) && (yy2 + 150 > yB && yy2 + 150 < (yB + 194)) && i2Block[i]) || /*必殺技の下端の頂点がブロックに入ったとき*/
      ((xx2 + 90 > ((xB - count + 90)) && xx2 + 90 < ((xB - count + 90) + 92)) && (yy2 + 90 > yB && yy2 + 90 < (yB + 194)) && i2Block[i]) || /*必殺技の右ななめ上の頂点がブロックに入ったとき*/
      ((xx2 - 90 > ((xB - count + 90)) && xx2 - 90 < ((xB - count + 90) + 92)) && (yy2 + 90 > yB && yy2 + 90 < (yB + 194)) && i2Block[i]) || /*必殺技の左ななめ上の頂点がブロックに入ったとき*/
      ((xx2 + 90 > ((xB - count + 90)) && xx2 + 90 < ((xB - count + 90) + 92)) && (yy2 - 90 > yB && yy2 - 90 < (yB + 194)) && i2Block[i]) || /*必殺技の右ななめ下の頂点がブロックに入ったとき*/
      ((xx2 - 90 > ((xB - count + 90)) && xx2 - 90 < ((xB - count + 90) + 92)) && (yy2 - 90 > yB && yy2 - 90 < (yB + 194)) && i2Block[i])    /*必殺技の左ななめ下の頂点がブロックに入ったとき*/
      )
      {
        player3.play();  //再生
        player3.rewind(); 
        i2Block[i] = false;//ブロックを非表示
        colflagB++;//スコアを増やす
      }
      if((xB - count + 90) < 360 && i2Block[i]) /*ダメージライン内に入ったとき*/
      {
        i2Block[i] = false;//ブロックを非表示
      }
      if((xB - count + 90) == 360 && i2Block[i])//ブロックがダメージライン内に入ったとき
      {
        player18.play();
        player18.rewind();
        colflagP++;//ダメージライン内入った数を数える
        playClr = 20;//アニメーション用
      }
    }
  }
  
   //Third:水色のブロックを展開
  if(count >= 60 * 3)//3秒以降
  {
    int xB = 1300, yB = -194;//ブロックのX座標を1300、Y座標を-194、速度を10に設定
    for(int i = 0; i < 5; i++)
    {
       yB += 194;//iの数だけブロックのy座標を194可算し並べていく
       if(i3Block[i])//iBlock[i]がtrueならばブロックを表示する
       {
         image(img12, xB - count + 90 * 2, yB);//ブロックを左に移動させる
       }
      if(((xx + 30 > ((xB - count + 90 * 2)) && xx + 30 < ((xB - count + 90 * 2) + 92)) && (yy > yB && yy < (yB + 194)) && i3Block[i]) || /*右端の頂点がブロックに入ったとき*/
      ((xx - 30 > ((xB - count + 90 * 2)) && xx - 30 < ((xB - count + 90 * 2) + 92)) && (yy > yB && yy < (yB + 194)) && i3Block[i]) || /*左端の頂点がブロックに入ったとき*/
      ((xx > ((xB - count + 90 * 2)) && xx < ((xB - count + 90 * 2) + 92)) && (yy - 30 > yB && yy - 30 < (yB + 194)) && i3Block[i]) || /*上端の頂点がブロックに入ったとき*/
      ((xx > ((xB - count + 90 * 2)) && xx < ((xB - count + 90 * 2) + 92)) && (yy + 30 > yB && yy + 30 < (yB + 194)) && i3Block[i]) || /*下端の頂点がブロックに入ったとき*/
      ((xx + 20 > ((xB - count + 90 * 2)) && xx + 20 < ((xB - count + 90 * 2) + 92)) && (yy + 20 > yB && yy + 20 < (yB + 194)) && i3Block[i]) || /*右ななめ上の頂点がブロックに入ったとき*/
      ((xx - 20 > ((xB - count + 90 * 2)) && xx - 20 < ((xB - count + 90 * 2) + 92)) && (yy + 20 > yB && yy + 20 < (yB + 194)) && i3Block[i]) || /*左ななめ上の頂点がブロックに入ったとき*/
      ((xx + 20 > ((xB - count + 90 * 2)) && xx + 20 < ((xB - count + 90 * 2) + 92)) && (yy - 20 > yB && yy - 20 < (yB + 194)) && i3Block[i]) || /*右ななめ下の頂点がブロックに入ったとき*/
      ((xx - 20 > ((xB - count + 90 * 2)) && xx - 20 < ((xB - count + 90 * 2) + 92)) && (yy - 20 > yB && yy - 20 < (yB + 194)) && i3Block[i]))    /*左ななめ下の頂点がブロックに入ったとき*/
      {
        player3.play();  //再生
        player3.rewind(); 
        refEffect--;//スターが魔法書で反射したら1、ブロックで反射したら0;
        dx = -dx;//スター1を反射
        i3Block[i] = false;//iBlock[i]をfalseにしてブロックの表示させなくする
        colflagB++;//スコアを増やす
      }
      if(
      ((xx2 + 150 > ((xB - count + 90 * 2)) && xx2 + 150 < ((xB - count + 90 * 2) + 92)) && (yy2 > yB && yy2 < (yB + 194)) && i3Block[i]) || /*必殺技の右端の頂点がブロックに入ったとき*/
      ((xx2 - 150 > ((xB - count + 90 * 2)) && xx2 - 150 < ((xB - count + 90 * 2) + 92)) && (yy2 > yB && yy2 < (yB + 194)) && i3Block[i]) || /*必殺技の左端の頂点がブロックに入ったとき*/
      ((xx2 > ((xB - count + 90 * 2)) && xx2 < ((xB - count + 90 * 2) + 92)) && (yy2 - 150 > yB && yy2 - 150 < (yB + 194)) && i3Block[i]) || /*必殺技の上端の頂点がブロックに入ったとき*/
      ((xx2 > ((xB - count + 90 * 2)) && xx2 < ((xB - count + 90 * 2) + 92)) && (yy2 + 150 > yB && yy2 + 150 < (yB + 194)) && i3Block[i]) || /*必殺技の下端の頂点がブロックに入ったとき*/
      ((xx2 + 90 > ((xB - count + 90 * 2)) && xx2 + 90 < ((xB - count + 90 * 2) + 92)) && (yy2 + 90 > yB && yy2 + 90 < (yB + 194)) && i3Block[i]) || /*必殺技の右ななめ上の頂点がブロックに入ったとき*/
      ((xx2 - 90 > ((xB - count + 90 * 2)) && xx2 - 90 < ((xB - count + 90 * 2) + 92)) && (yy2 + 90 > yB && yy2 + 90 < (yB + 194)) && i3Block[i]) || /*必殺技の左ななめ上の頂点がブロックに入ったとき*/
      ((xx2 + 90 > ((xB - count + 90 * 2)) && xx2 + 90 < ((xB - count + 90 * 2) + 92)) && (yy2 - 90 > yB && yy2 - 90 < (yB + 194)) && i3Block[i]) || /*必殺技の右ななめ下の頂点がブロックに入ったとき*/
      ((xx2 - 90 > ((xB - count + 90 * 2)) && xx2 - 90 < ((xB - count + 90 * 2) + 92)) && (yy2 - 90 > yB && yy2 - 90 < (yB + 194)) && i3Block[i])    /*必殺技の左ななめ下の頂点がブロックに入ったとき*/
      )
      {
        player3.play();  //再生
        player3.rewind(); 
        i3Block[i] = false;//ブロックを非表示
        colflagB++;//スコアを増やす
      }
      if((xB - count + 90 * 2) < 360 && i3Block[i]) /*ダメージライン内に入ったとき*/
      {
        i3Block[i] = false;//ブロックを非表示
      }
      if((xB - count + 90 * 2) == 360 && i3Block[i])//ブロックがダメージライン内に入ったとき
      {
        player18.play();
        player18.rewind();
        colflagP++;//ダメージライン内入った数を数える
        playClr = 20;//アニメーション用
      }
    }
  }
  
   //fourth:白色のブロックを展開
  if(count >= 60 * 4)//4秒以降
  {
    int xB = 1300, yB = -194;//ブロックのX座標を1300、Y座標を-194、速度を10に設定
    for(int i = 0; i < 5; i++)
    {
       yB += 194;//iの数だけブロックのy座標を194可算し並べていく
       if(i4Block[i])//iBlock[i]がtrueならばブロックを表示する
       {
         image(img13, xB - count + 90 * 3, yB);//ブロックを左に移動させる
       }
      if(((xx + 30 > ((xB - count + 90 * 3)) && xx + 30 < ((xB - count + 90 * 3) + 92)) && (yy > yB && yy < (yB + 194)) && i4Block[i]) || /*右端の頂点がブロックに入ったとき*/
      ((xx - 30 > ((xB - count + 90 * 3)) && xx - 30 < ((xB - count + 90 * 3) + 92)) && (yy > yB && yy < (yB + 194)) && i4Block[i]) || /*左端の頂点がブロックに入ったとき*/
      ((xx > ((xB - count + 90 * 3)) && xx < ((xB - count + 90 * 3) + 92)) && (yy - 30 > yB && yy - 30 < (yB + 194)) && i4Block[i]) || /*上端の頂点がブロックに入ったとき*/
      ((xx > ((xB - count + 90 * 3)) && xx < ((xB - count + 90 * 3) + 92)) && (yy + 30 > yB && yy + 30 < (yB + 194)) && i4Block[i]) || /*下端の頂点がブロックに入ったとき*/
      ((xx + 20 > ((xB - count + 90 * 3)) && xx + 20 < ((xB - count + 90 * 3) + 92)) && (yy + 20 > yB && yy + 20 < (yB + 194)) && i4Block[i]) || /*右ななめ上の頂点がブロックに入ったとき*/
      ((xx - 20 > ((xB - count + 90 * 3)) && xx - 20 < ((xB - count + 90 * 3) + 92)) && (yy + 20 > yB && yy + 20 < (yB + 194)) && i4Block[i]) || /*左ななめ上の頂点がブロックに入ったとき*/
      ((xx + 20 > ((xB - count + 90 * 3)) && xx + 20 < ((xB - count + 90 * 3) + 92)) && (yy - 20 > yB && yy - 20 < (yB + 194)) && i4Block[i]) || /*右ななめ下の頂点がブロックに入ったとき*/
      ((xx - 20 > ((xB - count + 90 * 3)) && xx - 20 < ((xB - count + 90 * 3) + 92)) && (yy - 20 > yB && yy - 20 < (yB + 194)) && i4Block[i]) )  /*左ななめ下の頂点がブロックに入ったとき*/
      {
        player3.play();  //再生
        player3.rewind(); 
        refEffect--;//スターが魔法書で反射したら1、ブロックで反射したら0;
        dx = -dx;//スター1を反射
        i4Block[i] = false;//iBlock[i]をfalseにしてブロックの表示させなくする
        colflagB++;//スコアを増やす
      }
      if(
      ((xx2 + 150 > ((xB - count + 90 * 3)) && xx2 + 150 < ((xB - count + 90 * 3) + 92)) && (yy2 > yB && yy2 < (yB + 194)) && i4Block[i]) || /*必殺技の右端の頂点がブロックに入ったとき*/
      ((xx2 - 150 > ((xB - count + 90 * 3)) && xx2 - 150 < ((xB - count + 90 * 3) + 92)) && (yy2 > yB && yy2 < (yB + 194)) && i4Block[i]) || /*必殺技の左端の頂点がブロックに入ったとき*/
      ((xx2 > ((xB - count + 90 * 3)) && xx2 < ((xB - count + 90 * 3) + 92)) && (yy2 - 150 > yB && yy2 - 150 < (yB + 194)) && i4Block[i]) || /*必殺技の上端の頂点がブロックに入ったとき*/
      ((xx2 > ((xB - count + 90 * 3)) && xx2 < ((xB - count + 90 * 3) + 92)) && (yy2 + 150 > yB && yy2 + 150 < (yB + 194)) && i4Block[i]) || /*必殺技の下端の頂点がブロックに入ったとき*/
      ((xx2 + 90 > ((xB - count + 90 * 3)) && xx2 + 90 < ((xB - count + 90 * 3) + 92)) && (yy2 + 90 > yB && yy2 + 90 < (yB + 194)) && i4Block[i]) || /*必殺技の右ななめ上の頂点がブロックに入ったとき*/
      ((xx2 - 90 > ((xB - count + 90 * 3)) && xx2 - 90 < ((xB - count + 90 * 3) + 92)) && (yy2 + 90 > yB && yy2 + 90 < (yB + 194)) && i4Block[i]) || /*必殺技の左ななめ上の頂点がブロックに入ったとき*/
      ((xx2 + 90 > ((xB - count + 90 * 3)) && xx2 + 90 < ((xB - count + 90 * 3) + 92)) && (yy2 - 90 > yB && yy2 - 90 < (yB + 194)) && i4Block[i]) || /*必殺技の右ななめ下の頂点がブロックに入ったとき*/
      ((xx2 - 90 > ((xB - count + 90 * 3)) && xx2 - 90 < ((xB - count + 90 * 3) + 92)) && (yy2 - 90 > yB && yy2 - 90 < (yB + 194)) && i4Block[i])    /*必殺技の左ななめ下の頂点がブロックに入ったとき*/
      )
      {
        player3.play();  //再生
        player3.rewind(); 
        i4Block[i] = false;//ブロックを非表示
        colflagB++;//スコアを増やす
      }
      if((xB - count + 90 * 3) < 360 && i4Block[i]) /*ダメージライン内に入ったとき*/
      {
        i4Block[i] = false;//ブロックを非表示
      }
      if((xB - count + 90 * 3) == 360 && i4Block[i])//ブロックがダメージライン内に入ったとき
      {
        player18.play();
        player18.rewind();
        colflagP++;//ダメージライン内入った数を数える
        playClr = 20;//アニメーション用
      }
    }
  }
  
   //Fifth:青色のブロックを展開
  if(count >= 60 * 5)//5秒以降
  {
    int xB = 1300, yB = -194;//ブロックのX座標を1300、Y座標を-194、速度を10に設定
    for(int i = 0; i < 5; i++)
    {
       yB += 194;//iの数だけブロックのy座標を194可算し並べていく
       if(i5Block[i])//iBlock[i]がtrueならばブロックを表示する
       {
         image(img14, xB - count + 90 * 4, yB);//ブロックを左に移動させる
       }
      if(((xx + 30 > ((xB - count + 90 * 4)) && xx + 30 < ((xB - count + 90 * 4) + 92)) && (yy > yB && yy < (yB + 194)) && i5Block[i]) || /*右端の頂点がブロックに入ったとき*/
      ((xx - 30 > ((xB - count + 90 * 4)) && xx - 30 < ((xB - count + 90 * 4) + 92)) && (yy > yB && yy < (yB + 194)) && i5Block[i]) || /*左端の頂点がブロックに入ったとき*/
      ((xx > ((xB - count + 90 * 4)) && xx < ((xB - count + 90 * 4) + 92)) && (yy - 30 > yB && yy - 30 < (yB + 194)) && i5Block[i]) || /*上端の頂点がブロックに入ったとき*/
      ((xx > ((xB - count + 90 * 4)) && xx < ((xB - count + 90 * 4) + 92)) && (yy + 30 > yB && yy + 30 < (yB + 194)) && i5Block[i]) || /*下端の頂点がブロックに入ったとき*/
      ((xx + 20 > ((xB - count + 90 * 4)) && xx + 20 < ((xB - count + 90 * 4) + 92)) && (yy + 20 > yB && yy + 20 < (yB + 194)) && i5Block[i]) || /*右ななめ上の頂点がブロックに入ったとき*/
      ((xx - 20 > ((xB - count + 90 * 4)) && xx - 20 < ((xB - count + 90 * 4) + 92)) && (yy + 20 > yB && yy + 20 < (yB + 194)) && i5Block[i]) || /*左ななめ上の頂点がブロックに入ったとき*/
      ((xx + 20 > ((xB - count + 90 * 4)) && xx + 20 < ((xB - count + 90 * 4) + 92)) && (yy - 20 > yB && yy - 20 < (yB + 194)) && i5Block[i]) || /*右ななめ下の頂点がブロックに入ったとき*/
      ((xx - 20 > ((xB - count + 90 * 4)) && xx - 20 < ((xB - count + 90 * 4) + 92)) && (yy - 20 > yB && yy - 20 < (yB + 194)) && i5Block[i]))   /*左ななめ下の頂点がブロックに入ったとき*/
      {
        player3.play();  //再生
        player3.rewind(); 
        refEffect--;//スターが魔法書で反射したら1、ブロックで反射したら0;
        dx = -dx;//スター1を反射
        i5Block[i] = false;//iBlock[i]をfalseにしてブロックの表示させなくする
        colflagB++;//スコアを増やす
      }
      if(
      ((xx2 + 150 > ((xB - count + 90 * 4)) && xx2 + 150 < ((xB - count + 90 * 4) + 92)) && (yy2 > yB && yy2 < (yB + 194)) && i5Block[i]) || /*必殺技の右端の頂点がブロックに入ったとき*/
      ((xx2 - 150 > ((xB - count + 90 * 4)) && xx2 - 150 < ((xB - count + 90 * 4) + 92)) && (yy2 > yB && yy2 < (yB + 194)) && i5Block[i]) || /*必殺技の左端の頂点がブロックに入ったとき*/
      ((xx2 > ((xB - count + 90 * 4)) && xx2 < ((xB - count + 90 * 4) + 92)) && (yy2 - 150 > yB && yy2 - 150 < (yB + 194)) && i5Block[i]) || /*必殺技の上端の頂点がブロックに入ったとき*/
      ((xx2 > ((xB - count + 90 * 4)) && xx2 < ((xB - count + 90 * 4) + 92)) && (yy2 + 150 > yB && yy2 + 150 < (yB + 194)) && i5Block[i]) || /*必殺技の下端の頂点がブロックに入ったとき*/
      ((xx2 + 90 > ((xB - count + 90 * 4)) && xx2 + 90 < ((xB - count + 90 * 4) + 92)) && (yy2 + 90 > yB && yy2 + 90 < (yB + 194)) && i5Block[i]) || /*必殺技の右ななめ上の頂点がブロックに入ったとき*/
      ((xx2 - 90 > ((xB - count + 90 * 4)) && xx2 - 90 < ((xB - count + 90 * 4) + 92)) && (yy2 + 90 > yB && yy2 + 90 < (yB + 194)) && i5Block[i]) || /*必殺技の左ななめ上の頂点がブロックに入ったとき*/
      ((xx2 + 90 > ((xB - count + 90 * 4)) && xx2 + 90 < ((xB - count + 90 * 4) + 92)) && (yy2 - 90 > yB && yy2 - 90 < (yB + 194)) && i5Block[i]) || /*必殺技の右ななめ下の頂点がブロックに入ったとき*/
      ((xx2 - 90 > ((xB - count + 90 * 4)) && xx2 - 90 < ((xB - count + 90 * 4) + 92)) && (yy2 - 90 > yB && yy2 - 90 < (yB + 194)) && i5Block[i])    /*必殺技の左ななめ下の頂点がブロックに入ったとき*/
      )
      {
        player3.play();  //再生
        player3.rewind(); 
        i5Block[i] = false;//ブロックを非表示
        colflagB++;//スコアを増やす
      }
      if((xB - count + 90 * 4) < 360 && i5Block[i]) /*ダメージライン内に入ったとき*/
      {
        i5Block[i] = false;//ブロックを非表示
      }
      if((xB - count + 90 * 4) == 360 && i5Block[i])//ブロックがダメージライン内に入ったとき
      {
        player18.play();
        player18.rewind();
        colflagP++;//ダメージライン内入った数を数える
        playClr = 20;//アニメーション用
      }
    }
  }
  
  //23秒経過するとcountの値が0にリセットされ、ブロックの非表示を解除する
  if(boss < 9)
  {
    if(count >= 60 * 23)
    {
      count = 0;
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

    //ボス覚醒後は30秒経過するとcountの値が0にリセットされ、ブロックの非表示を解除する
  if(boss >= 9)
  {
    if(count >= 60 * 30)
    {
      count = 0;
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

  //ダメージをくらうと赤くなる
  if(playClr > 0)
  {
    tint(255, 0, 0, 200);
    image(img2, 80, temp);//単振動により滑らかな上下運動を行う
    noTint();
    playClr = playClr - 2;
  }
  if(playClr <= 0)
  {
    playClr = 0;
  }
}
