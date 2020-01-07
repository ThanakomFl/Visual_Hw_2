float mx,my,pmx,pmy;
float r,g,b,a;
int size = 50 ;
float speed = 0 ;
float gravity = 0.1;
int s1 = 2 ;
int s2 = 5 ;
int speed_x = 5;
float last_0,last_1,last_2,last_3 = 0;
float t_0,t_1,t_2,t_3 = 0;
float lastcl_0,lastcl_1,lastcl_2,lastcl_3 = 255;
float el_x,el_y,si;
boolean button = false,play = true;
void setup() {
  size(1000, 1000);
  smooth();
  mx = width/2;
  my = height/4;
}

void draw() {

  lastcl_0 = constrain(lastcl_0,0,255);
  lastcl_1 = constrain(lastcl_1,0,255);
  lastcl_2 = constrain(lastcl_2,0,255);
  lastcl_3 = constrain(lastcl_3,0,255);
    
  background(0);
  stroke(255);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
  if(mx > 0 && mx < width/2 && my > 0 && my < height/2){
    fill(255);
    rect(0,0,width/2,height/2);
    last_0 = 1;
    lastcl_0 = 255;
    t_0 = 1;
    t_1 = 0;
    t_2 = 0;
    t_3 = 0;
  }else if(mx > width/2 && mx < width && my > height/2 && my < height){
    fill(255);
    rect(width/2,height/2,width/2,height/2);
    last_1 = 1 ;
    lastcl_1 = 255;
    t_0 = 0;
    t_1 = 1;
    t_2 = 0;
    t_3 = 0;
  }else if(mx > 0 && mx < width/2 && my > height/2 && my < height){
    fill(255);
    rect(0,height/2,width/2,height/2);
    last_2 = 1;
    lastcl_2 = 255;
    t_0 = 0;
    t_1 = 0;
    t_2 = 1;
    t_3 = 0;
  }else if(mx > width/2 && mx < width && my > 0 && my < height/2){
    fill(255);
    rect(width/2,0,width/2,height/2);
    last_3 = 1;
    lastcl_3 = 255;
    t_0 = 0;
    t_1 = 0;
    t_2 = 0;
    t_3 = 1;
  }
  if(last_0 == 1) {
    fill(lastcl_0);
    rect(0,0,width/2,height/2);
    lastcl_0 -= 5;
    stroke(255);
  }
  if(last_1 == 1) {
    fill(lastcl_1);
    rect(width/2,height/2,width/2,height/2);
    lastcl_1 -= 5;
  }
  if(last_2 == 1) {
    fill(lastcl_2);
    rect(0,height/2,width/2,height/2);
    lastcl_2 -= 5;
  }
  if(last_3 == 1) {
    fill(lastcl_3);
    rect(width/2,0,width/2,height/2);
    lastcl_3 -= 5;
  }
  if(t_0 == 1){
    for(int i=0; i <= 20 ; i++){
      fill(#DEA570);
      stroke(#F08118);
      el_x = random(0,width/2);
      el_y = random(0,height/2);
      si = random(5,25);
      ellipse(el_x, el_y, si, si);
    }
  }
  if(t_1 == 1){
    for(int i=0; i <= 20 ; i++){
      fill(#95B2EA);
      stroke(#0C5AF2);
      el_x = random(width/2,width);
      el_y = random(height/2,height);
      si = random(5,25);
      ellipse(el_x, el_y, si, si);
    }
  }
  if(t_2 == 1){
    for(int i=0; i <= 20 ; i++){
      fill(#60D368);
      stroke(#2CE539);
      el_x = random(0,width/2);
      el_y = random(height/2,height);
      si = random(5,25);
      ellipse(el_x, el_y, si, si);
    }
  }
  if(t_3 == 1){
    for(int i=0; i <= 20 ; i++){
      fill(#A077D6);
      stroke(#812EF0);
      el_x = random(width/2,width);
      el_y = random(0,height/2);
      si = random(5,25);
      ellipse(el_x, el_y, si, si);
    }
  }
  
  if(button == false){
    mx = mx;
    my = my;
  }else{
    if(my < 15) my = height;
    if(mx > width - 120 || mx < 120){
      speed_x = -1*speed_x;
    }
    my = my - 1 ;
    mx = mx + speed_x;
    my = my + speed;
    speed = speed + gravity ;
    if(my > height - size/2 ){
      speed = speed * (-0.85);
    }
  }

  
  strokeWeight(3);
  stroke(77,162,150);
  noFill();
  //Rob's arms
  curve(mx -20, my - 55,mx - 40, my - 62, mx + mx - pmx -60, my + my - pmy -40, mx + 10, my +20);
  curve(mx -25, my - 60,mx - 50, my - 70, mx + mx - pmx -60, my + my - pmy - 40, mx + 50, my +50);

  //Rob's arms
  curve(mx +20, my - 55,mx + 40, my - 62, mx + mx - pmx + 60, my + my - pmy -40, mx - 10, my +20);  
  curve(mx +25, my - 60,mx + 50, my - 70, mx + mx - pmx + 60, my + my - pmy -40, mx - 50, my +50);  
  
   // Hand
  fill(0);
  stroke(0);
  ellipse(mx + mx - pmx -62, my + my - pmy -45, 15, 15);
  ellipse(mx + mx - pmx +62, my + my - pmy -45, 15, 15);
  
  strokeWeight(3);
  noFill();
  //Rob's legs
  stroke(77,162,150);
  curve(mx -20, my - 30,mx - 20, my - 30, mx + mx - pmx -18, my + my - pmy +10, mx + 10, my +20);
  curve(mx -25, my - 35,mx - 30, my - 40, mx + mx - pmx -22, my + my - pmy +10, mx + 50, my +50);
  curve(mx -25, my - 35,mx + mx - pmx - 22, my + my - pmy +10, mx + mx - pmx -18, my + my - pmy +10, mx + 50, my +50); // adapt2 , x1 x2 , adapt2
 
    //Rob's legs
  curve(mx +20, my - 30,mx + 20, my - 30, mx + mx - pmx +18, my + my - pmy +10, mx - 10, my +20);
  curve(mx +25, my - 35,mx + 30, my - 40, mx + mx - pmx +22, my + my - pmy +10, mx - 50, my +50);
  curve(mx +25, my - 35,mx + mx - pmx + 22, my + my - pmy +10, mx + mx - pmx +18, my + my - pmy +10, mx - 50, my +50);
  strokeWeight(1);
  
 // rect(mx, my, 50, 50); // Position of the mouse
  
   //Rob's body
  fill(150);
  float center_1_X = mx-125;
  float center_1_Y = my-170;
  
  float center_2_X = mx-40;
  float center_2_Y = my-180;
  
  float center_3_X = mx+40;
  float center_3_Y = my-180;
  
  float center_4_X = mx+125;
  float center_4_Y = my-170;
  
  float center_5_X = mx-100;
  float center_5_Y = my-230;
  
  float center_6_X = mx-80;
  float center_6_Y = my-240;
  
  float center_7_X = mx;
  float center_7_Y = my-245;
  
  float center_8_X = mx+80;
  float center_8_Y = my-240;
  
  float center_9_X = mx+100;
  float center_9_Y = my-230;
  
  fill(185,234,251);
  strokeWeight(2);
  
  stroke(77,162,193);
  triangle(center_1_X, center_1_Y, mx, my, center_2_X, center_2_Y);
  
  fill(228,247,254);
  triangle(center_2_X, center_2_Y, mx, my, center_3_X, center_3_Y);
  
  fill(185,234,251);
  triangle(center_3_X, center_3_Y, mx, my, center_4_X, center_4_Y);
  
  fill(155,229,244);
  triangle(center_5_X, center_5_Y, center_1_X, center_1_Y, center_6_X, center_6_Y);
  
  fill(201,236,255);
  triangle(center_6_X, center_6_Y, center_1_X, center_1_Y, center_2_X, center_2_Y);
  
  fill(209,242,251);
  triangle(center_6_X, center_6_Y, center_2_X, center_2_Y, center_7_X, center_7_Y);
  
  fill(228,247,254);
  triangle(center_2_X, center_2_Y, center_7_X, center_7_Y, center_3_X, center_3_Y);
  
  fill(209,242,251);
  triangle(center_7_X, center_7_Y, center_3_X, center_3_Y, center_8_X, center_8_Y);
  
  fill(228,247,254);
  triangle(center_8_X, center_8_Y, center_3_X, center_3_Y, center_4_X, center_4_Y);  
  
  fill(144,220,239);
  triangle(center_8_X, center_8_Y, center_4_X, center_4_Y, center_9_X, center_9_Y);
    
  //Rob's head
  //fill(255);
  //ellipse(mx, my - 30, 60 , 60);

  //Rob's eyes out
  stroke(0);
  strokeWeight(3);
  fill(255);
  ellipse(mx - 38, my - 110, 50, 50);
  ellipse(mx + 38, my - 110, 50, 50);
  
  //Rob's eyes in
  //r = random(150,255);
  //g = random(150,255);
  //b = random(150,255);
  //a = random(150,255);
  r = 0;
  g = 0;
  b = 0;
  a = 255;
  fill(r,g,b,a);
  ellipse(mx + mx - pmx - 35, my + my - pmy - 110, 33, 33);
  ellipse(mx + mx - pmx + 35, my + my - pmy - 110, 33, 33);
  
  // kiw 

  line(mx - 30, my - 135, mx + mx - pmx - 60, my + my - pmy - 143);
  line(mx + 30, my - 135, mx + mx - pmx + 60, my + my - pmy - 143);

    // mouse
  noFill();
  //stroke(2); 
  curve(mx + 10, my - 80,mx - 6, my - 100, mx + 6, my - 100, mx + 10, my - 20);
  
  pmy = my;
  pmx = mx;
  
  //rectMode(CENTER);
  fill(255);
  rect(width/2-50, height/2-50, 100, 100); 
  if(play){
    fill(0);
    rect(width/2-25, height/2-20, 20, 40); 
    rect(width/2+5, height/2-20, 20, 40); 
  }else{
    triangle(width/2-15, height/2-20, width/2-15, height/2+25, width/2+20, height/2);
  }

}

void mousePressed(){
  if(mouseX > width/2-50 &&mouseX < width/2+50 && mouseY > height/2-50 && mouseY < height/2+50){
    button = !button;
    play = !play;
  }
  r = random(50,255);
  b = random(50,255);
  g = random(50,255);
  a = random(50,255);
}
