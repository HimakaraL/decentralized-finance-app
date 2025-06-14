import Debug "mo:base/Debug";

actor DBank {
  var currentValue = 300;
  currentValue := 100;

  let id = 12312313132;

  Debug.print(debug_show(id));

  public func topUp(vall: Nat){
    currentValue += vall;
    Debug.print(debug_show(currentValue));
  };
  
  public func withDraw(withdrawAmount: Nat){
    currentValue -= withdrawAmount;
    Debug.print(debug_show(currentValue));
  };
}