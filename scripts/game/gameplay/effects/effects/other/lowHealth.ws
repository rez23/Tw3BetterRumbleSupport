/***********************************************************************/
/** 	© 2015 CD PROJEKT S.A. All rights reserved.
/** 	THE WITCHER® is a trademark of CD PROJEKT S. A.
/** 	The Witcher game is based on the prose of Andrzej Sapkowski.
/***********************************************************************/




class W3Effect_LowHealth extends CBaseGameplayEffect
{
	default effectType = EET_LowHealth;
	default isPositive = false;
	default isNeutral = true;
	default isNegative = false;

	saved var rumbleDelay: int;

	function OnLoad(t: CActor, eff: W3EffectManager) {
		rumbleDelay = BRS_GetRumbleOnLowHelthDelay();
		super.OnLoad(t, eff);
	}

	event OnUpdate(dt: float) {
		super.OnUpdate(dt);
		
		// Rumble controller any certains delay
		if (BRS_RumbleOnLowHealth() && rumbleDelay <= 0) {
			rumbleDelay = BRS_GetRumbleOnLowHelthDelay();
			theGame.VibrateControllerVeryLight(0.4f);	
		}

		// rumble every rumbleEffectDelay ticks
		if (dt >= 0.009f) { 
			rumbleDelay -= 1;
		}
	}
}
