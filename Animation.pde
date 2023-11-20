//ボスの登場シーンに関するタブ

int countBs = 0;//ボスのアニメーションに関する関数
int clearBs = 0;//フェードアウトの透明度
int clearBs2 = 0;//フェードアウトの透明度
int clearBs3 = 0;//フェードアウトの透明度
int clearBs4 = 0;//フェードアウトの透明度
int clearBs5 = 255;//フェードアウトの透明度
int clearBd = 0;//ボスの透明度
int clearBd2 = 0;//ボスの透明度
int clearBd3 = 255;//ボスの透明度
int picRepx = 0;//ボスの座標調整
int picRepy = 0;//ボスの座標調整
float objScale = 1;//図形の拡大率
int picScalex = 300;//画像の拡大率
int picScaley = 300;//画像の拡大率

//右端と左端のエフェクト
int eft1, eft2, eft3;
//端から2番目のエフェクト
int eft4, eft5, eft6, eft7;
//端から3番目のエフェクト
int eft8, eft9, eft10, eft11, eft12;
//中央のエフェクト
int eft13, eft14, eft15, eft16, eft17, eft18, eft19;

//単振動用の変数
float degBs = 0.0;
float radBs = 0.0;

//座標のループや画像の透明度で用いる関数
int eftNum(int x, int y, int z, int e)
{
    if (x >= z)
    {
        x = x - y;
    }
    if (x < z)
    {
        x = e;
    }
    return x;
}

//必殺技アニメーションで用いる
int eftNum2(int x, int y, int z, int e)
{
    if (x >= z)
    {
        x = x - y;
    }
    if (x < z)
    {
        x = e;
    }
    if (x > temp + 205)
    {
        x = temp + 205 + y;
    }
    return x;
}

//数値xをzになるまでyずつ増やしていく関数
int clearObj(int x, int y, int z)
{
    if (x <= z)
    {
        x = x + y;
   }
    if (x > z)
    {
        x = z;
   }
    return x;
}

//アザトース背後のエフェクト作成
void showCircle()
{
        //両端のエフェクトのパラメータ
        eft1= eftNum(eft1, 3, 450, 680);
        eft2= eftNum(eft2, 5, 450, 680);
        eft3= eftNum(eft3, 7, 450, 680);
        
        //端から2番目のエフェクトのパラメータ
        eft4= eftNum(eft4, 3, 500, 680);
        eft5= eftNum(eft5, 5, 500, 680);
        eft6= eftNum(eft6, 7, 500, 680);
        eft7= eftNum(eft7, 2, 500, 680);
        
        //端から3番目のエフェクトのパラメータ
        eft8= eftNum(eft8, 3, 400, 680);
        eft9= eftNum(eft9, 5, 400, 680);
        eft10 = eftNum(eft10, 7, 400, 680);
        eft11 = eftNum(eft11, 2, 400, 680);
        eft12 = eftNum(eft12, 4, 400, 680);
        
        //中央のエフェクトのパラメータ
        eft13 = eftNum(eft13, 3, 300, 680);
        eft14 = eftNum(eft14, 5, 300, 680);
        eft15 = eftNum(eft15, 7, 300, 680);
        eft16 = eftNum(eft16, 2, 300, 680);
        eft17 = eftNum(eft17, 1, 300, 680);
        eft18 = eftNum(eft18, 6, 300, 680);
        eft19 = eftNum(eft19, 4, 300, 680);

    //右端のエフェクト
        circle(1100, eft3, 40);
        circle(1100, eft2, 40);
        circle(1100, eft1, 40);
        
        //右から2番目のエフェクト
        circle(1060, eft4, 40);
        circle(1060, eft5, 40);
        circle(1060, eft6, 40);
        circle(1060, eft7, 40);
        
        //右から3番目のエフェクト
        circle(1020, eft8, 40);
        circle(1020, eft9, 40);
        circle(1020, eft10, 40);
        circle(1020, eft11, 40);
        circle(1020, eft12, 40);
        
        //中央のエフェクト
        circle(960, eft13, 40);
        circle(960, eft14, 40);
        circle(960, eft15, 40);
        circle(960, eft16, 40);
        circle(960, eft17, 40);
        circle(960, eft18, 40);
        circle(960, eft19, 40);
        
        //右から5番目のエフェクト
        circle(920, eft8, 40);
        circle(920, eft9, 40);
        circle(920, eft10, 40);
        circle(920, eft11, 40);
        circle(920, eft12, 40);
        
        //右から6番目のエフェクト
        circle(880, eft4, 40);
        circle(880, eft5, 40);
        circle(880, eft6, 40);
        circle(880, eft7, 40);
        
        //左端のエフェクト
        circle(840, eft3, 40);
        circle(840, eft2, 40);
        circle(840, eft1, 40);
}

