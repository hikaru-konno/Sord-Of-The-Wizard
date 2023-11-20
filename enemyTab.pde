//敵に関するタブ

float enemHP = 360;//敵の体力

//単振動用の変数
float deg = 0.0;
float rad = 0.0;

int countAnim = 0;//アニメーションのカウンター
int enemClr = 0;
int n;

void enemyHP()
{
  //敵の体力に応じてゲージを減らす
  float  progress = map(enemHP, 360, 0, 1770, 1210);
  
  //敵の体力のゲージを表示
  noStroke();
  fill(185, 146, 255);
  rect(1200, 50, 550, 50);
  triangle(1700, 50, 1750, 40, 1750, 50);
  triangle(1750, 100, 1750, 40, 1900, 100);
  fill(0);
  rect(1210, 60, 560, 30);
  fill(83, 60, 148);
  quad(1210, 60, progress, 60, progress, 90, 1210, 90);
  textSize(50);
  fill(255, 129 ,255);
  text("アザトース", 1650, 145);
  
  //アザトースに弾があたると体力が減る
  enemHP = 360 - colflag * 20;

  //敵の体力はマイナスにはならない
  if(enemHP <= 0)
  {
    enemHP = 0;
  }
}

void enemyParam()
{
  if(boss < 9)
  {
    //敵の画像を表示
    image(img9, 1600, -sin(rad) * 50 + 320);//単振動により滑らかな上下運動を行う
    deg += 2;
    rad = radians(deg);
  }
  if(boss >= 9)
  {
    //敵の画像を表示
    image(img35, 1600, -sin(rad) * 50 + 320);//単振動により滑らかな上下運動を行う
    deg += 2;
    rad = radians(deg);
  }
}

//ブロック出現時にでてくるエフェクトに関する関数
void enemEffect()
{
  countAnim++;
  if(boss >= 9)
  {
  //ブロック出現時の(60x0.5)フレーム前にエフェクトを出現させる
  if(count <= 60 * 1 && count >= 60 * 0.6 || count <= 60 * 2 && count >= 60 * 1.6 || 
     count <= 60 * 3 && count >= 60 * 2.6 || count <= 60 * 4 && count >= 60 * 3.6 || 
     count <= 60 * 5 && count >= 60 * 4.6 || count <= 60 * 6 && count >= 60 * 5.6 || 
     count <= 60 * 7 && count >= 60 * 6.6 || count <= 60 * 8 && count >= 60 * 7.6 || 
     count <= 60 * 9 && count >= 60 * 8.6 || count <= 60 * 10 && count >= 60 * 9.6)
  {
    //効果音の再生
    player6.rewind(); 
    player6.play();

    //2フレームごとにコマを変える
    if (countAnim % 2 == 0) 
    {
      n++;
    }
    //1コマ目に戻す
    if(count == 60 * 1 || count == 60 * 2 || count == 60 * 3 || count == 60 * 4 || count == 60 * 5 ||
       count == 60 * 6 || count == 60 * 7 || count == 60 * 8 || count == 60 * 9 || count == 60 * 10 )
    {
      countAnim = 0;
      n = 0;
    }
    
    //攻撃エフェクトの表示
    img17 = img16.get( 300* n, 0, 300, 970 );
    image( img17, 1250 + n * 7, 0);
    img19 = img18.get( 300* n, 0, 300, 970 );
    image( img19, 1250 + n * 7, 0);
    img21 = img20.get( 300* n, 0, 300, 970 );
    image( img21, 1250 + n * 7, 0);
    img23 = img22.get( 300* n, 0, 300, 970 );
    image( img23, 1250 + n * 7, 0);
    img25 = img24.get( 300* n, 0, 300, 970 );
    image( img25, 1250 + n * 7, 0);
  }
  }

  if(boss < 9)
  {
  //ブロック出現時の(60x0.5)フレーム前にエフェクトを出現させる
  if(count <= 60 * 1 && count >= 60 * 0.6 || count <= 60 * 2 && count >= 60 * 1.6 || 
     count <= 60 * 3 && count >= 60 * 2.6 || count <= 60 * 4 && count >= 60 * 3.6 || 
     count <= 60 * 5 && count >= 60 * 4.6 )
  {
    //効果音の再生
    player6.rewind(); 
    player6.play();

    //2フレームごとにコマを変える
    if (countAnim % 2 == 0) 
    {
      n++;
    }
    //1コマ目に戻す
    if(count == 60 * 1 || count == 60 * 2 || count == 60 * 3 || count == 60 * 4 || count == 60 * 5 )
    {
      countAnim = 0;
      n = 0;
    }
    
    //攻撃エフェクトの表示
    img17 = img16.get( 300* n, 0, 300, 970 );
    image( img17, 1250 + n * 7, 0);
    img19 = img18.get( 300* n, 0, 300, 970 );
    image( img19, 1250 + n * 7, 0);
    img21 = img20.get( 300* n, 0, 300, 970 );
    image( img21, 1250 + n * 7, 0);
    img23 = img22.get( 300* n, 0, 300, 970 );
    image( img23, 1250 + n * 7, 0);
    img25 = img24.get( 300* n, 0, 300, 970 );
    image( img25, 1250 + n * 7, 0);
  }
  }
}
