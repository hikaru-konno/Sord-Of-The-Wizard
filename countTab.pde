//スコア表示とコンボ表示に関するタブ

String hirefNum[] = new String[1];//ファイルに保存する連続ヒット数のハイスコア
String hiScore[] = new String[1];//ファイルに保存するハイスコア

int maxRef = 0;//連続hit数の最大コンボ数
int score;//スコア
int hiNumSize = 0;
int slideX = 900;

//ラケットのヒット回数に関する関数
void racketHit()
{
  //連続hit数の表示
  if(refNum >= 1 && refNum < 10)
  {
    fill(0, 255, 255);
    textSize(hiNumSize);
    text(refNum, 905, 100);
    textSize(40);
    text("hit!", slideX + 5, 100);

    fill(255);
    textSize(hiNumSize);
    text(refNum, 900, 100);
    textSize(40);
    text("hit!", slideX, 100);
  }
  //文字位置調整
  if(refNum >= 10)
  {
    fill(0, 255, 255);
    textSize(hiNumSize);
    text(refNum , 905 - 40, 100);
    textSize(40);
    text("hit!", slideX + 5, 100);

    fill(255);
    textSize(hiNumSize);
    text(refNum, 900 - 40, 100);
    textSize(40);
    text("hit!", slideX, 100);
  }
}

//スコアに関する関数
void blockScore()
{
  //スターがブロックに当たった回数に応じてスコアが増える
  score = colflagB * 1100;
  
  //テキストボックス作成
  stroke(0, 155, 255);
  fill(0, 70);
  quad(480, 40, 750, 40, 800, 100, 530, 100);
  
  //スコア表示
  fill(255);
  textSize(35);
  text("スコア", 520, 50);
  textSize(50);
  //文字位置調整
  if(score < 1000)
  {
    text(score, 700, 90);
  }
  if(score < 10000 && score >= 1000)
  {
    text(score, 640, 90);
  }
  if(score < 100000 && score >= 10000)
  {
    text(score, 600, 90);
  }
  if(score < 1000000 && score >= 100000)
  {
    text(score, 570, 90);
  }
  if(score < 10000000 && score >= 1000000)
  {
    text(score, 550, 90);
  }
  //スコアは9999999でカンスト
  if(colflagB * 1100 > 9999999)
  {
    text("9999999", 550, 90);
  }
}
