using System.Reflection.Emit;
using HarmonyLib;
using Microsoft.Xna.Framework;
using Netcode;
using StardewModdingAPI;
using StardewValley;
using StardewValley.Buildings;
using StardewValley.GameData.Buildings;

namespace FishPondering;

/// <summary>
/// Make fish pond draws properly respect BuildingData.Size
/// </summary>
internal static class GamePatches
{
    internal static void Patch(string modId)
    {
        try
        {
            Harmony harmony = new(modId);
            // draw and position patches
            harmony.Patch(
                original: AccessTools.Method(typeof(FishPond), nameof(FishPond.draw)),
                transpiler: new HarmonyMethod(typeof(GamePatches), nameof(FishPond_draw_Transpiler))
            );
            harmony.Patch(
                original: AccessTools.Method(typeof(FishPond), nameof(FishPond.drawInMenu)),
                transpiler: new HarmonyMethod(
                    typeof(GamePatches),
                    nameof(FishPond_drawInMenu_Transpiler)
                )
            );
            harmony.Patch(
                original: AccessTools.Method(
                    typeof(FishPond),
                    nameof(FishPond.getSourceRectForMenu)
                ),
                postfix: new HarmonyMethod(
                    typeof(GamePatches),
                    nameof(FishPond_getSourceRectForMenu_Postfix)
                )
            );
            harmony.Patch(
                original: AccessTools.Method(typeof(FishPond), nameof(FishPond.GetItemBucketTile)),
                postfix: new HarmonyMethod(
                    typeof(GamePatches),
                    nameof(FishPond_GetItemBucketTile_Postfix)
                )
            );
            harmony.Patch(
                original: AccessTools.Method(typeof(FishPond), nameof(FishPond.GetRequestTile)),
                postfix: new HarmonyMethod(
                    typeof(GamePatches),
                    nameof(FishPond_GetCenterTile_Postfix)
                )
            );
            harmony.Patch(
                original: AccessTools.Method(typeof(FishPond), nameof(FishPond.GetCenterTile)),
                postfix: new HarmonyMethod(
                    typeof(GamePatches),
                    nameof(FishPond_GetCenterTile_Postfix)
                )
            );
        }
        catch (Exception err)
        {
            ModEntry.Log($"Failed to patch FishPondering:\n{err}", LogLevel.Error);
        }
    }

    private static Vector2 GetPondOrigin(BuildingData data)
    {
        return new Vector2(0, data.Size.Y * Game1.smallestTileSize);
    }

    private static Rectangle GetPondBottomSourceRect(BuildingData data)
    {
        return new Rectangle(
            0,
            data.Size.Y * Game1.smallestTileSize,
            data.Size.X * Game1.smallestTileSize,
            data.Size.Y * Game1.smallestTileSize
        );
    }

    private static Rectangle GetPondSourceRect(BuildingData data)
    {
        return new Rectangle(
            0,
            0,
            data.Size.X * Game1.smallestTileSize,
            data.Size.Y * Game1.smallestTileSize
        );
    }

    private static Rectangle GetNettingSourceRect(BuildingData data, NetInt nettingStyle)
    {
        int height = (int)(48f * data.Size.Y / 5f);
        return new Rectangle(
            data.Size.X * Game1.smallestTileSize,
            nettingStyle.Value * height,
            data.Size.X * Game1.smallestTileSize,
            height
        );
    }

    private static Rectangle GetNettingSourceRectZero(BuildingData data)
    {
        return new Rectangle(
            data.Size.X * Game1.smallestTileSize,
            0,
            data.Size.X * Game1.smallestTileSize,
            (int)(48f * data.Size.Y / 5f)
        );
    }

    private static Vector2 GetBucketOffset(BuildingData data)
    {
        float scaleX = data.Size.X / 5f;
        float scaleY = data.Size.Y / 5f;
        return new Vector2(65f * scaleX, 59f * scaleY);
    }

    private static Rectangle GetBucketSourceRect(BuildingData data)
    {
        float scaleX = data.Size.X / 5f;
        float scaleY = data.Size.Y / 5f;
        return new Rectangle(0, (int)(160 * scaleY), (int)(15 * scaleX), (int)(16 * scaleY));
    }

