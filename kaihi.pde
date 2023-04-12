int meX = 0;
int meY = 0;
int Tamakazu = 200;
int Tama = 0;
int speed = 10;
int[] TamaX = new int[Tamakazu];
int[] TamaY = new int[Tamakazu];


void setup() {
  size(600,900);
  frameRate(60);
  background(255,255,255);
  for(int i = 0; i < Tamakazu; i++){
    TamaX[i] = -10;
    TamaY[i] = -10;
  }
}

void draw() {
  background(255,255,255);
  create();
  move();
  check();
}

void create() {
  fill(0,0,0);
  rect(meX,meY,20,6);
  for(int i = 0;i <= Tama-1; i++){
    ellipse(TamaX[i],TamaY[i],10,10);
  }
  text(millis(),10,10);
}

void move() {
  meX = mouseX-10;
  meY = mouseY-3;
  for(int i = 0; i <= Tama-1; i++){
    TamaY[i] = TamaY[i] + speed;
  }
  
}

void check() {
  if(meX < 0){
    meX = 0;
  }
  if(meX > 580){
    meX = 580;
  }
  for(int i = 0; i <= Tama-1; i++){
    if(TamaY[i] > 900){
      TamaY[i] = 0;
      TamaX[i] = int(random(width));
    }
    if((TamaX[i] >= meX) & (TamaX[i] <= meX+20)){
      if((TamaY[i] >= meY) & (TamaX[i] <= meY+6)){
        textSize(30);
        text("GAMEOVER",width/2-60,height/2);
        textSize(20);
        text("SCORE"+millis(),width/2-60,height/2+35);
        stop();
      }
    }
      
  }
  
  if(frameCount <= 120){
    if((frameCount % 10) == 0){
      Tama++;
    }
  }
}
