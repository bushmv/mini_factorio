class Test implements Instance {
 
  public void run() {
    noLoop();
    // unit tests for DirectTransporterPart
    println(" --- unit tests for DirectTransporterPart --- \n");
    itemsShouldMoveFromEndToStart();
    emptyTransporterPartShouldRemainEmpty();
    fulledPartShouldRemainFulled();
    halfFulledTransporterPartShouldMoveItems();
    transporterPartShouldMoveItemsToNextTransporterPart();
    onlyLeftFulledTransporterPartShouldMoveItems();
    onlyRightFulledTransporterPartShouldMoveItems();
  }
  
  
  
  
  
  private void itemsShouldMoveFromEndToStart() {
   TransporterPart tp = new TestDirectTransporterPart(null, -2147450880, (byte) 1); 
   tp.leftRes = 16777216; tp.rightRes = 16777216;
   
   for (int i = 0; i < 8 * 3; i++) { // any value * (8 * 3)
       tp.update();
   }
   
   if (tp.state != 524296) throw new RuntimeException("test \"itemsShouldMoveFromEndToStart\" failed, tp.state = " + tp.state + ", but must be 524296");
   else if (tp.leftRes != 1) throw new RuntimeException("test \"itemsShouldMoveFromEndToStart\" failed, tp.leftRes = " + tp.leftRes + ", but must be 1");
   else if (tp.rightRes != 1) throw new RuntimeException("test \"itemsShouldMoveFromEndToStart\" failed, tp.rightRes = " + tp.rightRes + ", but must be 1");
   else System.out.println(" + test \"itemsShouldMoveFromEndToStart\" successfull passed");
  }
  
  private void emptyTransporterPartShouldRemainEmpty() {
    TransporterPart tp = new TestDirectTransporterPart(null, 0, (byte) 1); 
    
    for (int i = 0; i < 8 * 3; i++) { // any value * (8 * 3)
       tp.update();
    }
    
    if (tp.state != 0) throw new RuntimeException("test \"emptyTransporterPartShouldRemainEmpty\" failed, tp.state = " + tp.state + ", but must be 0");
    else if (tp.leftRes != 0) throw new RuntimeException("test \"emptyTransporterPartShouldRemainEmpty\" failed, tp.leftRes = " + tp.leftRes + ", but must be 0");
    else if (tp.rightRes != 0) throw new RuntimeException("test \"emptyTransporterPartShouldRemainEmpty\" failed, tp.rightRes = " + tp.rightRes + ", but must be 0");
    else System.out.println(" + test \"emptyTransporterPartShouldRemainEmpty\" successfull passed");
  }
  
  private void fulledPartShouldRemainFulled() {
    TransporterPart tp = new TestDirectTransporterPart(null, -2004318072, (byte) 1);
    tp.leftRes = 16843009; tp.rightRes = 16843009;
    
    for (int i = 0; i < 8 * 3; i++) { // any value * (8 * 3)
       tp.update();
    }
    
    if (tp.state != -2004318072) throw new RuntimeException("test \"fulledPartShouldRemainFulled\" failed, tp.state = " + tp.state + ", but must be -2004318079");
    else if (tp.leftRes != 16843009) throw new RuntimeException("test \"fulledPartShouldRemainFulled\" failed, tp.leftRes = " + tp.leftRes + ", but must be 16843009");
    else if (tp.rightRes != 16843009) throw new RuntimeException("test \"fulledPartShouldRemainFulled\" failed, tp.rightRes = " + tp.rightRes + ", but must be 16843009");
    else System.out.println(" + test \"fulledPartShouldRemainFulled\" successfull passed");
  }
  
  private void halfFulledTransporterPartShouldMoveItems() {
    TransporterPart tp = new TestDirectTransporterPart(null, -2013231104, (byte) 1);
    tp.leftRes = 16842752; tp.rightRes = 16842752;
    
    for (int i = 0; i < 8 * 3; i++) { // any value * (8 * 3)
       tp.update();
    }
    
    if (tp.state != 8913032) throw new RuntimeException("test \"halfFulledTransporterPartShouldMoveItems\" failed, tp.state = " + tp.state + ", but must be 8913032");
    else if (tp.leftRes != 257) throw new RuntimeException("test \"halfFulledTransporterPartShouldMoveItems\" failed, tp.leftRes = " + tp.leftRes + ", but must be 257");
    else if (tp.rightRes != 257) throw new RuntimeException("test \"halfFulledTransporterPartShouldMoveItems\" failed, tp.rightRes = " + tp.rightRes + ", but must be 257");
    else System.out.println(" + test \"halfFulledTransporterPartShouldMoveItems\" successfull passed");
  }
  
  private void transporterPartShouldMoveItemsToNextTransporterPart() {
    TransporterPart first = new TestDirectTransporterPart(null, 134250496, (byte) 1);
    first.leftRes = 16777216; first.rightRes = 131072;
    TransporterPart second = new TestDirectTransporterPart(first, -2147481600, (byte) 1);
    second.leftRes = 196608; second.rightRes = 67108864;
    
    for (int i = 0; i < 8 * 3 * 2; i++) { // any value * (8 * 3 * 2)
       second.redraw();
    }

    if (second.state != 8913032) throw new RuntimeException("test \"transporterPartShouldMoveItemsToNextTransporterPart\" failed, second.state = " + second.state + ", but must be 8913032");
    else if (first.state != 0) throw new RuntimeException("test \"transporterPartShouldMoveItemsToNextTransporterPart\" failed, first.state = " + first.state + ", but must be 0");
    else if (second.leftRes != 259) throw new RuntimeException("test \"transporterPartShouldMoveItemsToNextTransporterPart\" failed, second.leftRes = " + second.leftRes + ", but must be 259");
    else if (second.rightRes != 516) throw new RuntimeException("test \"transporterPartShouldMoveItemsToNextTransporterPart\" failed, second.rightRes = " + second.rightRes + ", but must be 516");
    else if (first.leftRes != 0) throw new RuntimeException("test \"transporterPartShouldMoveItemsToNextTransporterPart\" failed, first.leftRes = " + first.leftRes + ", but must be 0");
    else if (first.rightRes != 0) throw new RuntimeException("test \"transporterPartShouldMoveItemsToNextTransporterPart\" failed, first.rightRes = " + first.rightRes + ", but must be 0");
    else System.out.println(" + test \"transporterPartShouldMoveItemsToNextTransporterPart\" successfull passed");
    
  }
  
  private void onlyLeftFulledTransporterPartShouldMoveItems() {
    TransporterPart first = new TestDirectTransporterPart(null, 34952, (byte) 1);
    first.leftRes = 16909060; first.rightRes = 0;
    TransporterPart second = new TestDirectTransporterPart(first, 0, (byte) 1);
    second.leftRes = 0; second.rightRes = 0;
    
    for (int i = 0; i < 8 * 3 * 2; i++) { // any value * (8 * 3 * 2)
       second.redraw();
    }
    
    if (second.state != 34952) throw new RuntimeException("test \"onlyLeftFulledTransporterPartShouldMoveItems\" failed, second.state = " + second.state + ", but must be 34952");
    else if (first.state != 0) throw new RuntimeException("test \"onlyLeftFulledTransporterPartShouldMoveItems\" failed, first.state = " + first.state + ", but must be 0");
    else if (second.leftRes != 16909060) throw new RuntimeException("test \"onlyLeftFulledTransporterPartShouldMoveItems\" failed, second.leftRes = " + second.leftRes + ", but must be 16909060");
    else if (second.rightRes != 0) throw new RuntimeException("test \"onlyLeftFulledTransporterPartShouldMoveItems\" failed, second.rightRes = " + second.rightRes + ", but must be 0");
    else if (first.leftRes != 0) throw new RuntimeException("test \"onlyLeftFulledTransporterPartShouldMoveItems\" failed, first.leftRes = " + first.leftRes + ", but must be 0");
    else if (first.rightRes != 0) throw new RuntimeException("test \"onlyLeftFulledTransporterPartShouldMoveItems\" failed, first.rightRes = " + first.rightRes + ", but must be 0");
    else System.out.println(" + test \"onlyLeftFulledTransporterPartShouldMoveItems\" successfull passed");
  }
  
  private void onlyRightFulledTransporterPartShouldMoveItems() {
    TransporterPart first = new TestDirectTransporterPart(null, -2004353024, (byte) 1);
    first.leftRes = 0; first.rightRes = 16909060;
    TransporterPart second = new TestDirectTransporterPart(first, 0, (byte) 1);
    second.leftRes = 0; second.rightRes = 0;
    
    for (int i = 0; i < 8 * 3 * 2; i++) { // any value * (8 * 3 * 2)
       second.redraw();
    }
    
    if (second.state != -2004353024) throw new RuntimeException("test \"onlyLeftFulledTransporterPartShouldMoveItems\" failed, second.state = " + second.state + ", but must be -2004353024");
    else if (first.state != 0) throw new RuntimeException("test \"onlyLeftFulledTransporterPartShouldMoveItems\" failed, first.state = " + first.state + ", but must be 0");
    else if (second.leftRes != 0) throw new RuntimeException("test \"onlyLeftFulledTransporterPartShouldMoveItems\" failed, second.leftRes = " + second.leftRes + ", but must be 0");
    else if (second.rightRes != 16909060) throw new RuntimeException("test \"onlyLeftFulledTransporterPartShouldMoveItems\" failed, second.rightRes = " + second.rightRes + ", but must be 16909060");
    else if (first.leftRes != 0) throw new RuntimeException("test \"onlyLeftFulledTransporterPartShouldMoveItems\" failed, first.leftRes = " + first.leftRes + ", but must be 0");
    else if (first.rightRes != 0) throw new RuntimeException("test \"onlyLeftFulledTransporterPartShouldMoveItems\" failed, first.rightRes = " + first.rightRes + ", but must be 0");
    else System.out.println(" + test \"onlyLeftFulledTransporterPartShouldMoveItems\" successfull passed");
  }
  
  
  
}

class TestDirectTransporterPart extends DirectTransporterPart {
  
  public TestDirectTransporterPart(TransporterPart previous, int state, byte speed) {
    super(0, 0, previous, state, speed, null); 
  }
  
  // empty, don't need draw when test
  public void draw() {}
  
}