    private static Rectangle GetGoldBucketSourceRect(BuildingData data)
    {
        float scaleX = data.Size.X / 5f;
        float scaleY = data.Size.Y / 5f;
        return new Rectangle(
            (int)(145 * scaleX),
            (int)(160 * scaleY),
            (int)(15 * scaleX),
            (int)(16 * scaleY)
        );
    }

    private static Rectangle GetGoldBucketEmptySourceRect(BuildingData data)
    {
        float scaleX = data.Size.X / 5f;
        float scaleY = data.Size.Y / 5f;
        return new Rectangle(
            (int)(130 * scaleX),
            (int)(160 * scaleY),
            (int)(15 * scaleX),
            (int)(16 * scaleY)
        );
    }

    private static int GetSizeX(BuildingData data)
    {
        return data.Size.X;
    }

    private static int GetSizeY(BuildingData data)
    {
        return data.Size.Y;
    }

    private static IEnumerable<CodeInstruction> FishPond_draw_Transpiler(
        IEnumerable<CodeInstruction> instructions,
        ILGenerator generator
    )
    {
        try
        {
            CodeMatcher matcher = new(instructions, generator);

            // Obtain the local of buildingData
            matcher
                .Start()
                .MatchStartForward(
                    [
                        new((inst) => inst.IsLdloc()),
                        new(
                            OpCodes.Call,
                            AccessTools.DeclaredMethod(
                                typeof(Building),
                                nameof(Building.ShouldDrawShadow)
                            )
                        ),
                    ]
                );
            CodeInstruction locBuildingData = new(matcher.Opcode, matcher.Operand);

            // Pond Bottom: source rect
            matcher
                .MatchEndForward(
                    [
                        new(OpCodes.Ldc_I4_0),
                        new(OpCodes.Ldc_I4_S, (sbyte)80),
                        new(OpCodes.Ldc_I4_S, (sbyte)80),
                        new(OpCodes.Ldc_I4_S, (sbyte)80),
                        new(OpCodes.Newobj),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondBottomSourceRect))
                        ),
                    ]
                )
                .CreateLabel(out Label lblTmp)
                .Advance(-5)
                .Insert([new(OpCodes.Br, lblTmp)]);

            // Pond Bottom: origin
            matcher
                .MatchEndForward(
                    [
                        new(OpCodes.Ldc_R4, 0f),
                        new(OpCodes.Ldc_R4, 80f),
                        new(OpCodes.Newobj),
                        new(OpCodes.Ldc_R4, 4f),
                    ]
                )
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondOrigin))
                        ),
                    ]
                )
                .CreateLabel(out lblTmp)
                .Advance(-3)
                .Insert([new(OpCodes.Br, lblTmp)]);

            // Water Overlay: loop labels
            matcher.MatchEndForward([new((inst) => inst.IsStloc()), new(OpCodes.Br)]);
            Label loop1 = (Label)matcher.Operand;
            matcher.MatchEndForward([new((inst) => inst.IsStloc()), new(OpCodes.Br)]);
            Label loop2 = (Label)matcher.Operand;

            // Water Overlay: last Y check
            matcher
                .MatchEndForward(
                    [
                        new(
                            OpCodes.Ldfld,
                            AccessTools.Field(typeof(Building), nameof(Building.tileY))
                        ),
                        new(OpCodes.Callvirt),
                        new(OpCodes.Ldc_I4_4),
                    ]
                )
                .SetAndAdvance(locBuildingData.opcode, locBuildingData.operand)
                .Insert(
                    [
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetSizeY))
                        ),
                        new(OpCodes.Ldc_I4_1),
                        new(OpCodes.Sub),
                    ]
                );

            // Water Overlay: loop2 head
            matcher
                .MatchEndForward(
                    [
                        new((inst) => inst.labels.Contains(loop2)),
                        new(OpCodes.Ldarg_0),
                        new(
                            OpCodes.Ldfld,
                            AccessTools.Field(typeof(Building), nameof(Building.tileX))
                        ),
                        new(OpCodes.Callvirt),
                        new(OpCodes.Ldc_I4_4),
                    ]
                )
                .SetAndAdvance(locBuildingData.opcode, locBuildingData.operand)
                .InsertAndAdvance(
                    [
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetSizeX))
                        ),
                        new(OpCodes.Ldc_I4_1),
                        new(OpCodes.Sub),
                    ]
                );

            // Water Overlay: loop1 head
            matcher
                .MatchEndForward(
                    [
                        new((inst) => inst.labels.Contains(loop1)),
                        new(OpCodes.Ldarg_0),
                        new(
                            OpCodes.Ldfld,
                            AccessTools.Field(typeof(Building), nameof(Building.tileY))
                        ),
                        new(OpCodes.Callvirt),
                        new(OpCodes.Ldc_I4_5),
                    ]
                )
                .SetAndAdvance(locBuildingData.opcode, locBuildingData.operand)
                .Insert(
                    [new(OpCodes.Call, AccessTools.Method(typeof(GamePatches), nameof(GetSizeY)))]
                );

            // Pond: source rect
            matcher
                .MatchEndForward(
                    [
                        new(OpCodes.Ldc_I4_0),
                        new(OpCodes.Ldc_I4_0),
                        new(OpCodes.Ldc_I4_S, (sbyte)80),
                        new(OpCodes.Ldc_I4_S, (sbyte)80),
                        new(OpCodes.Newobj),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondSourceRect))
                        ),
                    ]
                )
                .CreateLabel(out lblTmp)
                .Advance(-5)
                .Insert([new(OpCodes.Br, lblTmp)]);

            // Pond: origin
            matcher
                .MatchEndForward(
                    [
                        new(OpCodes.Ldc_R4, 0f),
                        new(OpCodes.Ldc_R4, 80f),
                        new(OpCodes.Newobj),
                        new(OpCodes.Ldc_R4, 4f),
                    ]
                )
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondOrigin))
                        ),
                    ]
                )
                .CreateLabel(out lblTmp)
                .Advance(-3)
                .Insert([new(OpCodes.Br, lblTmp)]);

            // Netting: source rect
            matcher
                .MatchEndForward(
                    [
                        new(OpCodes.Ldc_I4_S, (sbyte)80),
                        new(OpCodes.Ldarg_0),
                        new(
                            OpCodes.Ldfld,
                            AccessTools.Field(typeof(FishPond), nameof(FishPond.nettingStyle))
                        ),
                        new(OpCodes.Callvirt),
                        new(OpCodes.Ldc_I4_S, (sbyte)48),
                        new(OpCodes.Mul),
                        new(OpCodes.Ldc_I4_S, (sbyte)80),
                        new(OpCodes.Ldc_I4_S, (sbyte)48),
                        new(OpCodes.Newobj),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(OpCodes.Ldarg_0),
                        new(
                            OpCodes.Ldfld,
                            AccessTools.Field(typeof(FishPond), nameof(FishPond.nettingStyle))
                        ),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetNettingSourceRect))
                        ),
                    ]
                )
                .CreateLabel(out lblTmp)
                .Advance(-9)
                .Insert([new(OpCodes.Br, lblTmp)]);

            // Netting: origin
            matcher
                .MatchEndForward(
                    [
                        new(OpCodes.Ldc_R4, 0f),
                        new(OpCodes.Ldc_R4, 80f),
                        new(OpCodes.Newobj),
                        new(OpCodes.Ldc_R4, 4f),
                    ]
                )
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondOrigin))
                        ),
                    ]
                )
                .CreateLabel(out lblTmp)
                .Advance(-3)
                .Insert([new(OpCodes.Br, lblTmp)]);

            // Bucket: gold empty
            matcher
                .MatchEndForward(
                    [new(OpCodes.Ldc_R4, 65f), new(OpCodes.Ldc_R4, 59f), new(OpCodes.Newobj)]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetBucketOffset))
                        ),
                    ]
                )
                .CreateLabel(out lblTmp)
                .Advance(-3)
                .Insert([new(OpCodes.Br, lblTmp)]);

            matcher
                .MatchEndForward(
                    [
                        new(OpCodes.Ldc_I4, 130),
                        new(OpCodes.Ldc_I4, 160),
                        new(OpCodes.Ldc_I4_S, (sbyte)15),
                        new(OpCodes.Ldc_I4_S, (sbyte)16),
                        new(OpCodes.Newobj),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(
                                typeof(GamePatches),
                                nameof(GetGoldBucketEmptySourceRect)
                            )
                        ),
                    ]
                )
                .CreateLabel(out lblTmp)
                .Advance(-5)
                .Insert([new(OpCodes.Br, lblTmp)]);

            // Bucket: normal output ready
            matcher
                .MatchEndForward(
                    [new(OpCodes.Ldc_R4, 65f), new(OpCodes.Ldc_R4, 59f), new(OpCodes.Newobj)]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetBucketOffset))
                        ),
                    ]
                )
                .CreateLabel(out lblTmp)
                .Advance(-3)
                .Insert([new(OpCodes.Br, lblTmp)]);

            matcher
                .MatchEndForward(
                    [
                        new(OpCodes.Ldc_I4_0),
                        new(OpCodes.Ldc_I4, 160),
                        new(OpCodes.Ldc_I4_S, (sbyte)15),
                        new(OpCodes.Ldc_I4_S, (sbyte)16),
                        new(OpCodes.Newobj),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetBucketSourceRect))
                        ),
                    ]
                )
                .CreateLabel(out lblTmp)
                .Advance(-5)
                .Insert([new(OpCodes.Br, lblTmp)]);

            // Bucket: gold output ready
            matcher
                .MatchEndForward(
                    [new(OpCodes.Ldc_R4, 65f), new(OpCodes.Ldc_R4, 59f), new(OpCodes.Newobj)]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetBucketOffset))
                        ),
                    ]
                )
                .CreateLabel(out lblTmp)
                .Advance(-3)
                .Insert([new(OpCodes.Br, lblTmp)]);

            matcher
                .MatchEndForward(
                    [
                        new(OpCodes.Ldc_I4, 145),
                        new(OpCodes.Ldc_I4, 160),
                        new(OpCodes.Ldc_I4_S, (sbyte)15),
                        new(OpCodes.Ldc_I4_S, (sbyte)16),
                        new(OpCodes.Newobj),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetGoldBucketSourceRect))
                        ),
                    ]
                )
                .CreateLabel(out lblTmp)
                .Advance(-5)
                .Insert([new(OpCodes.Br, lblTmp)]);

            return matcher.Instructions();
        }
        catch (Exception err)
        {
            ModEntry.Log($"Error in Toolbar_draw_Transpiler:\n{err}", LogLevel.Error);
            return instructions;
        }
    }

    private static IEnumerable<CodeInstruction> FishPond_drawInMenu_Transpiler(
        IEnumerable<CodeInstruction> instructions,
        ILGenerator generator
    )
    {
        try
        {
            CodeMatcher matcher = new(instructions, generator);

            // Obtain the local of buildingData
            matcher
                .Start()
                .MatchStartForward(
                    [
                        new((inst) => inst.IsLdloc()),
                        new(
                            OpCodes.Call,
                            AccessTools.DeclaredMethod(
                                typeof(Building),
                                nameof(Building.ShouldDrawShadow)
                            )
                        ),
                    ]
                );
            CodeInstruction locBuildingData = new(matcher.Opcode, matcher.Operand);

            // Pond Bottom: source rect
            matcher
                .MatchEndForward(
                    [
                        new(OpCodes.Ldc_I4_0),
                        new(OpCodes.Ldc_I4_S, (sbyte)80),
                        new(OpCodes.Ldc_I4_S, (sbyte)80),
                        new(OpCodes.Ldc_I4_S, (sbyte)80),
                        new(OpCodes.Newobj),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondBottomSourceRect))
                        ),
                    ]
                )
                .CreateLabel(out Label lblTmp)
                .Advance(-5)
                .Insert([new(OpCodes.Br, lblTmp)]);

            // Water Overlay: loop labels
            matcher.MatchEndForward([new((inst) => inst.IsStloc()), new(OpCodes.Br)]);
            Label loop1 = (Label)matcher.Operand;
            matcher.MatchEndForward([new((inst) => inst.IsStloc()), new(OpCodes.Br)]);
            Label loop2 = (Label)matcher.Operand;

            // IL_00a5: ldarg.0
            // IL_00a6: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
            // IL_00ab: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
            // IL_00b0: ldc.i4.4
            // IL_00b1: add

            // Water Overlay: last Y check
            matcher.MatchEndForward(
                [
                    new(OpCodes.Ldfld, AccessTools.Field(typeof(Building), nameof(Building.tileY))),
                    new(OpCodes.Callvirt),
                    new(OpCodes.Ldc_I4_4),
                ]
            );

            matcher
                .SetAndAdvance(locBuildingData.opcode, locBuildingData.operand)
                .Insert(
                    [
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetSizeY))
                        ),
                        new(OpCodes.Ldc_I4_1),
                        new(OpCodes.Sub),
                    ]
                );

            // Water Overlay: loop2 head
            matcher
                .MatchEndForward(
                    [
                        new((inst) => inst.labels.Contains(loop2)),
                        new(OpCodes.Ldarg_0),
                        new(
                            OpCodes.Ldfld,
                            AccessTools.Field(typeof(Building), nameof(Building.tileX))
                        ),
                        new(OpCodes.Callvirt),
                        new(OpCodes.Ldc_I4_4),
                    ]
                )
                .SetAndAdvance(locBuildingData.opcode, locBuildingData.operand)
                .InsertAndAdvance(
                    [
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetSizeX))
                        ),
                        new(OpCodes.Ldc_I4_1),
                        new(OpCodes.Sub),
                    ]
                );

            // Water Overlay: loop1 head
            matcher
                .MatchEndForward(
                    [
                        new((inst) => inst.labels.Contains(loop1)),
                        new(OpCodes.Ldarg_0),
                        new(
                            OpCodes.Ldfld,
                            AccessTools.Field(typeof(Building), nameof(Building.tileY))
                        ),
                        new(OpCodes.Callvirt),
                        new(OpCodes.Ldc_I4_5),
                    ]
                )
                .SetAndAdvance(locBuildingData.opcode, locBuildingData.operand)
                .Insert(
                    [new(OpCodes.Call, AccessTools.Method(typeof(GamePatches), nameof(GetSizeY)))]
                );

            // Pond: source rect
            matcher
                .MatchEndForward(
                    [
                        new(OpCodes.Ldc_I4_0),
                        new(OpCodes.Ldc_I4_0),
                        new(OpCodes.Ldc_I4_S, (sbyte)80),
                        new(OpCodes.Ldc_I4_S, (sbyte)80),
                        new(OpCodes.Newobj),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondSourceRect))
                        ),
                    ]
                )
                .CreateLabel(out lblTmp)
                .Advance(-5)
                .Insert([new(OpCodes.Br, lblTmp)]);

            // Netting: source rect
            matcher
                .MatchEndForward(
                    [
                        new(OpCodes.Ldc_I4_S, (sbyte)80),
                        new(OpCodes.Ldc_I4_0),
                        new(OpCodes.Ldc_I4_S, (sbyte)80),
                        new(OpCodes.Ldc_I4_S, (sbyte)48),
                        new(OpCodes.Newobj),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(
                                typeof(GamePatches),
                                nameof(GetNettingSourceRectZero)
                            )
                        ),
                    ]
                )
                .CreateLabel(out lblTmp)
                .Advance(-5)
                .Insert([new(OpCodes.Br, lblTmp)]);

            return matcher.Instructions();
        }
        catch (Exception err)
        {
            ModEntry.Log($"Error in Toolbar_draw_Transpiler:\n{err}", LogLevel.Error);
            return instructions;
        }
    }

    private static void FishPond_getSourceRectForMenu_Postfix(
        FishPond __instance,
        ref Rectangle? __result
    )
    {
        if (__instance.GetData() is BuildingData data)
        {
            __result = new(
                0,
                0,
                data.Size.X * Game1.smallestTileSize,
                data.Size.Y * Game1.smallestTileSize
            );
        }
    }

    private static void FishPond_GetItemBucketTile_Postfix(
        FishPond __instance,
        ref Vector2 __result
    )
    {
        if (__instance.GetData() is BuildingData data)
        {
            __result.X = __instance.tileX.Value + data.Size.X - 1;
            __result.Y = __instance.tileY.Value + data.Size.Y - 1;
        }
    }

    private static void FishPond_GetCenterTile_Postfix(FishPond __instance, ref Vector2 __result)
    {
        if (__instance.GetData() is BuildingData data)
        {
            __result.X = __instance.tileX.Value + (data.Size.X / 2);
            __result.Y = __instance.tileY.Value + (data.Size.Y / 2);
        }
    }
}
