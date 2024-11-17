using System.Reflection.Emit;
using HarmonyLib;
using Microsoft.Xna.Framework;
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
                original: AccessTools.DeclaredMethod(typeof(FishPond), nameof(FishPond.draw)),
                transpiler: new HarmonyMethod(typeof(GamePatches), nameof(FishPond_draw_Transpiler))
            );
            harmony.Patch(
                original: AccessTools.DeclaredMethod(typeof(FishPond), nameof(FishPond.drawInMenu)),
                transpiler: new HarmonyMethod(
                    typeof(GamePatches),
                    nameof(FishPond_drawInMenu_Transpiler)
                )
            );
            // rect/pos patches
            harmony.Patch(
                original: AccessTools.DeclaredMethod(
                    typeof(FishPond),
                    nameof(FishPond.getSourceRectForMenu)
                ),
                postfix: new HarmonyMethod(
                    typeof(GamePatches),
                    nameof(FishPond_getSourceRectForMenu_Postfix)
                )
            );
            harmony.Patch(
                original: AccessTools.DeclaredMethod(
                    typeof(FishPond),
                    nameof(FishPond.GetItemBucketTile)
                ),
                postfix: new HarmonyMethod(
                    typeof(GamePatches),
                    nameof(FishPond_GetItemBucketTile_Postfix)
                )
            );
            harmony.Patch(
                original: AccessTools.DeclaredMethod(
                    typeof(FishPond),
                    nameof(FishPond.GetRequestTile)
                ),
                postfix: new HarmonyMethod(
                    typeof(GamePatches),
                    nameof(FishPond_GetCenterTile_Postfix)
                )
            );
            harmony.Patch(
                original: AccessTools.DeclaredMethod(
                    typeof(FishPond),
                    nameof(FishPond.GetCenterTile)
                ),
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

    private static float GetPondScale(BuildingData data)
    {
        if (data != null)
            return data.Size.X / 5f;
        return 1f;
    }

    private static int MultByPondScale(int value, BuildingData data)
    {
        return (int)(value * GetPondScale(data));
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

            // Pond Bottom: scale
            matcher
                .MatchEndForward(
                    [
                        new(OpCodes.Ldc_R4, 0f),
                        new(OpCodes.Ldc_R4, 80f),
                        new(OpCodes.Newobj),
                        new(OpCodes.Ldc_R4, 4f),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondScale))
                        ),
                        new(OpCodes.Mul),
                    ]
                );

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

            // Pond Waves: position
            matcher
                .MatchEndForward(
                    [
                        new(OpCodes.Ldc_I4_S, (sbyte)64),
                        new(OpCodes.Mul),
                        new(OpCodes.Ldc_I4_S, (sbyte)64),
                        new(OpCodes.Add),
                    ]
                )
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(MultByPondScale))
                        ),
                    ]
                );
            matcher
                .MatchEndForward(
                    [
                        new(OpCodes.Ldc_I4_S, (sbyte)64),
                        new(OpCodes.Mul),
                        new(OpCodes.Ldc_I4_S, (sbyte)44),
                        new(OpCodes.Add),
                    ]
                )
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(MultByPondScale))
                        ),
                    ]
                );

            // Pond Waves: scale
            matcher
                .MatchEndForward(
                    [
                        new(
                            OpCodes.Call,
                            AccessTools.PropertyGetter(typeof(Vector2), nameof(Vector2.Zero))
                        ),
                        new(OpCodes.Ldc_R4, 4f),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondScale))
                        ),
                        new(OpCodes.Mul),
                    ]
                );

            // Pond: scale
            matcher
                .MatchEndForward(
                    [
                        new(OpCodes.Ldc_R4, 0f),
                        new(OpCodes.Ldc_R4, 80f),
                        new(OpCodes.Newobj),
                        new(OpCodes.Ldc_R4, 4f),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondScale))
                        ),
                        new(OpCodes.Mul),
                    ]
                );

            // Netting: position
            matcher
                .MatchStartForward(
                    [
                        new(OpCodes.Ldc_I4, 128),
                        new(OpCodes.Sub),
                        new(OpCodes.Conv_R4),
                        new(OpCodes.Newobj),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(MultByPondScale))
                        ),
                    ]
                );

            // Netting: scale
            matcher
                .MatchEndForward(
                    [
                        new(OpCodes.Ldc_R4, 0f),
                        new(OpCodes.Ldc_R4, 80f),
                        new(OpCodes.Newobj),
                        new(OpCodes.Ldc_R4, 4f),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondScale))
                        ),
                        new(OpCodes.Mul),
                    ]
                );

            // Sea Urchin/Coral: positions
            matcher.MatchStartForward([new(OpCodes.Switch)]);

            for (int i = 0; i < FishPond.MAXIMUM_OCCUPANCY; i++)
            {
                matcher
                    .MatchStartForward(
                        [
                            new(OpCodes.Ldc_R4),
                            new(OpCodes.Ldc_R4),
                            new(
                                OpCodes.Call,
                                AccessTools.Constructor(
                                    typeof(Vector2),
                                    [typeof(float), typeof(float)]
                                )
                            ),
                        ]
                    )
                    .Advance(1)
                    .InsertAndAdvance(
                        [
                            new(locBuildingData.opcode, locBuildingData.operand),
                            new(
                                OpCodes.Call,
                                AccessTools.Method(typeof(GamePatches), nameof(GetPondScale))
                            ),
                            new(OpCodes.Mul),
                        ]
                    )
                    .Advance(1)
                    .InsertAndAdvance(
                        [
                            new(locBuildingData.opcode, locBuildingData.operand),
                            new(
                                OpCodes.Call,
                                AccessTools.Method(typeof(GamePatches), nameof(GetPondScale))
                            ),
                            new(OpCodes.Mul),
                        ]
                    );
            }

            // Sea Urchin/Coral: offset and scale
            for (int i = 0; i < 2; i++)
            {
                matcher
                    .MatchStartForward([new(OpCodes.Ldc_I4_S, (sbyte)64), new(OpCodes.Add)])
                    .Advance(1)
                    .Insert(
                        [
                            new(locBuildingData.opcode, locBuildingData.operand),
                            new(
                                OpCodes.Call,
                                AccessTools.Method(typeof(GamePatches), nameof(MultByPondScale))
                            ),
                        ]
                    );
                matcher
                    .MatchStartForward([new(OpCodes.Ldc_I4_S, (sbyte)64), new(OpCodes.Add)])
                    .Advance(1)
                    .Insert(
                        [
                            new(locBuildingData.opcode, locBuildingData.operand),
                            new(
                                OpCodes.Call,
                                AccessTools.Method(typeof(GamePatches), nameof(MultByPondScale))
                            ),
                        ]
                    );
                // should technically adjust urchin shadow but whatever
                matcher
                    .MatchEndForward(
                        [
                            new(
                                OpCodes.Call,
                                AccessTools.PropertyGetter(typeof(Vector2), nameof(Vector2.Zero))
                            ),
                            new(OpCodes.Ldc_R4, 3f),
                        ]
                    )
                    .Advance(1)
                    .Insert(
                        [
                            new(locBuildingData.opcode, locBuildingData.operand),
                            new(
                                OpCodes.Call,
                                AccessTools.Method(typeof(GamePatches), nameof(GetPondScale))
                            ),
                            new(OpCodes.Mul),
                        ]
                    );
            }

            // Bucket: gold empty
            matcher
                .MatchStartForward(
                    [new(OpCodes.Ldc_R4, 65f), new(OpCodes.Ldc_R4, 59f), new(OpCodes.Newobj)]
                )
                .Advance(1)
                .InsertAndAdvance(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondScale))
                        ),
                        new(OpCodes.Mul),
                    ]
                )
                .Advance(1)
                .InsertAndAdvance(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondScale))
                        ),
                        new(OpCodes.Mul),
                    ]
                );

            matcher
                .MatchEndForward(
                    [
                        new(
                            OpCodes.Call,
                            AccessTools.PropertyGetter(typeof(Vector2), nameof(Vector2.Zero))
                        ),
                        new(OpCodes.Ldc_R4, 4f),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondScale))
                        ),
                        new(OpCodes.Mul),
                    ]
                );

            // Bucket: normal output ready
            matcher
                .MatchStartForward(
                    [new(OpCodes.Ldc_R4, 65f), new(OpCodes.Ldc_R4, 59f), new(OpCodes.Newobj)]
                )
                .Advance(1)
                .InsertAndAdvance(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondScale))
                        ),
                        new(OpCodes.Mul),
                    ]
                )
                .Advance(1)
                .InsertAndAdvance(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondScale))
                        ),
                        new(OpCodes.Mul),
                    ]
                );

            matcher
                .MatchEndForward(
                    [
                        new(
                            OpCodes.Call,
                            AccessTools.PropertyGetter(typeof(Vector2), nameof(Vector2.Zero))
                        ),
                        new(OpCodes.Ldc_R4, 4f),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondScale))
                        ),
                        new(OpCodes.Mul),
                    ]
                );

            // Bucket: gold output ready
            matcher
                .MatchStartForward(
                    [new(OpCodes.Ldc_R4, 65f), new(OpCodes.Ldc_R4, 59f), new(OpCodes.Newobj)]
                )
                .Advance(1)
                .InsertAndAdvance(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondScale))
                        ),
                        new(OpCodes.Mul),
                    ]
                )
                .Advance(1)
                .InsertAndAdvance(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondScale))
                        ),
                        new(OpCodes.Mul),
                    ]
                );

            matcher
                .MatchEndForward(
                    [
                        new(
                            OpCodes.Call,
                            AccessTools.PropertyGetter(typeof(Vector2), nameof(Vector2.Zero))
                        ),
                        new(OpCodes.Ldc_R4, 4f),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondScale))
                        ),
                        new(OpCodes.Mul),
                    ]
                );

            return matcher.Instructions();
        }
        catch (Exception err)
        {
            ModEntry.Log($"Error in FishPond_draw_Transpiler:\n{err}", LogLevel.Error);
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

            // Pond Bottom: scale
            matcher
                .MatchEndForward(
                    [
                        new(OpCodes.Ldc_R4, 0f),
                        new(OpCodes.Ldc_R4, 0f),
                        new(OpCodes.Newobj),
                        new(OpCodes.Ldc_R4, 4f),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondScale))
                        ),
                        new(OpCodes.Mul),
                    ]
                );

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

            // Pond: scale
            matcher
                .MatchEndForward(
                    [
                        new(OpCodes.Ldc_R4, 0f),
                        new(OpCodes.Ldc_R4, 0f),
                        new(OpCodes.Newobj),
                        new(OpCodes.Ldc_R4, 4f),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondScale))
                        ),
                        new(OpCodes.Mul),
                    ]
                );

            // Pond Waves: position
            matcher
                .MatchEndForward(
                    [new(OpCodes.Ldarg_2), new(OpCodes.Ldc_I4_S, (sbyte)64), new(OpCodes.Add)]
                )
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(MultByPondScale))
                        ),
                    ]
                );
            matcher
                .MatchEndForward(
                    [new(OpCodes.Ldarg_3), new(OpCodes.Ldc_I4_S, (sbyte)44), new(OpCodes.Add)]
                )
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(MultByPondScale))
                        ),
                    ]
                );

            // Pond Waves: scale
            matcher
                .MatchEndForward(
                    [
                        new(
                            OpCodes.Call,
                            AccessTools.PropertyGetter(typeof(Vector2), nameof(Vector2.Zero))
                        ),
                        new(OpCodes.Ldc_R4, 4f),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondScale))
                        ),
                        new(OpCodes.Mul),
                    ]
                );

            // Netting: position
            matcher
                .MatchStartForward(
                    [
                        new(OpCodes.Ldc_I4, 128),
                        new(OpCodes.Sub),
                        new(OpCodes.Conv_R4),
                        new(OpCodes.Newobj),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(MultByPondScale))
                        ),
                    ]
                );

            // Netting: scale
            matcher
                .MatchEndForward(
                    [
                        new(OpCodes.Ldc_R4, 0f),
                        new(OpCodes.Ldc_R4, 0f),
                        new(OpCodes.Newobj),
                        new(OpCodes.Ldc_R4, 4f),
                    ]
                )
                .Advance(1)
                .Insert(
                    [
                        new(locBuildingData.opcode, locBuildingData.operand),
                        new(
                            OpCodes.Call,
                            AccessTools.Method(typeof(GamePatches), nameof(GetPondScale))
                        ),
                        new(OpCodes.Mul),
                    ]
                );

            return matcher.Instructions();
        }
        catch (Exception err)
        {
            ModEntry.Log($"Error in FishPond_drawInMenu_Transpiler:\n{err}", LogLevel.Error);
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
