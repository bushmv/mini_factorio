enum AssemblerState {
  WAITING_FOR_RESOURCES,
  PRODUCING,
  FULLED
}

class Assembler implements CheckBeforeInsertable, Removable {
  
  int posX;
  int posY;
  
  private Recipe recipe;
  private int producedResId;
  
  int hasProducedRes;
  int producedResCountLimit;
  
  private AssemblerState state;
  int timeToProduce;
  int producingProgress;
  
  int[] hasResCount;
  int[] limitResCount;
  
  DrawableAssembler drawable;
  
  public Assembler(int posX, int posY, Recipe recipe, int producedResCountLimit, int timeToProduce, DrawableAssembler drawable) {
    this.posX = posX;
    this.posY = posY;
    this.recipe = recipe;
    this.state = AssemblerState.WAITING_FOR_RESOURCES;
    this.producedResCountLimit = producedResCountLimit;
    this.timeToProduce = timeToProduce;
    this.hasProducedRes = 0;
    this.producingProgress = timeToProduce;
    this.hasResCount = new int[recipe.needResTypes];
    this.limitResCount = new int[recipe.needResTypes];
    for (int i = 0; i < recipe.needResTypes; i++) {
      this.limitResCount[i] = recipe.neededCount[i] * 2;
    }
    this.producedResId = recipe.producedObjectId;
    this.drawable = drawable;
    
  }
  
  boolean canProduce() {
    if (hasProducedRes >= producedResCountLimit) return false;
    for(int i = 0; i < recipe.needResTypes; i++) {
      if (hasResCount[i] < recipe.neededCount[i]) return false;
    }
    return true;
  }
  
  private void produce() {
    for(int i = 0; i < recipe.needResTypes; i++) {
      hasResCount[i] -= recipe.neededCount[i];
    }
    hasProducedRes++;
  }
  
  boolean canInsert() { throw new RuntimeException("Call canInsertRes(int res) instead of just canInsert"); }
  
  void insert(int resId) {
    for(int i = 0; i < recipe.needResTypes; i++) {
      if (recipe.resId[i] == resId) {
        hasResCount[i]++;
        break;
      }
    }
  }
  
  boolean canInsertRes(int resId) {
    if (state == AssemblerState.FULLED) return false;
    for(int i = 0; i < recipe.needResTypes; i++) {
      if (recipe.resId[i] == resId) {
         if(hasResCount[i] < limitResCount[i]) return true;
      }
    }
    return false;
  }
  
  void update() {
   switch(state) {
     case WAITING_FOR_RESOURCES:
       if (canProduce()) state = AssemblerState.PRODUCING;
       break;
     case PRODUCING:
       if (producingProgress == 0) {
         produce();
         producingProgress = timeToProduce;
         if (hasProducedRes < producedResCountLimit) state = AssemblerState.WAITING_FOR_RESOURCES;
         else state = AssemblerState.FULLED;
       } else { producingProgress--; }
       break;
     case FULLED:
       if (hasProducedRes < producedResCountLimit) state = AssemblerState.WAITING_FOR_RESOURCES;
   }
  }
  
  void draw() {
   
   if (state == AssemblerState.PRODUCING) drawable.drawAsmProducing(posX, posY, producingProgress);
   else drawable.drawAsm(posX, posY);
  }
  
  boolean canRemove() { return hasProducedRes > 0; }
  int remove() { hasProducedRes--; return producedResId; }
  
}
