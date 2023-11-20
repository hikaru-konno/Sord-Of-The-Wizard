//ダメージラインを作成するタブ
void dLine()
{
  //透明度を変化させる
  stroke( 255, 0, 0 , sin(rad) * 50 + 200);
  deg += 1;
  rad = radians(deg);

  //線の描写
  strokeWeight( 10 );
  line( 360, 0, 360, height);
}
