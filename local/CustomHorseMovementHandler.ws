@wrapMethod(Exploration) function UpdateLogic(dt: float) {
	if (BRS_RumbleOnHorseFatique()){
		if((!useSimpleStaminaManagement && destSpeed > GALLOP_SPEED ) || 
	   	   (!IsSpeedLocked() && destSpeed > MIN_SPEED && !rl && !fb ) || 
	       (!IsSpeedLocked() && destSpeed > TROT_SPEED ) ) {

			// vibrate when the horse loses all its stamina
			if( maintainSpeedTimer > speedTimeoutValue ) {
                theGame.VibrateControllerLight(0.2f);
			}
		}
	}

	wrappedMethod(dt);
}