@wrapMethod(CR4Game) function PopulateMenuQueueMainAlways( out menus : array< name > ){
	wrappedMethod(menus);
	BRS_Initialize();
}

function BRS_Init(): bool { return theGame.GetInGameConfigWrapper().GetVarValue('BetterRumbleSupport_Main', 'BRS_Init'); }
function BRS_IsEnabled(): bool { return BRS_Init() && theGame.GetInGameConfigWrapper().GetVarValue('BetterRumbleSupport_Main', 'BRS_IsEnabled'); }
function BRS_RumbleOnGeraltAttack(): bool { return BRS_IsEnabled() && theGame.GetInGameConfigWrapper().GetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnGeraltAttack'); }
function BRS_RumbleOnEnemyAttack(): bool { return BRS_IsEnabled() && theGame.GetInGameConfigWrapper().GetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnEnemyAttack'); }
function BRS_RumbleOnRunAction(): bool { return BRS_IsEnabled() && theGame.GetInGameConfigWrapper().GetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnRunAction'); }
function BRS_RumbleOnFatique(): bool { return BRS_IsEnabled() && theGame.GetInGameConfigWrapper().GetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnFatique'); }
function BRS_RumbleOnHorseFatique(): bool { return BRS_IsEnabled() && theGame.GetInGameConfigWrapper().GetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnHorseFatique'); }
function BRS_RumbleOnLowHealth(): bool { return BRS_IsEnabled() && theGame.GetInGameConfigWrapper().GetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnLowHealth'); } 
function BRS_GetRumbleOnLowHelthDelay(): int { return StringToInt(theGame.GetInGameConfigWrapper().GetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnLowHealthDelay')); }
function BRS_IsDebugOptionsEnabled(): bool { return theGame.GetInGameConfigWrapper().GetVarValue('BetterRumbleSupport_Main', 'BRS_DebugOptionsEnabled'); }
function BRS_IsAdvancedOptionsEnabled(): bool { return theGame.GetInGameConfigWrapper().GetVarValue('BetterRumbleSupport_Main', 'BRS_AdvancedOptionsEnabled'); }

// Initialize the menu options values
function BRS_Initialize() {
	var config: CInGameConfigWrapper;
	var menuBase: CR4MenuBase;
	var ingameMenu: CR4IngameMenu;

	config = theGame.GetInGameConfigWrapper();
	menuBase = (CR4MenuBase)(theGame.GetGuiManager().GetRootMenu());
	ingameMenu = (CR4IngameMenu)(menuBase.GetSubMenu());

	if (!BRS_Init()) {
		config.SetVarValue('BetterRumbleSupport_Main', 'BRS_Init', true);
		config.SetVarValue('BetterRumbleSupport_Main', 'BRS_IsEnabled', true);
		config.SetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnGeraltAttack', true);
		config.SetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnEnemyAttack', true);
		config.SetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnRunAction', true);
		config.SetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnFatique', true);
		config.SetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnHorseFatique', true);
		config.SetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnLowHealth', true);
		config.SetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnLowHealthDelay', 200);
	}

	// Check if debug options need to be enabled
	if (BRS_IsDebugOptionsEnabled()) {
		config.ActivateScriptTag('BRS_Debug');
	}
	
	// TODO: when more options will be available, I'll store them under BRS_Advanced tag
	if (BRS_IsAdvancedOptionsEnabled()) {
		config.ActivateScriptTag('BRS_Advanced');
	}
}