//ボスを登場させるアニメーション
void bossAnim()
{
    countBs++;
    //0秒経過で明転
    if (countBs <= 60 * 50)
    {
        //フェードアウト
        fill(255, clearBs);
        clearBs = clearObj(clearBs, 1, 255);
        rect(0, 0, width, height);
    }
       
        //4秒経過でシークレットボスなどを表示
        if (countBs > 60 * 4)
        {
           //フェードアウト
           noStroke();
           fill(0, clearBs2);
           clearBs2 = clearObj(clearBs2, 2, 255);
           rect(0, 0, width, 70);//画面を狭める
           
           //フェードアウト
           fill(0, clearBs3);
           clearBs3 = clearObj(clearBs3, 2, 255);
           rect(0, height - 70, width, 70);//画面を狭める
           
           //透明度を下げていく
           tint(0, clearBd);
           clearBd = clearObj(clearBd, 2, 255);
        
           //シークレットを表示
           image(img9, 810, -sin(radBs) * 50 + 350);//単振動により滑らかな上下運動を行う
           noTint();
           degBs += 1;
           radBs = radians(degBs);
       }
       
       //8秒経過でシルエットアザトースが一部はがれる
       if (countBs >= 60 * 8)
        {
            player13.play();  //効果音再生

           //透明度を下げる
           fill(41,0, 136, clearBs4);
           clearBs4 = clearObj(clearBs4, 5, 255);
           rect(0, 0, width, height);

        noStroke();
        fill(255, 100);
        showCircle();//アザトース背後のエフェクト作成

           //フェードアウト
           tint(255, clearBd2);
           clearBd2 = clearObj(clearBd2, 2, 255);
           image(img31, 810, -sin(radBs) * 50 + 350);//単振動により滑らかな上下運動を行う
           noTint();
       }
           
        //11秒経過で発光表現で明転
        if(countBs >= 60*11 && countBs < 60*14)
        {
            player14.play();  //効果音再生

           if(objScale <= 4000)
           {
               objScale*=1.2;
           }
           if(objScale > 4000)
           {
               objScale= 4000;
           }
           fill(255);
           circle(950, 410, 1*objScale);//アザトースが発光
       }
           
        //14秒経過で真の姿を表す
        if(countBs >= 60*14)
        {
           fill(41,0, 136);
           rect(0, 0, width, height);//アザトース表示
           image(img9, 800, 400);
           //フェードアウト
           fill(255, clearBs5);
           if(clearBs5 >= 0)
           {
               clearBs5= clearBs5 - 5;
           }
           if(clearBs5 < 0)
           {
               clearBs5= 0;
           }
           rect(0, 0, width, height);
       }
           
        //17秒経過でシークレットの正体を判明させる
        if(countBs >= 60*17)
        {
            player12.play();  //効果音再生
            
           //フェードアウト
           tint(255, clearBd3);
           if (clearBd3 >= 0)
            {
               clearBd3 = clearBd3 - 10;
           }
           if (clearBd3 < 0)
            {
               clearBd3 = 255;
           }
           
           //アザトースの拡大表現と透明度変化
           if (picScalex <= 1000)
            {
               picScalex = picScalex + 30;
               picScaley = picScaley + 30;
               picRepx = picRepx + 15;
               picRepy = picRepy + 15;
           }
           //拡大と透明度変かを繰り返す
           if (picScalex > 1000)
            {
               picScalex = 300;
               picScaley = 300;
               picRepx = 0;
               picRepy = 0;
           }
           img32.resize(picScalex, picScaley);
           image(img32, 800 - picRepx, 400 - picRepy);
           noTint();
       }

        if(countBs >= 60*4)
        {
            fill(255, 100, 0);
            textSize(30);
            text("xボタンで演出スキップ", 50, 50);
            //xボタンで演出スキップ
            if (keyPressed)
            {
                if (key == 'x')
                {
                    countA = 60 * 19;
                }
            }
        }
}