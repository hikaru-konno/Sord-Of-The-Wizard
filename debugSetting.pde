//開発用タブ

/**************************************************
 devScsho():カーソルの座標を調べるための関数
 
 解説:エンターキーを押すとカーソルの座標がファイル
 名になったjpgファイルがDesktop/Processingフォルダ
 に保存される。
 ***************************************************/
void devScsho()
{
  if(keyPressed)
  {
    if(key == ENTER) 
    {
      String path = System.getProperty("user.home") + "/Desktop/Processing";
      save(path + '/' + mouseX + ',' + mouseY +  ".jpg");
      println(path + '/' + mouseX + ',' + mouseY + ".jpg");
    }
  }
}

void starInfo()
{
  fill(0);
  text("colflag = " + colflag, 300, 250);
  text("counter = " + counter, 300, 300);
  text("xx2 = " + xx2, 300, 100);
  text("dx2 = " + dx2, 300, 50);
  text("dx = " + dx, 300, 150);
  text("xx = " + xx, 300, 200);
  if(starEnables == true)
  {
    text("1 = true", 300, 400);
  }
  if(starEnables == false)
  {
    text("1 = false", 300, 400);  
  }
  if(starEnables2 == true)
  {
    text("2 = true", 300, 500);
  }
  if(starEnables2 == false)
  {
    text("2 = false", 300, 500);
  }
}

void devLine()
{
    stroke(0, 255 , 0);
    line(360, height, 360, 0);
    line(1600, 202, 1900, 202);
    line(1600, 400, 1600, 202);
    line(1900, 400, 1900, 202);
    line(1600, 400, 1750, 500);
    line(1750, 500, 1900, 400);
    stroke(0);
    line(365, temp, 365, temp+180);
}
