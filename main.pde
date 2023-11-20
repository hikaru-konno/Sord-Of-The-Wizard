PImage img1, img2, img7, img8, img9, img10, img11, img12, img13, img14, img15, 
  img16, img17, img18, img19, img20, img21, img22, img23, img24, img25, img26, img27, img28, img29, 
  img30, img31, img32, img33, img34, img35; //イメージデータ格納用の変数
int sceneid = 0;//シーン移動に用いる
PFont myFont;//ベースとなるフォント
int beforeRef = 0;//過去の連続ヒット数のハイスコア
int beforeScore = 0;//過去のハイスコア
int countA = 0;//戦闘シーンに移るときのカウント
int clearBtl = 255;//バトルシーンに入るときのフェード用カウント

import ddf.minim.*;  //minimライブラリのインポート
import ddf.minim.signals.*;

Minim minim;  //Minim型変数であるminimの宣言
AudioPlayer player, player2, player3, player4, player5, player6, player7, player8, player9, 
  player10, player11, player12, player13, player14, player15, player16, player17, 
  player18, player19, player20;  //サウンドデータ格納用の変数

//過去の連続ヒット数のハイスコアを読み込む
int loadHirefNum() 
{
  String hirefNum[];
  hirefNum = loadStrings("hirefNum.txt");

  //データがない場合
  if (hirefNum == null) 
  {
    return 0;
  } 
  //ある場合
  else 
  {
    return int(hirefNum[0]);
  }
}

//過去のハイスコアを読み込む
int loadHiscore() 
{
  String hiScore[];
  hiScore = loadStrings("hiScore.txt");

  //過去のデータがない場合
  if (hiScore == null) 
  {
    return 0;
  } 
  //ある場合
  else 
  {
    return int(hiScore[0]);
  }
}

void settings()
{
  size(displayWidth, 970);
}

void setup()
{
  frameRate(60);

  minim = new Minim(this);  //初期化
  player = minim.loadFile("星発射.mp3"); 
  player2 = minim.loadFile("長めのキラキラした音.mp3"); 
  player3 = minim.loadFile("ブロック破壊.mp3"); 
  player4 = minim.loadFile("居合抜き1.mp3"); 
  player5 = minim.loadFile("ラストボス01.mp3"); 
  player6 = minim.loadFile("ブロック出現.mp3"); 
  player7 = minim.loadFile("op.mp3"); 
  player8 = minim.loadFile("ダメージを与える.mp3"); 
  player9 = minim.loadFile("倍ダメージを与える.mp3"); 
  player10 = minim.loadFile("勝利BGM.mp3"); 
  player11 = minim.loadFile("ハイスコア.mp3"); 
  player12 = minim.loadFile("アザトースの鳴き声.mp3"); 
  player13 = minim.loadFile("現れる準備.mp3"); 
  player14 = minim.loadFile("明転.mp3");  
  player15 = minim.loadFile("超必殺技発動.mp3"); 
  player16 = minim.loadFile("スター反射音.mp3"); 
  player17 = minim.loadFile("結果発表.mp3"); 
  player18 = minim.loadFile("プレイヤーがダメージを受ける.mp3"); 
  player19 = minim.loadFile("gameclear.mp3"); 
  player20 = minim.loadFile("アザトース撃破.mp3");

  //ブロック表示を有効化
  for (int i = 0; i < 5; i++)
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


  beforeRef = loadHirefNum();//過去最高ヒット数の読み込み　リザルト画面で使う
  beforeScore = loadHiscore();//過去最高スコアの読み込み


  img1 = loadImage("mahoutsukai_fire3.png");//炎
  img2 = loadImage("mahoutsukai_fire2.png");//炎戦闘用
  img30 = loadImage("player.png");//炎リザルト用
  img33 = loadImage("mahoutsukai_fire_special.png");//炎必殺技用
  img34 = loadImage("mahoutsukai_fire_shade.png");//炎変身用
  img7 = loadImage("book_madousyo_necronomicon.png");//魔法書
  img8 = loadImage("book_madousyo_necronomicon2.png");//魔法書戦闘用
  img9 = loadImage("character_cthulhu_azathoth.png");//アザトース
  img31 = loadImage("character_cthulhu_azathoth_black2.png");//シルエットアザトース
  img32 = loadImage("character_cthulhu_azathoth_shade.png");//正体を表すアザトース
  img35 = loadImage("character_cthulhu_azathoth_Super.png");//覚醒後のアザトース

  //ブロック用イメージ
  img10 = loadImage("block01.png");
  img11 = loadImage("block02.png");
  img12 = loadImage("block03.png");
  img13 = loadImage("block04.png");
  img14 = loadImage("block05.png");

  img15 = loadImage("5801458i.jpg");//背景画像
  img28 = loadImage("Winsmart.png");//勝利時のとタイトル画面の背景画像

  //攻撃エフェクト用イメージ
  img16 = loadImage("anim_1.png");
  img18 = loadImage("anim_2.png");
  img20 = loadImage("anim_3.png");
  img22 = loadImage("anim_4.png");
  img24 = loadImage("anim_5.png");

  //フェード用イメージ
  img26 = loadImage("1701.png");
  img27 = loadImage("1702.png");

  //ゲームのベースとなるフォント
  myFont = createFont("HGP創英ﾌﾟﾚｾﾞﾝｽEB", 100);
  textFont(myFont);
}

