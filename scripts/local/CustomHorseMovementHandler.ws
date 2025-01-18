@addField(Exploration) public saved var neetToRumble: bool;
@wrapMethod(Exploration) function UpdateLogic(dt: float) {
	if (BRS_RumbleOnHorseFatique()){
		if((!useSimpleStaminaManagement && destSpeed > GALLOP_SPEED) || 
	   	   //(!IsSpeedLocked() && destSpeed > MIN_SPEED && !rl && !fb) || 
	       (!IsSpeedLocked() && destSpeed > TROT_SPEED)) {

			// vibrate when the horse slow down
			if( maintainSpeedTimer > speedTimeoutValue && neetToRumble) {
                theGame.VibrateControllerLight(0.2f);
				neetToRumble = false;
			}
		} else {

			neetToRumble = true;
		}
	}

	wrappedMethod(dt);
}