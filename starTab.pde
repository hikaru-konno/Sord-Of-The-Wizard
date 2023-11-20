float xx = -330;//スター1の初期X座標
float yy = -50;//スター1の初期Y座標
float xx2 = -330;//スター2の初期X座標
float yy2 = -50;//スター2の初期Y座標
float dx2 = random(12, 15);//スター2のXの速度を乱数設定
float dy2 = 0;//スター2のYの速度を乱数設定
float dx = random(7, 10);//スター1のX速度を乱数設定
float dy = random(7, 10);//スター1のYの速度を乱数設定
//boolean[] starEnable = new boolean[20];
boolean starEnables = true;//trueならばスターを非表示、falseならばスターを表示
boolean starEnables2 = true;
int counter = 0;//スターが発射されているかどうかの判別
int counter2 = 0;//必殺技が発射されているかどうかの判別 
int colflag =0;//ボスとスターの衝突回数
float random;//乱数作成
int refNum = 0;//スターが反射した回数を数える変数
int clearRef = 255;//スター反射時のエフェクト
int sizeRef = 0;//同上
int refEffect = 0;//スターが反射したかどうかの判別


int boss = 0;//覚醒用カウンター


/**************************************************
 starMake():弾であるスターを作成する関数
 *一応とげの数を変更可能にしている
 ***************************************************/
void starMake(float x, float y, int r, int toge) {
  int longV;  // 中心点から頂点までの距離
  int longT = r;  // 中心点からとげまでの距離
  int longY = longT/2;  // 中心点から谷までの距離をとげまでの距離の半分に
  int choten = toge*2;  // 頂点数(トゲの数×2)
  pushMatrix();//translate(x, y)が他のものの座標にも影響してしまうため、それを防ぐ
  translate(x, y);//スターの座標を設定する関数
  rotate(radians(-90));//星の向きを調整
  beginShape();//点と点をつなげるための関数
  /**************************************************
　　半径が中心点から頂点となる円上に頂点を等間隔で配置させる
(とげが5個の場合は36度ごとに頂点を半径longT と longYの円上に配置する)
 　 頂点が奇数のとき谷(longY)に、偶数のときとげ(longT)にさせる
　***************************************************/
  for (int i = 0; i < choten; i++) 
  {
    if (i % 2 == 0)//偶数
    {
      longV = longT;//longVはとんがる
    }
    else//奇数
    {
      longV = longY;//longVは谷になる
    }
    //360°を頂点の数で割ることによって、等間隔で頂点を配置させる。
    vertex(longV * cos(radians(360 * i / choten)), longV * sin(radians(360 * i / choten)));
  }
  endShape(CLOSE);//beingShape();の終了
  popMatrix();//translate関数をstarMake関数内のみに反映させる。
}



