//ボス衝突時のエフェクトに関する関数

float starEfJudge = 0;//スターがボスに当たったかの判別
float spcEfJudge = 0;
int clearEFJ = 255;//エフェクトの透明度
int clearSPC = 255;//エフェクトの透明度
float moveX = 0;//エフェクトの座標
float moveY = 0;//エフェクトの座標
float movespcX = 0;//エフェクトの座標
float movespcY = 0;//エフェクトの座標
float tempX;//スターの座標を一時保存
float tempY;
float tempspcX;//スターの座標を一時保存
float tempspcY;
float sizeSPC = 0;

//clearObjのfloat版
float efjNum(float xF, float yF, float zF, float eF)
{
    if (xF <= zF)
    {
        xF = xF + yF;
    }
    if (xF > zF)
    {
        xF = eF;
    }
    return xF;
}

void starEffect()
{
//0<=starEfJudge<=1
if(starEfJudge <= 0)
{
    starEfJudge = 0;
}
if(starEfJudge >= 1)
{
    starEfJudge = 1;
}

if(starEfJudge == 1)
{
    //透明度変化
    clearEFJ = eftNum(clearEFJ, 8, 0, 0);
    noStroke();
    fill(255, 255, 0, clearEFJ);

    //座標のパラメータ
    moveX = efjNum(moveX, 3, 100, 100);
    moveY = efjNum(moveY, 3, 100, 100);

    //エフェクト表示
    circle(tempX + moveX, tempY + moveY, 50);
    circle(tempX + moveX, tempY - moveY, 50);
    circle(tempX - moveX, tempY + moveY, 50);
    circle(tempX - moveX, tempY - moveY, 50);
    circle(tempX, tempY, moveX);

}

if(xx >= 1000 && xx <= 1200)
{
    starEfJudge--;//判別値リセット
}

//ボス衝突時エフェクトのリセット
if(starEfJudge == 0)
{
    clearEFJ = 255;//エフェクトの透明度
    moveX = 0;
    moveY = 0;
}
}

//必殺技バージョン
void spcialEffect()
{
//0<=starEfJudge<=1
if(spcEfJudge <= 0)
{
    spcEfJudge = 0;
}
if(spcEfJudge >= 1)
{
    spcEfJudge = 1;
}

if(spcEfJudge == 1)
{
    //透明度変化
    clearSPC = eftNum(clearSPC, 5, 0, 0);
    noStroke();
    fill(255, 114, 0, clearSPC);

    //座標のパラメータ
    movespcX = efjNum(movespcX, 3, 200, 200);
    movespcY = efjNum(movespcY, 3, 200, 200);
    sizeSPC = efjNum(sizeSPC, 5, 200, 200);

    //エフェクト表示
    circle(tempspcX + movespcX, tempspcY + movespcY, 50);
    circle(tempspcX + movespcX, tempspcY - movespcY, 50);
    circle(tempspcX - movespcX, tempspcY + movespcY, 50);
    circle(tempspcX - movespcX, tempspcY - movespcY, 50);
    circle(tempspcX, tempspcY + movespcY, 50);
    circle(tempspcX - movespcX, tempspcY, 50);
    circle(tempspcX, tempspcY - movespcY, 50);
    circle(tempspcX + movespcX, tempspcY, 50);
    circle(tempspcX, tempspcY, sizeSPC);

}

if(xx2 >= 1000 && xx2 <= 1200)
{
    spcEfJudge--;//判別値リセット
}

//ボス衝突時エフェクトのリセット
if(spcEfJudge == 0)
{
    clearSPC = 255;//エフェクトの透明度
    movespcX = 0;
    movespcY = 0;
}
}