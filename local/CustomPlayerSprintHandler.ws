@wrapMethod(CPlayer) function SetIsSprinting(flag: bool) {
    // Vibrate when the Geralt start running
    if (BRS_RumbleOnRunAction() && flag && !isSprinting) {
        theGame.VibrateControllerHard(0.2f);
    }
    
    wrappedMethod(flag);
}

@wrapMethod(CPlayer) function SprintingTimer(dt : float, id : int) {
    wrappedMethod(dt, id);

    // Vibrate light when player is on fatique status
    if (BRS_RumbleOnFatique() && ShouldDrainStaminaWhileSprinting() && GetStaminaPercents() <= 0) {
        theGame.VibrateControllerLight(0.2f);
    }
}