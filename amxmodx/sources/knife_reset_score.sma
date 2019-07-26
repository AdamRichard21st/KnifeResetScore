#include < amxmodx >
#include < cstrike >
#include < fun >

// whenever it should display the reset score message on chat (true|false)
#define CHAT_SUPPORT true

// whenever it should display the reset score message on hud (true|false)
#define HUD_SUPPORT true

// hud settings if enabled
#if HUD_SUPPORT
    #define COLOR(%0) clamp(HUD_%0, 0, 255)

    #define HUD_R       255     // Red component of hudmessage color
    #define HUD_G       255     // Green component of hudmessage color
    #define HUD_B       255     // Blue component of hudmessage color
    #define HUD_X       -1.0    // Location of the message on the x axis in percent (-1.0 means center)
    #define HUD_Y       -1.0    // Location of the message on the y axis in percent (-1.0 means center)
    #define HUD_EFFECT  0       // Display effect
    #define HUD_FXTIME  6.0     // Duration of the effect
    #define HUD_TIME    3.0     // Time the message stays on screen
    #define HUD_FADEIN  0.1     // Time it takes the message to fully appear (fade-in)
    #define HUD_FADEOUT 0.2     // Time it takes the message to fully disappear (fade-out)
    #define HUD_CHANNEL 4       // Channel to use on the client
#endif

public plugin_init()
{
    register_plugin( "Knife Reset Score", "1.0.0", "AdamRichard21st" );
    register_dictionary( "knife_reset_score.txt" );

    register_event( "DeathMsg", "DeathMsg_knife", "a", "1!0", "4=knife" );
}

public DeathMsg_knife()
{
    new killer = read_data( 1 );
    new victim = read_data( 2 );

    if ( killer != victim && is_user_connected( killer ) && is_user_connected( victim ) )
    {
        #if CHAT_SUPPORT || HUD_SUPPORT
            new killerName[ 32 ];
            new victimName[ 32 ];

            get_user_name( killer, killerName, charsmax( killerName ) );
            get_user_name( victim, victimName, charsmax( victimName ) );

            #if CHAT_SUPPORT
                client_print_color( 0, killer, "%L", LANG_PLAYER, "KNIFE_RESET_SCORE", killerName, victimName );
            #endif

            #if HUD_SUPPORT
                set_hudmessage( COLOR(R), COLOR(G), COLOR(B), HUD_X, HUD_Y, HUD_EFFECT, HUD_FXTIME, HUD_TIME, HUD_FADEIN, HUD_FADEOUT, HUD_CHANNEL );
                show_hudmessage( 0, "%L", LANG_PLAYER, "KNIFE_RESET_SCORE", killerName, victimName );
            #endif
        #endif

        set_task( 0.5, "ResetVictimScore", victim );
    }
}

public ResetVictimScore( victim )
{
    if ( is_user_connected( victim ) )
    {
        cs_set_user_deaths( victim, 0, .scoreboard = true );
        set_user_frags( victim, 0 );
    }
}