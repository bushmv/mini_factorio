// remove first items(or left then right, or right then left) 
class RemovableFirstItemsLeftFirst implements Removable {
   
   TransporterPart tp;
  
   public RemovableFirstItemsLeftFirst(TransporterPart tp) {
     this.tp = tp;
   }
   
   public boolean canRemove() { 
     return tp.hasLeftFirstItem() || tp.hasRightFirstItem(); 
   }
   
   public int remove() { 
     if (tp.hasLeftFirstItem()) {
       int res = tp.firstLeftRes();
       tp.removeFirstLeftItem();
       tp.removeFirstLeftRes();
       return res;
     } else if (tp.hasRightFirstItem()) {
       int res = tp.firstRightRes();
       tp.removeFirstRightItem();
       tp.removeFirstRightRes();
       return res;
     }
     throw new RuntimeException("Cann't remove items cause neither hasLeftFirstItem neither hasRightFirstItem is true");
   }
  
}

class RemovableFirstItemsRightFirst implements Removable {
   
   TransporterPart tp;
  
   public RemovableFirstItemsRightFirst(TransporterPart tp) {
     this.tp = tp;
   }
   
   public boolean canRemove() { 
     return tp.hasLeftFirstItem() || tp.hasRightFirstItem(); 
   }
   
   public int remove() { 
     if (tp.hasRightFirstItem()) {
       int res = tp.firstRightRes();
       tp.removeFirstRightItem();
       tp.removeFirstRightRes();
       return res;
     } else if (tp.hasLeftFirstItem()) {
       int res = tp.firstLeftRes();
       tp.removeFirstLeftItem();
       tp.removeFirstLeftRes();
       return res;
     } 
     throw new RuntimeException("Cann't peek items cause neither hasLeftFirstItem neither hasRightFirstItem is true");
   }
  
}

 