void draw()
{
  //Aボタンで戦闘シーンへ
  if (keyPressed)
  {
    if (key == 'a')
    {
      sceneid = 2;
    }
  }
  //デモ用　強制勝利シーンへ
  if (keyPressed)
  {
    if (key == 's')
    {
      sceneid = 3;
    }
  }
  //デモ用　ポーズ解除
  if (keyPressed)
  {
    if (key == 'z')
    {
      sceneid = 0;
    }
  }
  //Dボタンを押すとポーズメニューへ
  if (keyPressed)
  {
    if (key == 'd')
    {
      sceneid = 6;
    }
  }

  //敵の体力が0になると勝利画面へ
  if (enemHP <= 0)
  {
    sceneid = 3;
  }

  //体力が半分になると覚醒シーンへ
  if (boss == 7 || boss == 8)
  {
    sceneid = 5;
    boss = 9;
  }

  //味方の体力が0になると敗北画面へ
  if (playHP <= 0)
  {
    sceneid = 4;
  }

  //sceneid = 2すなわち戦闘シーンに入ったとき
  if (sceneid == 2)
  {
    countA++;
    if (countA >= 60*4)
    {
      player5.play();//戦闘BGMの再生
    }
    //0秒から３秒以内のとき
    if (countA >= 0 && countA <= 60*19)
    {
      player2.play();//効果音再生
      player10.pause();//勝利BGM停止
      player7.close();//オープニング曲の終了
      bossAnim();//演出
    }
    //3秒以降でゲーム開始
    if (countA > 60*19)
    {
      //演出の効果音をリセット
      player12.rewind();
      player12.pause();
      player13.rewind();
      player13.pause();
      player14.rewind();
      player14.pause();

      image(img15, 0, 0);//背景画像

      dLine();//ダメージを受けるライン

      //プレイヤーに関する関数
      playerInfo();

      //アザトースに関する関数
      enemyParam();
      enemEffect();

      //スターの動きを制御する関数
      moveStar();

      //アザトースの体力に関する関数
      enemyHP();

      //プレイヤーの体力に関する関数
      playerHP();

      //必殺技に関する関数
      hissatu();

      //プレイヤーに関する関数
      playerMade();

      //ブロックに関する関数
      createBlock();
      FcreateBlock();

      //ラケットに当たった回数を数える関数
      racketHit();

      //スコアに関する関数
      blockScore();

      //ボスに弾を当てた時のスターのエフェクトに関する関数
      starEffect();
      spcialEffect();

      //チェンジシーンの演出
      fill(255, clearBtl);
      if (clearBtl >= 0)
      {
        clearBtl = clearBtl - 20;
      }
      if (clearBtl < 0)
      {
        clearBtl = 0;
      }
      rect(0, 0, width, height);
    }
  }

  //ポーズ画面に入ったとき
  if (sceneid == 6)
  {
    pauseSetting();
  }

  //アザトース覚醒シーンに入ったとき
  if (sceneid == 5)
  {
    effectSpr();
  }

  //勝利画面に入ったとき
  if (sceneid == 3)
  {
    resultWin();
  }

  //敗北画面に入ったとき
  if (sceneid == 4)
  {
    resultLose();
  }

  //タイトル画面に入ったとき
  if (sceneid == 0)
  {
    player7.play();
    sceneTitle();
  }

  strokeWeight(1);
  noFill();
}
