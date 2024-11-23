using StardewModdingAPI;

namespace FishPondering;

internal sealed class ModConfig
{
    public int PondSize { get; set; } = 4;

    /// <summary>Restore default config values</summary>
    private void Reset()
    {
        PondSize = 4;
    }

    /// <summary>Add mod config to GMCM if available</summary>
    /// <param name="helper"></param>
    /// <param name="mod"></param>
    public void Register(IModHelper helper, IManifest mod)
    {
        Integration.IGenericModConfigMenuApi? GMCM = helper.ModRegistry.GetApi<Integration.IGenericModConfigMenuApi>(
            "spacechase0.GenericModConfigMenu"
        );
        if (GMCM == null)
        {
            helper.WriteConfig(this);
            return;
        }
        GMCM.Register(
            mod: mod,
            reset: () =>
            {
                Reset();
                helper.WriteConfig(this);
            },
            save: () =>
            {
                helper.WriteConfig(this);
            },
            titleScreenOnly: false
        );
        GMCM.AddNumberOption(
            mod: mod,
            getValue: () => PondSize,
            setValue: (value) =>
            {
                PondSize = value;
                helper.GameContent.InvalidateCache("Data/Buildings");
            },
            name: I18n.Config_PondSize_Name,
            tooltip: I18n.Config_PondSize_Description,
            min: 3,
            max: 4,
            interval: 1
        );
    }
}
