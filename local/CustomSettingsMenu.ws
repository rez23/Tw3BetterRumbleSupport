@wrapMethod(CR4Game) function PopulateMenuQueueMainAlways( out menus : array< name > ){
	wrappedMethod(menus);
	BRS_Initialize();
}

function BRS_Init(): bool { return theGame.GetInGameConfigWrapper().GetVarValue('BetterRumbleSupport_Main', 'BRS_Init'); }
function BRS_IsEnabled(): bool { return BRS_Init() && theGame.GetInGameConfigWrapper().GetVarValue('BetterRumbleSupport_Main', 'BRS_IsEnabled'); }
function BRS_RumbleOnGeraldAttack(): bool { return BRS_IsEnabled() && theGame.GetInGameConfigWrapper().GetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnGeraldAttack'); }
function BRS_RumbleOnEnemyAttack(): bool { return BRS_IsEnabled() && theGame.GetInGameConfigWrapper().GetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnEnemyAttack'); }
function BRS_RumbleOnRunAction(): bool { return BRS_IsEnabled() && theGame.GetInGameConfigWrapper().GetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnRunAction'); }
function BRS_RumbleOnFatique(): bool { return BRS_IsEnabled() && theGame.GetInGameConfigWrapper().GetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnFatique'); }
function BRS_RumbleOnHorseFatique(): bool { return BRS_IsEnabled() && theGame.GetInGameConfigWrapper().GetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnHorseFatique'); }

// Initialize the menu
function BRS_Initialize() {
	var config: CInGameConfigWrapper;
	config = theGame.GetInGameConfigWrapper();

	if (!BRS_Init()) {
		config.SetVarValue('BetterRumbleSupport_Main', 'BRS_Init', true);
		config.SetVarValue('BetterRumbleSupport_Main', 'BRS_IsEnabled', true);
		config.SetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnGeraltAttack', true);
		config.SetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnEnemyAttack', true);
		config.SetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnRunAction', true);
		config.SetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnFatique', true);
		config.SetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnHorseFatique', true);
		config.SetVarValue('BetterRumbleSupport_Main', 'BRS_RumbleOnGeraldAttack', true);
	}
}

