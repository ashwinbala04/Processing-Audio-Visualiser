import processing.sound.*;//adds the library
Amplitude amp; //Amplitude, allows you to use analyze()

SoundFile sample; //is just referencing a sound file

ArrayList<Ball> ballList; //this preps the list

int ballWidth = 60;

void setup(){
size(600,600);

ballList = new ArrayList<Ball>(); //this creates the list

sample = new SoundFile(this, "MEH instrumental.mp3");
sample.loop();

amp = new Amplitude(this);
amp.input(sample);//sets amp to look at our sound file
}

void draw(){
background(0);
println(amp.analyze()); //this returns a number from 0 to 1



//for (int i = balls.size()-1; i >= 0; i--) { //same as below just a different way of calling it.
for(int i = 0; i < ballList.size(); i++){
Ball b = ballList.get(i); //set the ball from the list to the variable b
b.display();
b.move();

if(b.removeList() == true){
ballList.remove(i);
}

}//end of for


for(int i = 0; i < 20; i++){ //this adds multiple balls to the list

ballList.add(new Ball(300,300, ballWidth) );
}

}


// Simple particle effect class

class Ball {

float x;
float y;
float a; //alpha (transparency)
float w; //width of the ball
float mx; //movement amount
float my;
float n = amp.analyze() * 100;
float b;
float c;
float d;

Ball(float tempX, float tempY, float tempW) {
x = tempX;
y = tempY;
w = tempW;
a = 100;
mx = random(-10,10); //set a random direction
my = random(-10,10);
b = random(0,255); 
c = random(0,255);
d = random(0,255);
// The variables a,b, and c are varioubes that randomize the colours of the ball
}

void move() {
x+= mx;
y+= my;
a-= 5;
}

Boolean removeList(){

//if the ball is totally transparent remove from the list
if(a > 0){
return false;
}
else{
return true;
}

}

void display() {
// Display the circle
// fill(r,g,b)
// fill(r,g,b,a)
// fill(0-255,a)
//stroke(0,life);
ellipse(x,y,w,w);


// if amplitute is greater than certain number
if(n > 80){
fill(b,c,d);
//randomizes ball colour
a-= 2;
x+= 10*mx;
y+= 10*my;

}

else{
fill(b,c,d);
//randomizes ball colour
a-= 100;
 
}

ellipse(width/2, height/2, n, n);

}
}
