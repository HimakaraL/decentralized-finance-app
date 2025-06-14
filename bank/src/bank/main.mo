import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;

  let id = 12312313132;

  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));

  Debug.print(debug_show(id));

  public func topUp(vall: Float){
    currentValue += vall;
    Debug.print(debug_show(currentValue));
  };
  
  public func withDraw(withdrawAmount: Float){
    let tempValue: Float = currentValue - withdrawAmount;
    if (tempValue >= 0){
      currentValue -= withdrawAmount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Not enough bank balance!");
    };
  };

  public query func chackBalance(): async Float {
    return currentValue
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsed = currentTime - startTime;
    let timeElasedinNS = timeElapsed / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElasedinNS));
    startTime := currentTime;
  }
}