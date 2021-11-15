int DIRT = 0;
int FIRE = 1;
int BURNT = 2;
int TREE = 3;

boolean run = true;
Land plots[][];

void setup() {
  size(500, 300);
  frameRate(5);
  setupLand(10, 20, 75);
  showLand();
}

void draw() {

  if (run) {
    showLand();
    liveFire();
  }
}
void showLand() {
  for (int i = 0; i < plots.length; i++) {
    for (int p = 0; p < plots[0].length; p++) {
      plots[i][p].display();
    }
  }
}

void liveFire() {
  for (int i = 0; i < plots.length; i++) {
    for (int p = 1; p < plots[0].length; p++) {
      plots[i][p].changeState(plots[i][p-1].state);
    }
    for (int p = 1; p < plots.length; p++) {
      plots[i][p].updateState();
    }
  }
}

void setupLand(int numRows, int numPlots, float fertility) {
  int plotSize = width / numPlots;
  plots = new Land [numRows][numPlots];
  int type;
  for (int i = 0; i < plots.length; i++) {
    for (int p =  0; p < numPlots; p++) {
      type = DIRT;
      if (int(random(100)) < fertility) {
        type = TREE;
      }
      plots[i][p] = new Land(p*plotSize, 0, plotSize, type);
    }
    plots[0][0].state = FIRE;
  }
}

void keyPressed() {
  run = !run;
}
