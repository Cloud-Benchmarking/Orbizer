controlSlider s_map;
controlSlider s_gray;

void setupFlat() {
  int xOffset = 50;
  int vOffset = 337;
  int vGap = 70;
  int sWidth = int(0.3*(width - height));
  
  s_map = new controlSlider();
  s_map.name = "Map File Index";
  //s_map.keyPlus = 'w';
  //s_map.keyMinus = 'q';
  s_map.xpos = xOffset;
  s_map.ypos = vOffset;
  s_map.len = sWidth;
  s_map.valMin = 0;
  s_map.valMax = mapFile.length-1;
  s_map.value  = mapFile.length-1;
  
  vOffset += vGap;
  s_gray = new controlSlider();
  s_gray.name = "GrayScale";
  //s_gray.keyPlus = 's';
  //s_gray.keyMinus = 'a';
  s_gray.xpos = xOffset;
  s_gray.ypos = vOffset;
  s_gray.len = 35;
  s_gray.valMin = 0;
  s_gray.valMax = 1;
  s_gray.value = 0;
}

void displayFlat() {
  
  if (s_map.value != mapIndex || int(s_gray.value) != grayMap) {
    mapIndex = int(s_map.value);
    grayMap  = int(s_gray.value);
    loadMap(mapFile[mapIndex], grayMap);
    map.resize(canvas.width, canvas.height);
  }
  
  image(canvas, 0, 0, width, height);
  
  if (!hide) {
  
    String frameRt = "";
    if (showFrameRate) frameRt = "\n\nFramerate: " + frameRate;
  
    fill(255); textAlign(LEFT, TOP);
    
    text("Press ' m ' to toggle display Mode\n" +
         "Press ' f ' to show or hide framerate\n" +
         "Press ' a ' to show or hide agents\n" +
         "Press ' t ' to save configuration\n" +
         "Press ' y ' to load last saved configuration\n" +
         "Press ' h ' to hide controls" +
         "\nFlightTime " + ftime +
         frameRt, 37, 110);
         
     s_map.listen();
     s_map.drawMe();
     
     s_gray.listen();
     s_gray.drawMe();
  }
}

void defaultFlat() {
  
}