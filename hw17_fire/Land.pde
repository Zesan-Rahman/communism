class Land {

  //instance variables
  int x;
  int y;
  int size;
  int state;
  int nextState;

  //constructors
  Land(int _x, int _y, int sze, int ste) {
    x=_x;
    y=_y;
    size=sze;
    state=ste;
  }

  void display () {
    if (state==DIRT) {
      fill(106, 79, 26);
    }
    if (state==FIRE) {
      fill(250, 35, 35);
    }
    if (state==BURNT) {
      fill(200, 25, 25);
    }
    if (state==TREE) {
      fill(5,85,15);
    }
    square(x, y, size);
  }

  void changeState(int neighborState) {
    if (nextState == TREE && neighborState == FIRE) {
      nextState=FIRE;
      plots[0][0].state=BURNT;
    }
    
    else if (state == FIRE) {
      nextState = BURNT;
    }
    else{
      nextState=state;
    }
    
  }
  
  void updateState(){
    state=nextState;
  }
}
