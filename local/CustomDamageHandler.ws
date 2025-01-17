@wrapMethod(W3DamageManagerProcessor) function ProcessAction(act: W3DamageAction) {
    var currentAttack: name;

    wrappedMethod(act);
    currentAttack = ((W3Action_Attack) act).GetAttackName();

    // vibrate when Garalt take and get damage
    if (act.IsActionMelee() && action.DealsAnyDamage()) {
        if (playerAttacker) {
            if (BRS_RumbleOnGeraldAttack()) {
                if (thePlayer.IsHeavyAttack(currentAttack) || 
                    thePlayer.IsSuperHeavyAttack(currentAttack)) {
                    theGame.VibrateControllerHard();
                } else if (thePlayer.IsLightAttack(currentAttack)) {
                    theGame.VibrateControllerLight();
                }
            }
        } else {
            if (BRS_RumbleOnEnemyAttack()){
                if (actorAttacker.IsHeavyAttack(currentAttack)) {
                    theGame.VibrateControllerHard(0.2f);
                } else if (actorAttacker.IsSuperHeavyAttack(currentAttack)) {
                    theGame.VibrateControllerVeryHard(0.3f);
                }
            }
        }
    }
}