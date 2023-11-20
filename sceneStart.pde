//タイトル画面
void sceneTitle()
{ 
  //背景の生成
  image(img28, 0, 0);
  image(img7, 800, 300);
  //縁取り加工
  fill(116, 66, 179);
  textSize(225);
  text("S", 400, 420);
  textSize(155);
  text("TAR", 530, 420);
  textSize(105);
  text("OF", 830, 330);
  textSize(105);
  text("THE", 830, 420);
  textSize(235);
  text("W", 1010, 420);
  textSize(155);
  text("IZARD", 1170, 420);
  
  
  //タイトル文字の生成
  fill(255, 255, 0);
  textSize(220);
  text("S", 400, 420);
  fill(255, 136, 0);
  textSize(150);
  text("TAR", 530, 420);
  textSize(100);
  text("OF", 830, 330);
  textSize(100);
  text("THE", 830, 420);
  textSize(220);
  fill(255, 255, 0);
  text("W", 1010, 420);
  fill(255, 136, 0);
  textSize(150);
  text("IZARD", 1170, 420);
  strokeWeight(5);
  line(400, 440, 1560, 440);
  fill(0);
  textSize(60);
  text("スター　オブ　ザ　ウィザード", 650, 500);
  
  //スタートボタンの誘導
  fill(0, 0, 0, -sin(rad) * 50 + 160);
  text("Aボタンを押してスタート", 660, 700);
  deg += 4;
  rad = radians(deg);
}
