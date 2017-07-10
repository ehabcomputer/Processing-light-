import processing.serial.*;

PImage img;  
Serial myPort;

void setup() {
  
  //set these to the size of the image
  size(620,388);
  
  //this is the name of your image file saved in the data folder in your
  //processing folder see processing.org for help
  
  img = loadImage("color.jpg");
  
  //the [0] may be [another number] on your computer
  myPort = new Serial(this, Serial.list()[0], 9600);
  
}

void draw() {
  background(0);
  image(img,0,0);
  img.loadPixels();
  myPort.write("CL");
 myPort.write(int(red(img.pixels[pmouseX+pmouseY*img.width])));
 myPort.write(int(green(img.pixels[pmouseX+pmouseY*img.width]))); 
 myPort.write(int(blue(img.pixels[pmouseX+pmouseY*img.width]))); 
 fill(img.pixels[pmouseX+pmouseY*img.width]);
 color c = get(mouseX, mouseY);
text("Red: " + red(c),10,20);
text("Green: " + green(c),10,40);
text("Blue: " + blue(c),10,60);
}