//スターの動きを管理する関数
void moveStar()
{
    if(keyPressed)
    {    
      /*fキーでスターを発射させる
        スターが画面内にあると発射させることができない*/
      if(key == 'f' && counter == 1)
      {
        player.play();  //再生
        player.rewind(); 
        random = random(1.0, 2.0);
        //randomが1.0から1.5の間ならスターは下向きに発射され、randomが1.5から2.0の間なら上向きに発射
        if(random <= 1.5)
        {
          dy = random(7, 10);
        }
        if(random > 1.5)
        {
          dy = random(-7, -10);
        }
        yy = temp + 100;//プレイヤーのy座標+100の高さからスターを発射
        xx = 360;//x座標360からスターを発射
        starEnables = false;//スターの画像を表示
      }
    }
    
    //スターの画像が非表示でスターのx座標が330より小さいとき、すなわちスターがプレイヤーに衝突したとき
    if(starEnables == true)
    {
      if(xx <= 330)
      {
        dx = random(7, 10);//スターの動きを右向きに変え、反射させる
      } 
    }
    
    //スターが表示されているとき
    if(starEnables == false)
    { 
      //スターが画面外かブロック内にあるとき、移動方向を変える
      if(xx > width - 30 || xx < 30 || (xx < 360 && yy < temp + 180 && yy > temp))
      {
         dx = -dx;
      }
      if(yy > height - 30 || yy < 30 || (xx < 360 && yy >= temp + 200 || xx < 360 && yy <= temp - 40))
      {
         dy = -dy;
      }
      //スターを反射したらヒット数を増やす
      if(xx < 360 && yy < temp + 180 && yy > temp)
      {

        player16.rewind(); 
        player16.play();  //効果音再生
        refEffect++;//スターが魔法書で反射したら1、ブロックで反射したら0;
        hiNumSize = 150;//countTab用テキストアニメーションの初期値
        slideX = 900;//countTab用テキストアニメーションの初期値
        refNum++;
      }

      //0<=refEffect<=1
      if(refEffect <= 0)
      {
        refEffect = 0;
      }
      if(refEffect >= 1)
      {
        refEffect = 1;
      }

      if(refEffect == 1)
      {
          //反射時のエフェクトを描く
          clearRef = eftNum(clearRef, 5, 0, 0);
          sizeRef = clearObj(sizeRef, 5, 200);
          noStroke();
          fill(0, 255, 255, clearRef);
          ellipse(360, temp + 80, 10, sizeRef);
      }

      //反射時エフェクトのリセット
      if(refEffect == 0)
      {
          clearRef = 255;
          sizeRef = 0;
      }

      //ヒット数のアニメーション
      if(xx >= 360)
      {
          if(hiNumSize < 10)
          {
              hiNumSize = eftNum(hiNumSize, 13, 90, 90);
          }
          if(hiNumSize >= 10)
          {
              hiNumSize = eftNum(hiNumSize, 13, 90, 80);
          }
          slideX = clearObj(slideX, 10, 950);
      }
      
      //バグ修正用
      if(yy < 29 && yy > 0)
      {
         yy += 30;
      }
      
      //スターのx座標が360より小さく、スターがプレイヤーに当たらなければスターを非表示にする
      if(xx < 360 && yy >= temp + 180 || xx < 360 && yy <= temp)
      {
        starEnables = true;
        xx = -360;
        
        //もし前回の連続ヒット回数より今の連続ヒット回数が大きかったら、ハイスコアを更新する
        if(maxRef < refNum)
        {
          maxRef = refNum;
        }
        
        //連続ヒット回数のリセット
        refNum = 0;
      }
      
      //ボスに当たるとスターを非表示にしてボスに当たった回数(colflag)を増やす
      if(xx > 1600 && xx < 1900 && yy > -sin(rad) * 50 + 320 && yy < -sin(rad) * 50 + 620)
      {
        tempX = xx;
        tempY = yy;
        player8.rewind(); 
        player8.play();  //効果音再生
        enemClr = 20;//アニメーション用判別ID
        starEfJudge++;
        starEnables = true;
        colflag++;
        boss++;
        xx = -360;
        
        //もし前回の連続ヒット回数より今の連続ヒット回数が大きかったら、ハイスコアを更新する
        if(maxRef < refNum)
        {
          maxRef = refNum;
        }
        
        //連続ヒット回数のリセット
        refNum = 0;
      }
      
      //スターの速度設定
      xx += dx;
      yy += dy;

      //スターの描写
      fill(255, 255, 0);
      strokeWeight(7);
      stroke(255, 193, 0);
      starMake(xx, yy, 30, 5);
      fill(255, 255, 255);
      noStroke();
      starMake(xx, yy, 15, 5);
    }
    
    if(keyPressed)
    {    
      /*fキーでスターを発射させる
        スターが画面内にあると発射させることができない*/
      if(key == 'g' && counter2 == 1 && refNum >= 5)
      {
        player4.rewind(); 
        player4.play();  //効果音再生
        yy2 = temp + 100;//プレイヤーのy座標+100の高さからスターを発射
        xx2 = 360;//x座標360からスターを発射
        starEnables2 = false;//スターの画像を表示
      }
    }
    
    
    //スターが表示されているとき
    if(starEnables2 == false)
    { 
      //スターが画面外かブロック内にあるとき、移動方向を変える
      if(xx2 > width - 150 || xx2 < 150 || (xx2 < 360 && yy2 < temp + 180 && yy2 > temp))
      {
         starEnables2 = true;
         xx2 = -360;
      }
      
      //スターのx座標が360より小さく、スターがプレイヤーに当たらなければスターを非表示にする
      if(xx2 < 360 && yy2 >= temp + 180 || xx2 < 360 && yy2 <= temp)
      {
        starEnables2 = true;
        xx2 = -360;
      }
      
      //ボスに当たるとスターを非表示にしてボスに当たった回数(colflag)を増やす
      if(xx2 > 1600 && xx2 < 1900 && yy2 > -sin(rad) * 50 + 320 && yy2 < -sin(rad) * 50 + 620)
      {
        tempspcX = xx2;
        tempspcY = yy2;
        spcEfJudge++;
        player9.rewind(); 
        enemClr = 20;//アニメーション用
        player9.play();  //効果音再生
        starEnables2 = true;
        colflag = colflag + 2;
        boss = boss + 2;
        xx2 = -360;
      }
      
      //必殺技の速度設定
      xx2 += dx2;
      yy2 += dy2;

      //必殺技の描写
      fill(255, 0, 0);
      strokeWeight(7);
      stroke(255, 193, 0);
      starMake(xx2, yy2, 150, 6);
      fill(255, 150, 0);
      noStroke();
      starMake(xx2, yy2, 75, 6);
    } 
  
  //スターが発射されているかどうかの判別
  if(starEnables == true)
  {
    counter = 1;
  }
  else
  {
    counter = 0;
  }
  //必殺技が発射されているかどうかの判別
  if(starEnables2 == true)
  {
    counter2 = 1;
  }
  else
  {
    counter2 = 0;
  }
  
  //ダメージをくらうと敵が赤くなる
  if(enemClr > 0)
  {
    tint(255, 0, 0, 200);
    image(img9, 1600, -sin(rad) * 50 + 320);//単振動により滑らかな上下運動を行う
    noTint();
    enemClr = enemClr - 2;
  }
  if(enemClr <= 0)
  {
    enemClr = 0;
  }

  strokeWeight(1);
}
