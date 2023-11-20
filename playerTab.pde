//プレイヤーに関するタブ


int temp;//playerの座標を一時保存するための整数(スター1で使う)
int temp2;//playerの座標を一時保存するための整数(スター2で使う)
float playHP = 360;
float rate = 0;//必殺技ゲージ
int clearhst = 255;//プレイヤー変身モーション用
int playClr = 0;//ダメージくらったとき用

//必殺技用アニメーション
int eft21, eft22, eft23, eft24, eft25, eft26, eft27, eft28, eft29, eft30, eft31, eft32;

//playerInfo():左下のプレイヤーのパラメータ表示用UI作成

//プレイヤーの情報表示を描写
void playerInfo()
{
  fill(255, 70, 0);
  textSize(40);
  text("魔法使い", 145, 860);
  
  //必殺ゲージと体力ゲージ
  noStroke();
  fill(255, 82, 0);
  ellipse(420, 878, 160, 160);
  fill(255);
  ellipse(420, 878, 140, 140);
  fill(255, 82, 0);
  ellipse(357, 892, 40, 40);
  ellipse(149, 892, 40, 40);
  ellipse(372, 929, 26, 26);
  ellipse(149, 929, 26, 26);
  quad(149, 872, 357, 872, 357, 912, 149, 912);
  quad(149, 916, 372, 916, 372, 942, 149, 942);
  
  //必殺技ゲージ
  fill(255, 0, 0);
  quad(149, 920, 365, 920, 365, 938, 149, 938);
  
  //体力ゲージ
  fill(0);
  quad(149, 880, 357, 880, 357, 905, 149, 905); 
  image(img30, 0, 0);
}

//プレイヤーの体力ゲージに関する関数
void playerHP()
{
  //プレイヤーの体力に応じてゲージを減らす
  float  progress = map(playHP, 0, 360, 149, 357);
  
  //プレイヤーの体力のゲージを表示
  noStroke();
  fill(180, 255, 255);
  quad(149, 880, progress, 880, progress, 905, 149, 905);
  
  //ブロックがダメージライン内に入るとゲージが減る
  playHP = 360 - colflagP * 20;
  
  //プレイやーの体力はマイナスにはならない
  if(playHP <= 0)
  {
    playHP = 0;
  }
  
}

//必殺ゲージに関する関数
void hissatu()
{
  //必殺技ゲージの増減
  float  progress2 = map(rate, 100, 0, 365, 149);
  
  //必殺技のゲージを表示
  noStroke();
  fill(0);
  quad(progress2, 920, 365, 920, 365, 938, progress2, 938);
  
  //必殺技ゲージの増減
  rate = refNum * 20;
  
  //必殺技ゲージがmaxになると
  if(rate >= 100)
  {
    player15.play();  //再生

    rate = 100;//必殺技ゲージは100が上限
    
    //必殺技ゲージの色を黄色に
    fill(255, 255, 0);
    quad(149, 920, 365, 920, 365, 938, 149, 938);
    
    //背後のエフェクトを作成させるもの
        //両端のエフェクトのパラメータ
        eft21 = eftNum2(eft21, 3, temp, temp + 205);
        eft22 = eftNum2(eft22, 5, temp, temp + 205);
        eft23 = eftNum2(eft23, 7, temp, temp + 205);
        
        //端から2番目のエフェクトのパラメータ
        eft24 = eftNum2(eft24, 3, temp, temp + 205);
        eft25 = eftNum2(eft25, 5, temp, temp + 205);
        eft26 = eftNum2(eft26, 7, temp, temp + 205);
        eft27 = eftNum2(eft27, 2, temp, temp + 205);
        
        //端から3番目のエフェクトのパラメータ
        eft28= eftNum2(eft28, 3, temp, temp + 205);
        eft29= eftNum2(eft29, 5, temp, temp + 205);
        eft30 = eftNum2(eft30, 7, temp, temp + 205);
        eft31 = eftNum2(eft31, 2, temp, temp + 205);
        eft32 = eftNum2(eft32, 4, temp, temp + 205);
        
        fill(255, random(0, 255), 0);
        //右端のパラメータ
        circle(70, eft21, 40);
        circle(70, eft22, 40);
        circle(70, eft23, 40);

        //右から2番目のパラメータ
        circle(110, eft24, 40);
        circle(110, eft25, 40);
        circle(110, eft26, 40);
        circle(110, eft27, 40);

        //中央のパラメータ
        circle(150, eft28, 40);
        circle(150, eft29, 40);
        circle(150, eft30, 40);
        circle(150, eft31, 40);
        circle(150, eft32, 40);

        //左から2番目のパラメータ
        circle(190, eft24, 40);
        circle(190, eft25, 40);
        circle(190, eft26, 40);
        circle(190, eft27, 40);

        //左端のパラメータ
        circle(230, eft21, 40);
        circle(230, eft22, 40);
        circle(230, eft23, 40);

      //プレイヤーが変身するするのを演出
      image(img33, 80, temp);
      tint(0, clearhst);
      if(clearhst >= 0)
      {
          clearhst = clearhst - 15;
      }
      if(clearBtl < 0)
      {
          clearBtl = 0;
      }
      image(img34, 80, temp);
      noTint();
  }
  
  //必殺技ゲージが最大じゃないと効果音とプレイヤーの透明度リセット
  if(rate < 100)
  {
    clearhst = 255;
    player15.rewind();
    player15.pause();  
  }
}

//プレイヤーの画像を表示する関数
void playerMade()
{
   int y = constrain(mouseY, 0, height - 150);//プレイヤーの移動範囲を制限
   if(rate < 100)
   {
      image(img2, 80, y);//playerの画像表示
   }
   image(img8, 250, y);//魔法書の画像表示
   temp = y;//playerの座標を一時保存(スター1で使う)
   temp2 = y;//playerの座標を一時保存(スター2で使う)
}
