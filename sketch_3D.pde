int numSmallSpheres = 100; 
float sphereRadius = 100; 
float smallSphereRadius = 20; 
boolean isRotating = true; 
PVector[] smallSpheresPositions = new PVector[numSmallSpheres];
boolean saveNextFrame = false; 
int snapshotsTaken = 0; 

void setup() {
  size(800, 600, P3D); 
  for (int i = 0; i < numSmallSpheres; i++) {
    float x = random(-width / 2, width / 2);
    float y = random(-height / 2, height / 2);
    float z = random(-200, 200);
    smallSpheresPositions[i] = new PVector(x, y, z); 
  }
}

void draw() {
  background(200, 230, 255); 
  lights(); 
  translate(width / 2, height / 2);
  if (isRotating) {
    rotateY(frameCount * 0.01); 
  }

  
  fill(173, 216, 230); 
  sphere(sphereRadius); 


  for (int i = 0; i < numSmallSpheres; i++) {
    pushMatrix();
    translate(smallSpheresPositions[i].x, smallSpheresPositions[i].y, smallSpheresPositions[i].z);
    fill(random(200, 255), random(200, 255), random(200, 255));
    sphere(smallSphereRadius); 
    popMatrix();
  }

  
  if (saveNextFrame && snapshotsTaken < 9) {
    saveFrame("snapshot-######.png");
    snapshotsTaken++;
    saveNextFrame = false; 
  }
}

void mousePressed() {
  if (snapshotsTaken < 9) {
    saveNextFrame = true; 
  }
}
