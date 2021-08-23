class Recipe {
  
  int needResTypes = 4;
  int[] resId = new int[needResTypes];
  int[] neededCount = new int[needResTypes];  
  int producedObjectId;
  
  public Recipe(int needResTypes, int[] resId, int[] neededCount, int producedObjectId) {
   this.needResTypes = needResTypes;
   this.resId = resId;
   this.neededCount = neededCount;
   this.producedObjectId = producedObjectId;
  }
  
}
