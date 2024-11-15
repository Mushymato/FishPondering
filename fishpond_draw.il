	.method public hidebysig virtual 
		instance void draw (
			class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch b
		) cil managed 
	{
		// Method begins at RVA 0x2bf804
		// Header size: 12
		// Code size: 4797 (0x12bd)
		.maxstack 11
		.locals init (
			[0] class [StardewValley.GameData]StardewValley.GameData.Buildings.BuildingData,
			[1] bool,
			[2] int32,
			[3] int32,
			[4] int32,
			[5] bool,
			[6] valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color,
			[7] valuetype [System.Runtime]System.TimeSpan,
			[8] class StardewValley.ItemTypeDefinitions.ParsedItemData,
			[9] valuetype [System.Runtime]System.Nullable`1<int32>,
			[10] class StardewValley.ItemTypeDefinitions.ParsedItemData,
			[11] class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D,
			[12] valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle,
			[13] float32,
			[14] int32,
			[15] valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2,
			[16] int32,
			[17] class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D,
			[18] valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle,
			[19] int32,
			[20] int32,
			[21] valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2,
			[22] float32,
			[23] float32,
			[24] float32,
			[25] valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2,
			[26] valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2,
			[27] float32,
			[28] float32,
			[29] class StardewValley.ItemTypeDefinitions.ParsedItemData,
			[30] class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D,
			[31] class StardewValley.Objects.ColoredObject,
			[32] valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle
		)

		IL_0000: ldarg.0
		IL_0001: call instance bool StardewValley.Buildings.Building::get_isMoving()
		IL_0006: brfalse.s IL_0009

		IL_0008: ret

		IL_0009: ldarg.0
		IL_000a: ldfld class Netcode.NetInt StardewValley.Buildings.Building::daysOfConstructionLeft
		IL_000f: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_0014: ldc.i4.0
		IL_0015: ble.s IL_001f

		IL_0017: ldarg.0
		IL_0018: ldarg.1
		IL_0019: callvirt instance void StardewValley.Buildings.Building::drawInConstruction(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch)
		IL_001e: ret

		IL_001f: ldarg.0
		IL_0020: callvirt instance class [StardewValley.GameData]StardewValley.GameData.Buildings.BuildingData StardewValley.Buildings.Building::GetData()
		IL_0025: stloc.0
		IL_0026: ldarg.0
		IL_0027: ldfld class StardewValley.TemporaryAnimatedSpriteList StardewValley.Buildings.FishPond::animations
		IL_002c: callvirt instance int32 StardewValley.TemporaryAnimatedSpriteList::get_Count()
		IL_0031: ldc.i4.1
		IL_0032: sub
		IL_0033: stloc.2
		IL_0034: br.s IL_0054
		// loop start (head: IL_0054)
			IL_0036: ldarg.0
			IL_0037: ldfld class StardewValley.TemporaryAnimatedSpriteList StardewValley.Buildings.FishPond::animations
			IL_003c: ldloc.2
			IL_003d: callvirt instance class StardewValley.TemporaryAnimatedSprite StardewValley.TemporaryAnimatedSpriteList::get_Item(int32)
			IL_0042: ldarg.1
			IL_0043: ldc.i4.0
			IL_0044: ldc.i4.0
			IL_0045: ldc.i4.0
			IL_0046: ldc.r4 1
			IL_004b: callvirt instance void StardewValley.TemporaryAnimatedSprite::draw(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch, bool, int32, int32, float32)
			IL_0050: ldloc.2
			IL_0051: ldc.i4.1
			IL_0052: sub
			IL_0053: stloc.2

			IL_0054: ldloc.2
			IL_0055: ldc.i4.0
			IL_0056: bge.s IL_0036
		// end loop

		IL_0058: ldarg.0
		IL_0059: ldloc.0
		IL_005a: call instance bool StardewValley.Buildings.Building::ShouldDrawShadow(class [StardewValley.GameData]StardewValley.GameData.Buildings.BuildingData)
		IL_005f: brfalse.s IL_006a

		IL_0061: ldarg.0
		IL_0062: ldarg.1
		IL_0063: ldc.i4.m1
		IL_0064: ldc.i4.m1
		IL_0065: callvirt instance void StardewValley.Buildings.Building::drawShadow(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch, int32, int32)

		IL_006a: ldarg.1
		IL_006b: ldarg.0
		IL_006c: ldfld class [System.Runtime]System.Lazy`1<class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D> StardewValley.Buildings.Building::texture
		IL_0071: callvirt instance !0 class [System.Runtime]System.Lazy`1<class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D>::get_Value()
		IL_0076: ldsfld valuetype [xTile]xTile.Dimensions.Rectangle StardewValley.Game1::viewport
		IL_007b: ldarg.0
		IL_007c: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileX
		IL_0081: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_0086: ldc.i4.s 64
		IL_0088: mul
		IL_0089: conv.r4
		IL_008a: ldarg.0
		IL_008b: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_0090: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_0095: ldc.i4.s 64
		IL_0097: mul
		IL_0098: ldarg.0
		IL_0099: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tilesHigh
		IL_009e: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_00a3: ldc.i4.s 64
		IL_00a5: mul
		IL_00a6: add
		IL_00a7: conv.r4
		IL_00a8: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_00ad: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Game1::GlobalToLocal(valuetype [xTile]xTile.Dimensions.Rectangle, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_00b2: ldc.i4.0
		IL_00b3: ldc.i4.s 80
		IL_00b5: ldc.i4.s 80
		IL_00b7: ldc.i4.s 80
		IL_00b9: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle::.ctor(int32, int32, int32, int32)
		IL_00be: newobj instance void valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>::.ctor(!0)
		IL_00c3: ldarg.0
		IL_00c4: ldfld class Netcode.NetColor StardewValley.Buildings.FishPond::overrideWaterColor
		IL_00c9: callvirt instance !0 class Netcode.NetFieldBase`2<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, class Netcode.NetColor>::get_Value()
		IL_00ce: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::get_White()
		IL_00d3: call bool [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Equality(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color)
		IL_00d8: brtrue.s IL_00e7

		IL_00da: ldarg.0
		IL_00db: ldfld class Netcode.NetColor StardewValley.Buildings.FishPond::overrideWaterColor
		IL_00e0: callvirt instance !0 class Netcode.NetFieldBase`2<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, class Netcode.NetColor>::get_Value()
		IL_00e5: br.s IL_00f5

		IL_00e7: ldc.i4.s 60
		IL_00e9: ldc.i4.s 126
		IL_00eb: ldc.i4 150
		IL_00f0: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Color::.ctor(int32, int32, int32)

		IL_00f5: ldarg.0
		IL_00f6: ldfld float32 StardewValley.Buildings.Building::alpha
		IL_00fb: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
		IL_0100: ldc.r4 0.0
		IL_0105: ldc.r4 0.0
		IL_010a: ldc.r4 80
		IL_010f: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_0114: ldc.r4 4
		IL_0119: ldc.i4.0
		IL_011a: ldarg.0
		IL_011b: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_0120: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_0125: conv.r4
		IL_0126: ldc.r4 0.5
		IL_012b: add
		IL_012c: ldc.r4 64
		IL_0131: mul
		IL_0132: ldc.r4 3
		IL_0137: sub
		IL_0138: ldc.r4 10000
		IL_013d: div
		IL_013e: callvirt instance void [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch::Draw(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteEffects, float32)
		IL_0143: ldarg.0
		IL_0144: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_0149: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_014e: stloc.3
		IL_014f: br IL_03e1
		// loop start (head: IL_03e1)
			IL_0154: ldarg.0
			IL_0155: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileX
			IL_015a: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
			IL_015f: stloc.s 4
			IL_0161: br IL_03c9
			// loop start (head: IL_03c9)
				IL_0166: ldloc.3
				IL_0167: ldarg.0
				IL_0168: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
				IL_016d: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
				IL_0172: ldc.i4.4
				IL_0173: add
				IL_0174: ceq
				IL_0176: ldloc.3
				IL_0177: ldarg.0
				IL_0178: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
				IL_017d: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
				IL_0182: ceq
				IL_0184: stloc.s 5
				IL_0186: brfalse IL_0296

				IL_018b: ldarg.1
				IL_018c: ldsfld class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D StardewValley.Game1::mouseCursors
				IL_0191: ldsfld valuetype [xTile]xTile.Dimensions.Rectangle StardewValley.Game1::viewport
				IL_0196: ldloc.s 4
				IL_0198: ldc.i4.s 64
				IL_019a: mul
				IL_019b: ldc.i4.s 32
				IL_019d: add
				IL_019e: conv.r4
				IL_019f: ldloc.3
				IL_01a0: ldc.i4.1
				IL_01a1: add
				IL_01a2: ldc.i4.s 64
				IL_01a4: mul
				IL_01a5: call class StardewValley.GameLocation StardewValley.Game1::get_currentLocation()
				IL_01aa: ldfld float32 StardewValley.GameLocation::waterPosition
				IL_01af: conv.i4
				IL_01b0: sub
				IL_01b1: ldc.i4.s 32
				IL_01b3: sub
				IL_01b4: conv.r4
				IL_01b5: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
				IL_01ba: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Game1::GlobalToLocal(valuetype [xTile]xTile.Dimensions.Rectangle, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
				IL_01bf: call class StardewValley.GameLocation StardewValley.Game1::get_currentLocation()
				IL_01c4: ldfld int32 StardewValley.GameLocation::waterAnimationIndex
				IL_01c9: ldc.i4.s 64
				IL_01cb: mul
				IL_01cc: ldc.i4 2064
				IL_01d1: ldloc.s 4
				IL_01d3: ldloc.3
				IL_01d4: add
				IL_01d5: ldc.i4.2
				IL_01d6: rem
				IL_01d7: brfalse.s IL_01ef

				IL_01d9: call class StardewValley.GameLocation StardewValley.Game1::get_currentLocation()
				IL_01de: ldfld bool StardewValley.GameLocation::waterTileFlip
				IL_01e3: brtrue.s IL_01ec

				IL_01e5: ldc.i4 128
				IL_01ea: br.s IL_0203

				IL_01ec: ldc.i4.0
				IL_01ed: br.s IL_0203

				IL_01ef: call class StardewValley.GameLocation StardewValley.Game1::get_currentLocation()
				IL_01f4: ldfld bool StardewValley.GameLocation::waterTileFlip
				IL_01f9: brtrue.s IL_01fe

				IL_01fb: ldc.i4.0
				IL_01fc: br.s IL_0203

				IL_01fe: ldc.i4 128

				IL_0203: add
				IL_0204: ldc.i4.s 64
				IL_0206: ldc.i4.s 32
				IL_0208: call class StardewValley.GameLocation StardewValley.Game1::get_currentLocation()
				IL_020d: ldfld float32 StardewValley.GameLocation::waterPosition
				IL_0212: conv.i4
				IL_0213: add
				IL_0214: ldc.i4.5
				IL_0215: sub
				IL_0216: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle::.ctor(int32, int32, int32, int32)
				IL_021b: newobj instance void valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>::.ctor(!0)
				IL_0220: ldarg.0
				IL_0221: ldfld class Netcode.NetColor StardewValley.Buildings.FishPond::overrideWaterColor
				IL_0226: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::get_White()
				IL_022b: callvirt instance bool Netcode.NetColor::Equals(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color)
				IL_0230: brtrue.s IL_0249

				IL_0232: ldarg.0
				IL_0233: ldfld class Netcode.NetColor StardewValley.Buildings.FishPond::overrideWaterColor
				IL_0238: callvirt instance !0 class Netcode.NetFieldBase`2<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, class Netcode.NetColor>::get_Value()
				IL_023d: ldc.r4 0.5
				IL_0242: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
				IL_0247: br.s IL_0258

				IL_0249: call class StardewValley.GameLocation StardewValley.Game1::get_currentLocation()
				IL_024e: ldfld class Netcode.NetColor StardewValley.GameLocation::waterColor
				IL_0253: callvirt instance !0 class Netcode.NetFieldBase`2<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, class Netcode.NetColor>::get_Value()

				IL_0258: ldc.r4 0.0
				IL_025d: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::get_Zero()
				IL_0262: ldc.r4 1
				IL_0267: ldc.i4.0
				IL_0268: ldarg.0
				IL_0269: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
				IL_026e: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
				IL_0273: conv.r4
				IL_0274: ldc.r4 0.5
				IL_0279: add
				IL_027a: ldc.r4 64
				IL_027f: mul
				IL_0280: ldc.r4 2
				IL_0285: sub
				IL_0286: ldc.r4 10000
				IL_028b: div
				IL_028c: callvirt instance void [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch::Draw(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteEffects, float32)
				IL_0291: br IL_03c3

				IL_0296: ldarg.1
				IL_0297: ldsfld class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D StardewValley.Game1::mouseCursors
				IL_029c: ldsfld valuetype [xTile]xTile.Dimensions.Rectangle StardewValley.Game1::viewport
				IL_02a1: ldloc.s 4
				IL_02a3: ldc.i4.s 64
				IL_02a5: mul
				IL_02a6: ldc.i4.s 32
				IL_02a8: add
				IL_02a9: conv.r4
				IL_02aa: ldloc.3
				IL_02ab: ldc.i4.s 64
				IL_02ad: mul
				IL_02ae: ldc.i4.s 32
				IL_02b0: add
				IL_02b1: ldloc.s 5
				IL_02b3: brfalse.s IL_02bc

				IL_02b5: ldc.r4 0.0
				IL_02ba: br.s IL_02c6

				IL_02bc: call class StardewValley.GameLocation StardewValley.Game1::get_currentLocation()
				IL_02c1: ldfld float32 StardewValley.GameLocation::waterPosition

				IL_02c6: conv.i4
				IL_02c7: sub
				IL_02c8: conv.r4
				IL_02c9: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
				IL_02ce: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Game1::GlobalToLocal(valuetype [xTile]xTile.Dimensions.Rectangle, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
				IL_02d3: call class StardewValley.GameLocation StardewValley.Game1::get_currentLocation()
				IL_02d8: ldfld int32 StardewValley.GameLocation::waterAnimationIndex
				IL_02dd: ldc.i4.s 64
				IL_02df: mul
				IL_02e0: ldc.i4 2064
				IL_02e5: ldloc.s 4
				IL_02e7: ldloc.3
				IL_02e8: add
				IL_02e9: ldc.i4.2
				IL_02ea: rem
				IL_02eb: brfalse.s IL_0303

				IL_02ed: call class StardewValley.GameLocation StardewValley.Game1::get_currentLocation()
				IL_02f2: ldfld bool StardewValley.GameLocation::waterTileFlip
				IL_02f7: brtrue.s IL_0300

				IL_02f9: ldc.i4 128
				IL_02fe: br.s IL_0317

				IL_0300: ldc.i4.0
				IL_0301: br.s IL_0317

				IL_0303: call class StardewValley.GameLocation StardewValley.Game1::get_currentLocation()
				IL_0308: ldfld bool StardewValley.GameLocation::waterTileFlip
				IL_030d: brtrue.s IL_0312

				IL_030f: ldc.i4.0
				IL_0310: br.s IL_0317

				IL_0312: ldc.i4 128

				IL_0317: add
				IL_0318: ldloc.s 5
				IL_031a: brtrue.s IL_031f

				IL_031c: ldc.i4.0
				IL_031d: br.s IL_032a

				IL_031f: call class StardewValley.GameLocation StardewValley.Game1::get_currentLocation()
				IL_0324: ldfld float32 StardewValley.GameLocation::waterPosition
				IL_0329: conv.i4

				IL_032a: add
				IL_032b: ldc.i4.s 64
				IL_032d: ldc.i4.s 64
				IL_032f: ldloc.s 5
				IL_0331: brtrue.s IL_0336

				IL_0333: ldc.i4.0
				IL_0334: br.s IL_0342

				IL_0336: call class StardewValley.GameLocation StardewValley.Game1::get_currentLocation()
				IL_033b: ldfld float32 StardewValley.GameLocation::waterPosition
				IL_0340: neg
				IL_0341: conv.i4

				IL_0342: add
				IL_0343: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle::.ctor(int32, int32, int32, int32)
				IL_0348: newobj instance void valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>::.ctor(!0)
				IL_034d: ldarg.0
				IL_034e: ldfld class Netcode.NetColor StardewValley.Buildings.FishPond::overrideWaterColor
				IL_0353: callvirt instance !0 class Netcode.NetFieldBase`2<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, class Netcode.NetColor>::get_Value()
				IL_0358: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::get_White()
				IL_035d: call bool [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Equality(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color)
				IL_0362: brtrue.s IL_037b

				IL_0364: ldarg.0
				IL_0365: ldfld class Netcode.NetColor StardewValley.Buildings.FishPond::overrideWaterColor
				IL_036a: callvirt instance !0 class Netcode.NetFieldBase`2<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, class Netcode.NetColor>::get_Value()
				IL_036f: ldc.r4 0.5
				IL_0374: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
				IL_0379: br.s IL_038a

				IL_037b: call class StardewValley.GameLocation StardewValley.Game1::get_currentLocation()
				IL_0380: ldfld class Netcode.NetColor StardewValley.GameLocation::waterColor
				IL_0385: callvirt instance !0 class Netcode.NetFieldBase`2<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, class Netcode.NetColor>::get_Value()

				IL_038a: ldc.r4 0.0
				IL_038f: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::get_Zero()
				IL_0394: ldc.r4 1
				IL_0399: ldc.i4.0
				IL_039a: ldarg.0
				IL_039b: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
				IL_03a0: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
				IL_03a5: conv.r4
				IL_03a6: ldc.r4 0.5
				IL_03ab: add
				IL_03ac: ldc.r4 64
				IL_03b1: mul
				IL_03b2: ldc.r4 2
				IL_03b7: sub
				IL_03b8: ldc.r4 10000
				IL_03bd: div
				IL_03be: callvirt instance void [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch::Draw(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteEffects, float32)

				IL_03c3: ldloc.s 4
				IL_03c5: ldc.i4.1
				IL_03c6: add
				IL_03c7: stloc.s 4

				IL_03c9: ldloc.s 4
				IL_03cb: ldarg.0
				IL_03cc: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileX
				IL_03d1: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
				IL_03d6: ldc.i4.4
				IL_03d7: add
				IL_03d8: blt IL_0166
			// end loop

			IL_03dd: ldloc.3
			IL_03de: ldc.i4.1
			IL_03df: add
			IL_03e0: stloc.3

			IL_03e1: ldloc.3
			IL_03e2: ldarg.0
			IL_03e3: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
			IL_03e8: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
			IL_03ed: ldc.i4.5
			IL_03ee: add
			IL_03ef: blt IL_0154
		// end loop

		IL_03f4: ldarg.0
		IL_03f5: ldfld class Netcode.NetColor StardewValley.Buildings.FishPond::overrideWaterColor
		IL_03fa: callvirt instance !0 class Netcode.NetFieldBase`2<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, class Netcode.NetColor>::get_Value()
		IL_03ff: stloc.s 6
		IL_0401: ldloca.s 6
		IL_0403: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::get_White()
		IL_0408: call instance bool [MonoGame.Framework]Microsoft.Xna.Framework.Color::Equals(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color)
		IL_040d: brfalse IL_04dc

		IL_0412: ldarg.1
		IL_0413: ldarg.0
		IL_0414: ldfld class [System.Runtime]System.Lazy`1<class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D> StardewValley.Buildings.Building::texture
		IL_0419: callvirt instance !0 class [System.Runtime]System.Lazy`1<class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D>::get_Value()
		IL_041e: ldsfld valuetype [xTile]xTile.Dimensions.Rectangle StardewValley.Game1::viewport
		IL_0423: ldarg.0
		IL_0424: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileX
		IL_0429: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_042e: ldc.i4.s 64
		IL_0430: mul
		IL_0431: ldc.i4.s 64
		IL_0433: add
		IL_0434: conv.r4
		IL_0435: ldarg.0
		IL_0436: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_043b: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_0440: ldc.i4.s 64
		IL_0442: mul
		IL_0443: ldc.i4.s 44
		IL_0445: add
		IL_0446: ldsfld class [MonoGame.Framework]Microsoft.Xna.Framework.GameTime StardewValley.Game1::currentGameTime
		IL_044b: callvirt instance valuetype [System.Runtime]System.TimeSpan [MonoGame.Framework]Microsoft.Xna.Framework.GameTime::get_TotalGameTime()
		IL_0450: stloc.s 7
		IL_0452: ldloca.s 7
		IL_0454: call instance float64 [System.Runtime]System.TimeSpan::get_TotalMilliseconds()
		IL_0459: ldc.r8 2500
		IL_0462: rem
		IL_0463: ldc.r8 1250
		IL_046c: blt.s IL_0471

		IL_046e: ldc.i4.0
		IL_046f: br.s IL_0472

		IL_0471: ldc.i4.4

		IL_0472: add
		IL_0473: conv.r4
		IL_0474: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_0479: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Game1::GlobalToLocal(valuetype [xTile]xTile.Dimensions.Rectangle, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_047e: ldc.i4.s 16
		IL_0480: ldc.i4 160
		IL_0485: ldc.i4.s 48
		IL_0487: ldc.i4.7
		IL_0488: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle::.ctor(int32, int32, int32, int32)
		IL_048d: newobj instance void valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>::.ctor(!0)
		IL_0492: ldarg.0
		IL_0493: ldfld valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color StardewValley.Buildings.Building::color
		IL_0498: ldarg.0
		IL_0499: ldfld float32 StardewValley.Buildings.Building::alpha
		IL_049e: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
		IL_04a3: ldc.r4 0.0
		IL_04a8: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::get_Zero()
		IL_04ad: ldc.r4 4
		IL_04b2: ldc.i4.0
		IL_04b3: ldarg.0
		IL_04b4: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_04b9: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_04be: conv.r4
		IL_04bf: ldc.r4 0.5
		IL_04c4: add
		IL_04c5: ldc.r4 64
		IL_04ca: mul
		IL_04cb: ldc.r4 1
		IL_04d0: add
		IL_04d1: ldc.r4 10000
		IL_04d6: div
		IL_04d7: callvirt instance void [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch::Draw(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteEffects, float32)

		IL_04dc: ldarg.1
		IL_04dd: ldarg.0
		IL_04de: ldfld class [System.Runtime]System.Lazy`1<class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D> StardewValley.Buildings.Building::texture
		IL_04e3: callvirt instance !0 class [System.Runtime]System.Lazy`1<class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D>::get_Value()
		IL_04e8: ldsfld valuetype [xTile]xTile.Dimensions.Rectangle StardewValley.Game1::viewport
		IL_04ed: ldarg.0
		IL_04ee: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileX
		IL_04f3: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_04f8: ldc.i4.s 64
		IL_04fa: mul
		IL_04fb: conv.r4
		IL_04fc: ldarg.0
		IL_04fd: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_0502: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_0507: ldc.i4.s 64
		IL_0509: mul
		IL_050a: ldarg.0
		IL_050b: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tilesHigh
		IL_0510: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_0515: ldc.i4.s 64
		IL_0517: mul
		IL_0518: add
		IL_0519: conv.r4
		IL_051a: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_051f: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Game1::GlobalToLocal(valuetype [xTile]xTile.Dimensions.Rectangle, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_0524: ldc.i4.0
		IL_0525: ldc.i4.0
		IL_0526: ldc.i4.s 80
		IL_0528: ldc.i4.s 80
		IL_052a: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle::.ctor(int32, int32, int32, int32)
		IL_052f: newobj instance void valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>::.ctor(!0)
		IL_0534: ldarg.0
		IL_0535: ldfld valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color StardewValley.Buildings.Building::color
		IL_053a: ldarg.0
		IL_053b: ldfld float32 StardewValley.Buildings.Building::alpha
		IL_0540: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
		IL_0545: ldc.r4 0.0
		IL_054a: ldc.r4 0.0
		IL_054f: ldc.r4 80
		IL_0554: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_0559: ldc.r4 4
		IL_055e: ldc.i4.0
		IL_055f: ldarg.0
		IL_0560: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_0565: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_056a: conv.r4
		IL_056b: ldc.r4 0.5
		IL_0570: add
		IL_0571: ldc.r4 64
		IL_0576: mul
		IL_0577: ldc.r4 10000
		IL_057c: div
		IL_057d: callvirt instance void [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch::Draw(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteEffects, float32)
		IL_0582: ldarg.0
		IL_0583: ldfld class Netcode.NetInt StardewValley.Buildings.FishPond::nettingStyle
		IL_0588: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_058d: ldc.i4.3
		IL_058e: bge IL_0653

		IL_0593: ldarg.1
		IL_0594: ldarg.0
		IL_0595: ldfld class [System.Runtime]System.Lazy`1<class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D> StardewValley.Buildings.Building::texture
		IL_059a: callvirt instance !0 class [System.Runtime]System.Lazy`1<class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D>::get_Value()
		IL_059f: ldsfld valuetype [xTile]xTile.Dimensions.Rectangle StardewValley.Game1::viewport
		IL_05a4: ldarg.0
		IL_05a5: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileX
		IL_05aa: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_05af: ldc.i4.s 64
		IL_05b1: mul
		IL_05b2: conv.r4
		IL_05b3: ldarg.0
		IL_05b4: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_05b9: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_05be: ldc.i4.s 64
		IL_05c0: mul
		IL_05c1: ldarg.0
		IL_05c2: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tilesHigh
		IL_05c7: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_05cc: ldc.i4.s 64
		IL_05ce: mul
		IL_05cf: add
		IL_05d0: ldc.i4 128
		IL_05d5: sub
		IL_05d6: conv.r4
		IL_05d7: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_05dc: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Game1::GlobalToLocal(valuetype [xTile]xTile.Dimensions.Rectangle, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_05e1: ldc.i4.s 80
		IL_05e3: ldarg.0
		IL_05e4: ldfld class Netcode.NetInt StardewValley.Buildings.FishPond::nettingStyle
		IL_05e9: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_05ee: ldc.i4.s 48
		IL_05f0: mul
		IL_05f1: ldc.i4.s 80
		IL_05f3: ldc.i4.s 48
		IL_05f5: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle::.ctor(int32, int32, int32, int32)
		IL_05fa: newobj instance void valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>::.ctor(!0)
		IL_05ff: ldarg.0
		IL_0600: ldfld valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color StardewValley.Buildings.Building::color
		IL_0605: ldarg.0
		IL_0606: ldfld float32 StardewValley.Buildings.Building::alpha
		IL_060b: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
		IL_0610: ldc.r4 0.0
		IL_0615: ldc.r4 0.0
		IL_061a: ldc.r4 80
		IL_061f: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_0624: ldc.r4 4
		IL_0629: ldc.i4.0
		IL_062a: ldarg.0
		IL_062b: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_0630: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_0635: conv.r4
		IL_0636: ldc.r4 0.5
		IL_063b: add
		IL_063c: ldc.r4 64
		IL_0641: mul
		IL_0642: ldc.r4 2
		IL_0647: add
		IL_0648: ldc.r4 10000
		IL_064d: div
		IL_064e: callvirt instance void [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch::Draw(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteEffects, float32)

		IL_0653: ldarg.0
		IL_0654: ldfld class Netcode.NetRef`1<class StardewValley.Object> StardewValley.Buildings.FishPond::sign
		IL_0659: callvirt instance !0 class Netcode.NetFieldBase`2<class StardewValley.Object, class Netcode.NetRef`1<class StardewValley.Object>>::get_Value()
		IL_065e: brfalse IL_098e

		IL_0663: ldarg.0
		IL_0664: ldfld class Netcode.NetRef`1<class StardewValley.Object> StardewValley.Buildings.FishPond::sign
		IL_0669: callvirt instance !0 class Netcode.NetFieldBase`2<class StardewValley.Object, class Netcode.NetRef`1<class StardewValley.Object>>::get_Value()
		IL_066e: callvirt instance string StardewValley.Item::get_QualifiedItemId()
		IL_0673: call class StardewValley.ItemTypeDefinitions.ParsedItemData StardewValley.ItemRegistry::GetDataOrErrorItem(string)
		IL_0678: stloc.s 8
		IL_067a: ldarg.1
		IL_067b: ldloc.s 8
		IL_067d: callvirt instance class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D StardewValley.ItemTypeDefinitions.ParsedItemData::GetTexture()
		IL_0682: ldsfld valuetype [xTile]xTile.Dimensions.Rectangle StardewValley.Game1::viewport
		IL_0687: ldarg.0
		IL_0688: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileX
		IL_068d: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_0692: ldc.i4.s 64
		IL_0694: mul
		IL_0695: ldc.i4.8
		IL_0696: add
		IL_0697: conv.r4
		IL_0698: ldarg.0
		IL_0699: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_069e: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_06a3: ldc.i4.s 64
		IL_06a5: mul
		IL_06a6: ldarg.0
		IL_06a7: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tilesHigh
		IL_06ac: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_06b1: ldc.i4.s 64
		IL_06b3: mul
		IL_06b4: add
		IL_06b5: ldc.i4 128
		IL_06ba: sub
		IL_06bb: ldc.i4.s 32
		IL_06bd: sub
		IL_06be: conv.r4
		IL_06bf: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_06c4: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Game1::GlobalToLocal(valuetype [xTile]xTile.Dimensions.Rectangle, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_06c9: ldloc.s 8
		IL_06cb: ldc.i4.0
		IL_06cc: ldloca.s 9
		IL_06ce: initobj valuetype [System.Runtime]System.Nullable`1<int32>
		IL_06d4: ldloc.s 9
		IL_06d6: callvirt instance valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle StardewValley.ItemTypeDefinitions.ParsedItemData::GetSourceRect(int32, valuetype [System.Runtime]System.Nullable`1<int32>)
		IL_06db: newobj instance void valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>::.ctor(!0)
		IL_06e0: ldarg.0
		IL_06e1: ldfld valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color StardewValley.Buildings.Building::color
		IL_06e6: ldarg.0
		IL_06e7: ldfld float32 StardewValley.Buildings.Building::alpha
		IL_06ec: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
		IL_06f1: ldc.r4 0.0
		IL_06f6: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::get_Zero()
		IL_06fb: ldc.r4 4
		IL_0700: ldc.i4.0
		IL_0701: ldarg.0
		IL_0702: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_0707: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_070c: conv.r4
		IL_070d: ldc.r4 0.5
		IL_0712: add
		IL_0713: ldc.r4 64
		IL_0718: mul
		IL_0719: ldc.r4 2
		IL_071e: add
		IL_071f: ldc.r4 10000
		IL_0724: div
		IL_0725: callvirt instance void [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch::Draw(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteEffects, float32)
		IL_072a: ldarg.0
		IL_072b: ldfld class Netcode.NetString StardewValley.Buildings.FishPond::fishType
		IL_0730: callvirt instance !0 class Netcode.NetFieldBase`2<string, class Netcode.NetString>::get_Value()
		IL_0735: brfalse IL_098e

		IL_073a: ldarg.0
		IL_073b: ldfld class Netcode.NetString StardewValley.Buildings.FishPond::fishType
		IL_0740: callvirt instance !0 class Netcode.NetFieldBase`2<string, class Netcode.NetString>::get_Value()
		IL_0745: call class StardewValley.ItemTypeDefinitions.ParsedItemData StardewValley.ItemRegistry::GetData(string)
		IL_074a: stloc.s 10
		IL_074c: ldloc.s 10
		IL_074e: brfalse IL_098e

		IL_0753: ldloc.s 10
		IL_0755: callvirt instance class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D StardewValley.ItemTypeDefinitions.ParsedItemData::GetTexture()
		IL_075a: stloc.s 11
		IL_075c: ldloc.s 10
		IL_075e: ldc.i4.0
		IL_075f: ldloca.s 9
		IL_0761: initobj valuetype [System.Runtime]System.Nullable`1<int32>
		IL_0767: ldloc.s 9
		IL_0769: callvirt instance valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle StardewValley.ItemTypeDefinitions.ParsedItemData::GetSourceRect(int32, valuetype [System.Runtime]System.Nullable`1<int32>)
		IL_076e: stloc.s 12
		IL_0770: ldarg.0
		IL_0771: ldfld class Netcode.NetInt StardewValley.Buildings.Building::maxOccupants
		IL_0776: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_077b: ldc.i4.1
		IL_077c: beq.s IL_0785

		IL_077e: ldc.r4 0.0
		IL_0783: br.s IL_078a

		IL_0785: ldc.r4 6

		IL_078a: stloc.s 13
		IL_078c: ldarg.1
		IL_078d: ldloc.s 11
		IL_078f: ldsfld valuetype [xTile]xTile.Dimensions.Rectangle StardewValley.Game1::viewport
		IL_0794: ldarg.0
		IL_0795: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileX
		IL_079a: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_079f: ldc.i4.s 64
		IL_07a1: mul
		IL_07a2: ldc.i4.8
		IL_07a3: add
		IL_07a4: ldc.i4.8
		IL_07a5: add
		IL_07a6: ldc.i4.4
		IL_07a7: sub
		IL_07a8: conv.r4
		IL_07a9: ldarg.0
		IL_07aa: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_07af: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_07b4: ldc.i4.s 64
		IL_07b6: mul
		IL_07b7: ldarg.0
		IL_07b8: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tilesHigh
		IL_07bd: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_07c2: ldc.i4.s 64
		IL_07c4: mul
		IL_07c5: add
		IL_07c6: ldc.i4 128
		IL_07cb: sub
		IL_07cc: ldc.i4.8
		IL_07cd: sub
		IL_07ce: ldc.i4.4
		IL_07cf: add
		IL_07d0: conv.r4
		IL_07d1: ldloc.s 13
		IL_07d3: add
		IL_07d4: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_07d9: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Game1::GlobalToLocal(valuetype [xTile]xTile.Dimensions.Rectangle, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_07de: ldloc.s 12
		IL_07e0: newobj instance void valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>::.ctor(!0)
		IL_07e5: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::get_Black()
		IL_07ea: ldc.r4 0.4
		IL_07ef: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
		IL_07f4: ldarg.0
		IL_07f5: ldfld float32 StardewValley.Buildings.Building::alpha
		IL_07fa: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
		IL_07ff: ldc.r4 0.0
		IL_0804: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::get_Zero()
		IL_0809: ldc.r4 3
		IL_080e: ldc.i4.0
		IL_080f: ldarg.0
		IL_0810: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_0815: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_081a: conv.r4
		IL_081b: ldc.r4 0.5
		IL_0820: add
		IL_0821: ldc.r4 64
		IL_0826: mul
		IL_0827: ldc.r4 3
		IL_082c: add
		IL_082d: ldc.r4 10000
		IL_0832: div
		IL_0833: callvirt instance void [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch::Draw(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteEffects, float32)
		IL_0838: ldarg.1
		IL_0839: ldloc.s 11
		IL_083b: ldsfld valuetype [xTile]xTile.Dimensions.Rectangle StardewValley.Game1::viewport
		IL_0840: ldarg.0
		IL_0841: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileX
		IL_0846: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_084b: ldc.i4.s 64
		IL_084d: mul
		IL_084e: ldc.i4.8
		IL_084f: add
		IL_0850: ldc.i4.8
		IL_0851: add
		IL_0852: ldc.i4.1
		IL_0853: sub
		IL_0854: conv.r4
		IL_0855: ldarg.0
		IL_0856: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_085b: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_0860: ldc.i4.s 64
		IL_0862: mul
		IL_0863: ldarg.0
		IL_0864: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tilesHigh
		IL_0869: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_086e: ldc.i4.s 64
		IL_0870: mul
		IL_0871: add
		IL_0872: ldc.i4 128
		IL_0877: sub
		IL_0878: ldc.i4.8
		IL_0879: sub
		IL_087a: ldc.i4.1
		IL_087b: add
		IL_087c: conv.r4
		IL_087d: ldloc.s 13
		IL_087f: add
		IL_0880: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_0885: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Game1::GlobalToLocal(valuetype [xTile]xTile.Dimensions.Rectangle, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_088a: ldloc.s 12
		IL_088c: newobj instance void valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>::.ctor(!0)
		IL_0891: ldarg.0
		IL_0892: ldfld valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color StardewValley.Buildings.Building::color
		IL_0897: ldarg.0
		IL_0898: ldfld float32 StardewValley.Buildings.Building::alpha
		IL_089d: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
		IL_08a2: ldc.r4 0.0
		IL_08a7: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::get_Zero()
		IL_08ac: ldc.r4 3
		IL_08b1: ldc.i4.0
		IL_08b2: ldarg.0
		IL_08b3: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_08b8: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_08bd: conv.r4
		IL_08be: ldc.r4 0.5
		IL_08c3: add
		IL_08c4: ldc.r4 64
		IL_08c9: mul
		IL_08ca: ldc.r4 4
		IL_08cf: add
		IL_08d0: ldc.r4 10000
		IL_08d5: div
		IL_08d6: callvirt instance void [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch::Draw(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteEffects, float32)
		IL_08db: ldarg.0
		IL_08dc: ldfld class Netcode.NetInt StardewValley.Buildings.Building::maxOccupants
		IL_08e1: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_08e6: ldc.i4.1
		IL_08e7: ble IL_098e

		IL_08ec: ldarg.0
		IL_08ed: ldfld class Netcode.NetInt StardewValley.Buildings.Building::currentOccupants
		IL_08f2: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_08f7: ldarg.1
		IL_08f8: ldsfld valuetype [xTile]xTile.Dimensions.Rectangle StardewValley.Game1::viewport
		IL_08fd: ldarg.0
		IL_08fe: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileX
		IL_0903: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_0908: ldc.i4.s 64
		IL_090a: mul
		IL_090b: ldc.i4.s 32
		IL_090d: add
		IL_090e: ldc.i4.8
		IL_090f: add
		IL_0910: ldarg.0
		IL_0911: ldfld class Netcode.NetInt StardewValley.Buildings.Building::currentOccupants
		IL_0916: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_091b: ldc.i4.s 10
		IL_091d: blt.s IL_0922

		IL_091f: ldc.i4.0
		IL_0920: br.s IL_0923

		IL_0922: ldc.i4.8

		IL_0923: add
		IL_0924: conv.r4
		IL_0925: ldarg.0
		IL_0926: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_092b: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_0930: ldc.i4.s 64
		IL_0932: mul
		IL_0933: ldarg.0
		IL_0934: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tilesHigh
		IL_0939: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_093e: ldc.i4.s 64
		IL_0940: mul
		IL_0941: add
		IL_0942: ldc.i4.s 96
		IL_0944: sub
		IL_0945: conv.r4
		IL_0946: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_094b: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Game1::GlobalToLocal(valuetype [xTile]xTile.Dimensions.Rectangle, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_0950: ldc.r4 3
		IL_0955: ldarg.0
		IL_0956: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_095b: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_0960: conv.r4
		IL_0961: ldc.r4 0.5
		IL_0966: add
		IL_0967: ldc.r4 64
		IL_096c: mul
		IL_096d: ldc.r4 5
		IL_0972: add
		IL_0973: ldc.r4 10000
		IL_0978: div
		IL_0979: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::get_LightYellow()
		IL_097e: ldarg.0
		IL_097f: ldfld float32 StardewValley.Buildings.Building::alpha
		IL_0984: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
		IL_0989: call void StardewValley.Utility::drawTinyDigits(int32, class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color)

		IL_098e: ldarg.0
		IL_098f: ldfld class StardewValley.Object StardewValley.Buildings.FishPond::_fishObject
		IL_0994: brfalse IL_0c7e

		IL_0999: ldarg.0
		IL_099a: ldfld class StardewValley.Object StardewValley.Buildings.FishPond::_fishObject
		IL_099f: callvirt instance string StardewValley.Item::get_QualifiedItemId()
		IL_09a4: ldstr "(O)393"
		IL_09a9: call bool [System.Runtime]System.String::op_Equality(string, string)
		IL_09ae: brtrue.s IL_09ca

		IL_09b0: ldarg.0
		IL_09b1: ldfld class StardewValley.Object StardewValley.Buildings.FishPond::_fishObject
		IL_09b6: callvirt instance string StardewValley.Item::get_QualifiedItemId()
		IL_09bb: ldstr "(O)397"
		IL_09c0: call bool [System.Runtime]System.String::op_Equality(string, string)
		IL_09c5: brfalse IL_0c7e

		IL_09ca: ldc.i4.0
		IL_09cb: stloc.s 14
		IL_09cd: br IL_0c6a
		// loop start (head: IL_0c6a)
			IL_09d2: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::get_Zero()
			IL_09d7: stloc.s 15
			IL_09d9: ldloc.s 14
			IL_09db: ldarg.0
			IL_09dc: ldfld class Netcode.NetInt StardewValley.Buildings.FishPond::seedOffset
			IL_09e1: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
			IL_09e6: add
			IL_09e7: ldc.i4.s 10
			IL_09e9: rem
			IL_09ea: stloc.s 16
			IL_09ec: ldloc.s 16
			IL_09ee: switch (IL_0a20, IL_0a36, IL_0a4c, IL_0a62, IL_0a75, IL_0a88, IL_0a9b, IL_0aae, IL_0ac1, IL_0ad4)

			IL_0a1b: br IL_0ae5

			IL_0a20: ldloca.s 15
			IL_0a22: ldc.r4 0.0
			IL_0a27: ldc.r4 0.0
			IL_0a2c: call instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
			IL_0a31: br IL_0ae5

			IL_0a36: ldloca.s 15
			IL_0a38: ldc.r4 48
			IL_0a3d: ldc.r4 32
			IL_0a42: call instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
			IL_0a47: br IL_0ae5

			IL_0a4c: ldloca.s 15
			IL_0a4e: ldc.r4 80
			IL_0a53: ldc.r4 72
			IL_0a58: call instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
			IL_0a5d: br IL_0ae5

			IL_0a62: ldloca.s 15
			IL_0a64: ldc.r4 140
			IL_0a69: ldc.r4 28
			IL_0a6e: call instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
			IL_0a73: br.s IL_0ae5

			IL_0a75: ldloca.s 15
			IL_0a77: ldc.r4 96
			IL_0a7c: ldc.r4 0.0
			IL_0a81: call instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
			IL_0a86: br.s IL_0ae5

			IL_0a88: ldloca.s 15
			IL_0a8a: ldc.r4 0.0
			IL_0a8f: ldc.r4 96
			IL_0a94: call instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
			IL_0a99: br.s IL_0ae5

			IL_0a9b: ldloca.s 15
			IL_0a9d: ldc.r4 140
			IL_0aa2: ldc.r4 80
			IL_0aa7: call instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
			IL_0aac: br.s IL_0ae5

			IL_0aae: ldloca.s 15
			IL_0ab0: ldc.r4 64
			IL_0ab5: ldc.r4 120
			IL_0aba: call instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
			IL_0abf: br.s IL_0ae5

			IL_0ac1: ldloca.s 15
			IL_0ac3: ldc.r4 140
			IL_0ac8: ldc.r4 140
			IL_0acd: call instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
			IL_0ad2: br.s IL_0ae5

			IL_0ad4: ldloca.s 15
			IL_0ad6: ldc.r4 0.0
			IL_0adb: ldc.r4 150
			IL_0ae0: call instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)

			IL_0ae5: ldarg.1
			IL_0ae6: ldsfld class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D StardewValley.Game1::shadowTexture
			IL_0aeb: ldsfld valuetype [xTile]xTile.Dimensions.Rectangle StardewValley.Game1::viewport
			IL_0af0: ldarg.0
			IL_0af1: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileX
			IL_0af6: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
			IL_0afb: ldc.i4.s 64
			IL_0afd: mul
			IL_0afe: ldc.i4.s 64
			IL_0b00: add
			IL_0b01: ldc.i4.7
			IL_0b02: add
			IL_0b03: conv.r4
			IL_0b04: ldarg.0
			IL_0b05: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
			IL_0b0a: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
			IL_0b0f: ldc.i4.s 64
			IL_0b11: mul
			IL_0b12: ldc.i4.s 64
			IL_0b14: add
			IL_0b15: ldc.i4.s 32
			IL_0b17: add
			IL_0b18: conv.r4
			IL_0b19: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
			IL_0b1e: ldloc.s 15
			IL_0b20: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::op_Addition(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
			IL_0b25: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Game1::GlobalToLocal(valuetype [xTile]xTile.Dimensions.Rectangle, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
			IL_0b2a: ldsfld class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D StardewValley.Game1::shadowTexture
			IL_0b2f: callvirt instance valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D::get_Bounds()
			IL_0b34: newobj instance void valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>::.ctor(!0)
			IL_0b39: ldarg.0
			IL_0b3a: ldfld valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color StardewValley.Buildings.Building::color
			IL_0b3f: ldarg.0
			IL_0b40: ldfld float32 StardewValley.Buildings.Building::alpha
			IL_0b45: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
			IL_0b4a: ldc.r4 0.0
			IL_0b4f: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::get_Zero()
			IL_0b54: ldc.r4 3
			IL_0b59: ldc.i4.0
			IL_0b5a: ldarg.0
			IL_0b5b: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
			IL_0b60: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
			IL_0b65: conv.r4
			IL_0b66: ldc.r4 0.5
			IL_0b6b: add
			IL_0b6c: ldc.r4 64
			IL_0b71: mul
			IL_0b72: ldc.r4 2
			IL_0b77: sub
			IL_0b78: ldc.r4 10000
			IL_0b7d: div
			IL_0b7e: ldc.r4 1.1E-05
			IL_0b83: sub
			IL_0b84: callvirt instance void [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch::Draw(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteEffects, float32)
			IL_0b89: ldstr "(O)"
			IL_0b8e: ldarg.0
			IL_0b8f: ldfld class Netcode.NetString StardewValley.Buildings.FishPond::fishType
			IL_0b94: callvirt instance !0 class Netcode.NetFieldBase`2<string, class Netcode.NetString>::get_Value()
			IL_0b99: call string [System.Runtime]System.String::Concat(string, string)
			IL_0b9e: call class StardewValley.ItemTypeDefinitions.ParsedItemData StardewValley.ItemRegistry::GetDataOrErrorItem(string)
			IL_0ba3: dup
			IL_0ba4: callvirt instance class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D StardewValley.ItemTypeDefinitions.ParsedItemData::GetTexture()
			IL_0ba9: stloc.s 17
			IL_0bab: ldc.i4.0
			IL_0bac: ldloca.s 9
			IL_0bae: initobj valuetype [System.Runtime]System.Nullable`1<int32>
			IL_0bb4: ldloc.s 9
			IL_0bb6: callvirt instance valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle StardewValley.ItemTypeDefinitions.ParsedItemData::GetSourceRect(int32, valuetype [System.Runtime]System.Nullable`1<int32>)
			IL_0bbb: stloc.s 18
			IL_0bbd: ldarg.1
			IL_0bbe: ldloc.s 17
			IL_0bc0: ldsfld valuetype [xTile]xTile.Dimensions.Rectangle StardewValley.Game1::viewport
			IL_0bc5: ldarg.0
			IL_0bc6: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileX
			IL_0bcb: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
			IL_0bd0: ldc.i4.s 64
			IL_0bd2: mul
			IL_0bd3: ldc.i4.s 64
			IL_0bd5: add
			IL_0bd6: conv.r4
			IL_0bd7: ldarg.0
			IL_0bd8: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
			IL_0bdd: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
			IL_0be2: ldc.i4.s 64
			IL_0be4: mul
			IL_0be5: ldc.i4.s 64
			IL_0be7: add
			IL_0be8: conv.r4
			IL_0be9: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
			IL_0bee: ldloc.s 15
			IL_0bf0: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::op_Addition(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
			IL_0bf5: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Game1::GlobalToLocal(valuetype [xTile]xTile.Dimensions.Rectangle, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
			IL_0bfa: ldloc.s 18
			IL_0bfc: newobj instance void valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>::.ctor(!0)
			IL_0c01: ldarg.0
			IL_0c02: ldfld valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color StardewValley.Buildings.Building::color
			IL_0c07: ldarg.0
			IL_0c08: ldfld float32 StardewValley.Buildings.Building::alpha
			IL_0c0d: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
			IL_0c12: ldc.r4 0.75
			IL_0c17: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
			IL_0c1c: ldc.r4 0.0
			IL_0c21: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::get_Zero()
			IL_0c26: ldc.r4 3
			IL_0c2b: ldloc.s 16
			IL_0c2d: ldc.i4.3
			IL_0c2e: rem
			IL_0c2f: brfalse.s IL_0c34

			IL_0c31: ldc.i4.0
			IL_0c32: br.s IL_0c35

			IL_0c34: ldc.i4.1

			IL_0c35: ldarg.0
			IL_0c36: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
			IL_0c3b: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
			IL_0c40: conv.r4
			IL_0c41: ldc.r4 0.5
			IL_0c46: add
			IL_0c47: ldc.r4 64
			IL_0c4c: mul
			IL_0c4d: ldc.r4 2
			IL_0c52: sub
			IL_0c53: ldc.r4 10000
			IL_0c58: div
			IL_0c59: ldc.r4 1E-05
			IL_0c5e: sub
			IL_0c5f: callvirt instance void [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch::Draw(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteEffects, float32)
			IL_0c64: ldloc.s 14
			IL_0c66: ldc.i4.1
			IL_0c67: add
			IL_0c68: stloc.s 14

			IL_0c6a: ldloc.s 14
			IL_0c6c: ldarg.0
			IL_0c6d: ldfld class Netcode.NetInt StardewValley.Buildings.Building::currentOccupants
			IL_0c72: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
			IL_0c77: blt IL_09d2
		// end loop

		IL_0c7c: br.s IL_0cab

		IL_0c7e: ldc.i4.0
		IL_0c7f: stloc.s 19
		IL_0c81: br.s IL_0c9c
		// loop start (head: IL_0c9c)
			IL_0c83: ldarg.0
			IL_0c84: ldfld class [System.Collections]System.Collections.Generic.List`1<class StardewValley.Buildings.PondFishSilhouette> StardewValley.Buildings.FishPond::_fishSilhouettes
			IL_0c89: ldloc.s 19
			IL_0c8b: callvirt instance !0 class [System.Collections]System.Collections.Generic.List`1<class StardewValley.Buildings.PondFishSilhouette>::get_Item(int32)
			IL_0c90: ldarg.1
			IL_0c91: callvirt instance void StardewValley.Buildings.PondFishSilhouette::Draw(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch)
			IL_0c96: ldloc.s 19
			IL_0c98: ldc.i4.1
			IL_0c99: add
			IL_0c9a: stloc.s 19

			IL_0c9c: ldloc.s 19
			IL_0c9e: ldarg.0
			IL_0c9f: ldfld class [System.Collections]System.Collections.Generic.List`1<class StardewValley.Buildings.PondFishSilhouette> StardewValley.Buildings.FishPond::_fishSilhouettes
			IL_0ca4: callvirt instance int32 class [System.Collections]System.Collections.Generic.List`1<class StardewValley.Buildings.PondFishSilhouette>::get_Count()
			IL_0ca9: blt.s IL_0c83
		// end loop

		IL_0cab: ldc.i4.0
		IL_0cac: stloc.s 20
		IL_0cae: br.s IL_0cc9
		// loop start (head: IL_0cc9)
			IL_0cb0: ldarg.0
			IL_0cb1: ldfld class [System.Collections]System.Collections.Generic.List`1<class StardewValley.Buildings.JumpingFish> StardewValley.Buildings.FishPond::_jumpingFish
			IL_0cb6: ldloc.s 20
			IL_0cb8: callvirt instance !0 class [System.Collections]System.Collections.Generic.List`1<class StardewValley.Buildings.JumpingFish>::get_Item(int32)
			IL_0cbd: ldarg.1
			IL_0cbe: callvirt instance void StardewValley.Buildings.JumpingFish::Draw(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch)
			IL_0cc3: ldloc.s 20
			IL_0cc5: ldc.i4.1
			IL_0cc6: add
			IL_0cc7: stloc.s 20

			IL_0cc9: ldloc.s 20
			IL_0ccb: ldarg.0
			IL_0ccc: ldfld class [System.Collections]System.Collections.Generic.List`1<class StardewValley.Buildings.JumpingFish> StardewValley.Buildings.FishPond::_jumpingFish
			IL_0cd1: callvirt instance int32 class [System.Collections]System.Collections.Generic.List`1<class StardewValley.Buildings.JumpingFish>::get_Count()
			IL_0cd6: blt.s IL_0cb0
		// end loop

		IL_0cd8: ldarg.0
		IL_0cd9: call instance bool StardewValley.Buildings.FishPond::HasUnresolvedNeeds()
		IL_0cde: brfalse IL_0dcf

		IL_0ce3: ldarg.0
		IL_0ce4: call instance valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Buildings.FishPond::GetRequestTile()
		IL_0ce9: ldc.r4 64
		IL_0cee: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32)
		IL_0cf3: stloc.s 21
		IL_0cf5: ldloc.s 21
		IL_0cf7: ldc.r4 64
		IL_0cfc: ldc.r4 0.5
		IL_0d01: ldc.r4 0.5
		IL_0d06: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_0d0b: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::op_Multiply(float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_0d10: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::op_Addition(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_0d15: stloc.s 21
		IL_0d17: ldc.r4 3
		IL_0d1c: ldsfld class [MonoGame.Framework]Microsoft.Xna.Framework.GameTime StardewValley.Game1::currentGameTime
		IL_0d21: callvirt instance valuetype [System.Runtime]System.TimeSpan [MonoGame.Framework]Microsoft.Xna.Framework.GameTime::get_TotalGameTime()
		IL_0d26: stloc.s 7
		IL_0d28: ldloca.s 7
		IL_0d2a: call instance float64 [System.Runtime]System.TimeSpan::get_TotalMilliseconds()
		IL_0d2f: ldc.r8 250
		IL_0d38: div
		IL_0d39: call float64 [System.Runtime]System.Math::Sin(float64)
		IL_0d3e: ldc.i4.2
		IL_0d3f: call float64 [System.Runtime]System.Math::Round(float64, int32)
		IL_0d44: conv.r4
		IL_0d45: mul
		IL_0d46: stloc.s 22
		IL_0d48: ldloc.s 21
		IL_0d4a: ldfld float32 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::Y
		IL_0d4f: ldc.r4 160
		IL_0d54: add
		IL_0d55: ldc.r4 10000
		IL_0d5a: div
		IL_0d5b: ldc.r4 1E-06
		IL_0d60: add
		IL_0d61: stloc.s 23
		IL_0d63: ldloca.s 21
		IL_0d65: ldflda float32 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::Y
		IL_0d6a: dup
		IL_0d6b: ldind.r4
		IL_0d6c: ldloc.s 22
		IL_0d6e: ldc.r4 32
		IL_0d73: sub
		IL_0d74: add
		IL_0d75: stind.r4
		IL_0d76: ldarg.1
		IL_0d77: ldsfld class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D StardewValley.Game1::mouseCursors
		IL_0d7c: ldsfld valuetype [xTile]xTile.Dimensions.Rectangle StardewValley.Game1::viewport
		IL_0d81: ldloc.s 21
		IL_0d83: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Game1::GlobalToLocal(valuetype [xTile]xTile.Dimensions.Rectangle, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_0d88: ldc.i4 403
		IL_0d8d: ldc.i4 496
		IL_0d92: ldc.i4.5
		IL_0d93: ldc.i4.s 14
		IL_0d95: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle::.ctor(int32, int32, int32, int32)
		IL_0d9a: newobj instance void valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>::.ctor(!0)
		IL_0d9f: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::get_White()
		IL_0da4: ldc.r4 0.75
		IL_0da9: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
		IL_0dae: ldc.r4 0.0
		IL_0db3: ldc.r4 2
		IL_0db8: ldc.r4 14
		IL_0dbd: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_0dc2: ldc.r4 4
		IL_0dc7: ldc.i4.0
		IL_0dc8: ldloc.s 23
		IL_0dca: callvirt instance void [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch::Draw(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteEffects, float32)

		IL_0dcf: ldarg.0
		IL_0dd0: ldfld class Netcode.NetBool StardewValley.Buildings.FishPond::goldenAnimalCracker
		IL_0dd5: callvirt instance !0 class Netcode.NetFieldBase`2<bool, class Netcode.NetBool>::get_Value()
		IL_0dda: brfalse.s IL_0dec

		IL_0ddc: ldarg.0
		IL_0ddd: ldfld class Netcode.NetBool StardewValley.Buildings.FishPond::isPlayingGoldenCrackerAnimation
		IL_0de2: callvirt instance !0 class Netcode.NetFieldBase`2<bool, class Netcode.NetBool>::get_Value()
		IL_0de7: ldc.i4.0
		IL_0de8: ceq
		IL_0dea: br.s IL_0ded

		IL_0dec: ldc.i4.0

		IL_0ded: stloc.1
		IL_0dee: ldloc.1
		IL_0def: brfalse IL_0ead

		IL_0df4: ldarg.1
		IL_0df5: ldarg.0
		IL_0df6: ldfld class [System.Runtime]System.Lazy`1<class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D> StardewValley.Buildings.Building::texture
		IL_0dfb: callvirt instance !0 class [System.Runtime]System.Lazy`1<class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D>::get_Value()
		IL_0e00: ldsfld valuetype [xTile]xTile.Dimensions.Rectangle StardewValley.Game1::viewport
		IL_0e05: ldarg.0
		IL_0e06: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileX
		IL_0e0b: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_0e10: ldc.i4.s 64
		IL_0e12: mul
		IL_0e13: conv.r4
		IL_0e14: ldarg.0
		IL_0e15: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_0e1a: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_0e1f: ldc.i4.s 64
		IL_0e21: mul
		IL_0e22: conv.r4
		IL_0e23: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_0e28: ldc.r4 65
		IL_0e2d: ldc.r4 59
		IL_0e32: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_0e37: ldc.r4 4
		IL_0e3c: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32)
		IL_0e41: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::op_Addition(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_0e46: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Game1::GlobalToLocal(valuetype [xTile]xTile.Dimensions.Rectangle, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_0e4b: ldc.i4 130
		IL_0e50: ldc.i4 160
		IL_0e55: ldc.i4.s 15
		IL_0e57: ldc.i4.s 16
		IL_0e59: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle::.ctor(int32, int32, int32, int32)
		IL_0e5e: newobj instance void valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>::.ctor(!0)
		IL_0e63: ldarg.0
		IL_0e64: ldfld valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color StardewValley.Buildings.Building::color
		IL_0e69: ldarg.0
		IL_0e6a: ldfld float32 StardewValley.Buildings.Building::alpha
		IL_0e6f: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
		IL_0e74: ldc.r4 0.0
		IL_0e79: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::get_Zero()
		IL_0e7e: ldc.r4 4
		IL_0e83: ldc.i4.0
		IL_0e84: ldarg.0
		IL_0e85: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_0e8a: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_0e8f: conv.r4
		IL_0e90: ldc.r4 0.5
		IL_0e95: add
		IL_0e96: ldc.r4 64
		IL_0e9b: mul
		IL_0e9c: ldc.r4 2
		IL_0ea1: add
		IL_0ea2: ldc.r4 10000
		IL_0ea7: div
		IL_0ea8: callvirt instance void [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch::Draw(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteEffects, float32)

		IL_0ead: ldarg.0
		IL_0eae: ldfld class Netcode.NetRef`1<class StardewValley.Item> StardewValley.Buildings.FishPond::output
		IL_0eb3: callvirt instance !0 class Netcode.NetFieldBase`2<class StardewValley.Item, class Netcode.NetRef`1<class StardewValley.Item>>::get_Value()
		IL_0eb8: brfalse IL_12bc

		IL_0ebd: ldarg.1
		IL_0ebe: ldarg.0
		IL_0ebf: ldfld class [System.Runtime]System.Lazy`1<class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D> StardewValley.Buildings.Building::texture
		IL_0ec4: callvirt instance !0 class [System.Runtime]System.Lazy`1<class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D>::get_Value()
		IL_0ec9: ldsfld valuetype [xTile]xTile.Dimensions.Rectangle StardewValley.Game1::viewport
		IL_0ece: ldarg.0
		IL_0ecf: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileX
		IL_0ed4: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_0ed9: ldc.i4.s 64
		IL_0edb: mul
		IL_0edc: conv.r4
		IL_0edd: ldarg.0
		IL_0ede: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_0ee3: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_0ee8: ldc.i4.s 64
		IL_0eea: mul
		IL_0eeb: conv.r4
		IL_0eec: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_0ef1: ldc.r4 65
		IL_0ef6: ldc.r4 59
		IL_0efb: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_0f00: ldc.r4 4
		IL_0f05: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32)
		IL_0f0a: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::op_Addition(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_0f0f: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Game1::GlobalToLocal(valuetype [xTile]xTile.Dimensions.Rectangle, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_0f14: ldc.i4.0
		IL_0f15: ldc.i4 160
		IL_0f1a: ldc.i4.s 15
		IL_0f1c: ldc.i4.s 16
		IL_0f1e: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle::.ctor(int32, int32, int32, int32)
		IL_0f23: newobj instance void valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>::.ctor(!0)
		IL_0f28: ldarg.0
		IL_0f29: ldfld valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color StardewValley.Buildings.Building::color
		IL_0f2e: ldarg.0
		IL_0f2f: ldfld float32 StardewValley.Buildings.Building::alpha
		IL_0f34: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
		IL_0f39: ldc.r4 0.0
		IL_0f3e: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::get_Zero()
		IL_0f43: ldc.r4 4
		IL_0f48: ldc.i4.0
		IL_0f49: ldarg.0
		IL_0f4a: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_0f4f: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_0f54: conv.r4
		IL_0f55: ldc.r4 0.5
		IL_0f5a: add
		IL_0f5b: ldc.r4 64
		IL_0f60: mul
		IL_0f61: ldc.r4 1
		IL_0f66: add
		IL_0f67: ldc.r4 10000
		IL_0f6c: div
		IL_0f6d: callvirt instance void [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch::Draw(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteEffects, float32)
		IL_0f72: ldloc.1
		IL_0f73: brfalse IL_1031

		IL_0f78: ldarg.1
		IL_0f79: ldarg.0
		IL_0f7a: ldfld class [System.Runtime]System.Lazy`1<class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D> StardewValley.Buildings.Building::texture
		IL_0f7f: callvirt instance !0 class [System.Runtime]System.Lazy`1<class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D>::get_Value()
		IL_0f84: ldsfld valuetype [xTile]xTile.Dimensions.Rectangle StardewValley.Game1::viewport
		IL_0f89: ldarg.0
		IL_0f8a: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileX
		IL_0f8f: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_0f94: ldc.i4.s 64
		IL_0f96: mul
		IL_0f97: conv.r4
		IL_0f98: ldarg.0
		IL_0f99: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_0f9e: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_0fa3: ldc.i4.s 64
		IL_0fa5: mul
		IL_0fa6: conv.r4
		IL_0fa7: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_0fac: ldc.r4 65
		IL_0fb1: ldc.r4 59
		IL_0fb6: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_0fbb: ldc.r4 4
		IL_0fc0: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32)
		IL_0fc5: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::op_Addition(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_0fca: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Game1::GlobalToLocal(valuetype [xTile]xTile.Dimensions.Rectangle, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_0fcf: ldc.i4 145
		IL_0fd4: ldc.i4 160
		IL_0fd9: ldc.i4.s 15
		IL_0fdb: ldc.i4.s 16
		IL_0fdd: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle::.ctor(int32, int32, int32, int32)
		IL_0fe2: newobj instance void valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>::.ctor(!0)
		IL_0fe7: ldarg.0
		IL_0fe8: ldfld valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color StardewValley.Buildings.Building::color
		IL_0fed: ldarg.0
		IL_0fee: ldfld float32 StardewValley.Buildings.Building::alpha
		IL_0ff3: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
		IL_0ff8: ldc.r4 0.0
		IL_0ffd: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::get_Zero()
		IL_1002: ldc.r4 4
		IL_1007: ldc.i4.0
		IL_1008: ldarg.0
		IL_1009: ldfld class Netcode.NetInt StardewValley.Buildings.Building::tileY
		IL_100e: callvirt instance !0 class Netcode.NetFieldBase`2<int32, class Netcode.NetInt>::get_Value()
		IL_1013: conv.r4
		IL_1014: ldc.r4 0.5
		IL_1019: add
		IL_101a: ldc.r4 64
		IL_101f: mul
		IL_1020: ldc.r4 3
		IL_1025: add
		IL_1026: ldc.r4 10000
		IL_102b: div
		IL_102c: callvirt instance void [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch::Draw(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteEffects, float32)

		IL_1031: ldarg.0
		IL_1032: call instance valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Buildings.FishPond::GetItemBucketTile()
		IL_1037: ldc.r4 64
		IL_103c: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32)
		IL_1041: ldc.r4 4
		IL_1046: ldsfld class [MonoGame.Framework]Microsoft.Xna.Framework.GameTime StardewValley.Game1::currentGameTime
		IL_104b: callvirt instance valuetype [System.Runtime]System.TimeSpan [MonoGame.Framework]Microsoft.Xna.Framework.GameTime::get_TotalGameTime()
		IL_1050: stloc.s 7
		IL_1052: ldloca.s 7
		IL_1054: call instance float64 [System.Runtime]System.TimeSpan::get_TotalMilliseconds()
		IL_1059: ldc.r8 250
		IL_1062: div
		IL_1063: call float64 [System.Runtime]System.Math::Sin(float64)
		IL_1068: ldc.i4.2
		IL_1069: call float64 [System.Runtime]System.Math::Round(float64, int32)
		IL_106e: conv.r4
		IL_106f: mul
		IL_1070: stloc.s 24
		IL_1072: dup
		IL_1073: ldc.r4 0.0
		IL_1078: ldc.r4 -2
		IL_107d: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_1082: ldc.r4 64
		IL_1087: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32)
		IL_108c: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::op_Addition(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_1091: ldc.r4 0.0
		IL_1096: ldloc.s 24
		IL_1098: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_109d: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::op_Addition(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_10a2: stloc.s 25
		IL_10a4: ldloca.s 26
		IL_10a6: ldc.r4 40
		IL_10ab: ldc.r4 36
		IL_10b0: call instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_10b5: dup
		IL_10b6: ldfld float32 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::Y
		IL_10bb: ldc.r4 64
		IL_10c0: add
		IL_10c1: ldc.r4 10000
		IL_10c6: div
		IL_10c7: ldc.r4 1E-06
		IL_10cc: add
		IL_10cd: stloc.s 27
		IL_10cf: ldfld float32 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::Y
		IL_10d4: ldc.r4 64
		IL_10d9: add
		IL_10da: ldc.r4 10000
		IL_10df: div
		IL_10e0: ldc.r4 1E-05
		IL_10e5: add
		IL_10e6: stloc.s 28
		IL_10e8: ldarg.1
		IL_10e9: ldsfld class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D StardewValley.Game1::mouseCursors
		IL_10ee: ldsfld valuetype [xTile]xTile.Dimensions.Rectangle StardewValley.Game1::viewport
		IL_10f3: ldloc.s 25
		IL_10f5: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Game1::GlobalToLocal(valuetype [xTile]xTile.Dimensions.Rectangle, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_10fa: ldc.i4 141
		IL_10ff: ldc.i4 465
		IL_1104: ldc.i4.s 20
		IL_1106: ldc.i4.s 24
		IL_1108: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle::.ctor(int32, int32, int32, int32)
		IL_110d: newobj instance void valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>::.ctor(!0)
		IL_1112: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::get_White()
		IL_1117: ldc.r4 0.75
		IL_111c: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
		IL_1121: ldc.r4 0.0
		IL_1126: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::get_Zero()
		IL_112b: ldc.r4 4
		IL_1130: ldc.i4.0
		IL_1131: ldloc.s 27
		IL_1133: callvirt instance void [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch::Draw(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteEffects, float32)
		IL_1138: ldarg.0
		IL_1139: ldfld class Netcode.NetRef`1<class StardewValley.Item> StardewValley.Buildings.FishPond::output
		IL_113e: callvirt instance !0 class Netcode.NetFieldBase`2<class StardewValley.Item, class Netcode.NetRef`1<class StardewValley.Item>>::get_Value()
		IL_1143: callvirt instance string StardewValley.Item::get_QualifiedItemId()
		IL_1148: call class StardewValley.ItemTypeDefinitions.ParsedItemData StardewValley.ItemRegistry::GetDataOrErrorItem(string)
		IL_114d: stloc.s 29
		IL_114f: ldloc.s 29
		IL_1151: callvirt instance class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D StardewValley.ItemTypeDefinitions.ParsedItemData::GetTexture()
		IL_1156: stloc.s 30
		IL_1158: ldarg.1
		IL_1159: ldloc.s 30
		IL_115b: ldsfld valuetype [xTile]xTile.Dimensions.Rectangle StardewValley.Game1::viewport
		IL_1160: ldloc.s 25
		IL_1162: ldloc.s 26
		IL_1164: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::op_Addition(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_1169: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Game1::GlobalToLocal(valuetype [xTile]xTile.Dimensions.Rectangle, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_116e: ldloc.s 29
		IL_1170: ldc.i4.0
		IL_1171: ldloca.s 9
		IL_1173: initobj valuetype [System.Runtime]System.Nullable`1<int32>
		IL_1179: ldloc.s 9
		IL_117b: callvirt instance valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle StardewValley.ItemTypeDefinitions.ParsedItemData::GetSourceRect(int32, valuetype [System.Runtime]System.Nullable`1<int32>)
		IL_1180: newobj instance void valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>::.ctor(!0)
		IL_1185: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::get_White()
		IL_118a: ldc.r4 0.75
		IL_118f: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
		IL_1194: ldc.r4 0.0
		IL_1199: ldc.r4 8
		IL_119e: ldc.r4 8
		IL_11a3: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_11a8: ldc.r4 4
		IL_11ad: ldc.i4.0
		IL_11ae: ldloc.s 28
		IL_11b0: callvirt instance void [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch::Draw(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteEffects, float32)
		IL_11b5: ldarg.0
		IL_11b6: ldfld class Netcode.NetRef`1<class StardewValley.Item> StardewValley.Buildings.FishPond::output
		IL_11bb: callvirt instance !0 class Netcode.NetFieldBase`2<class StardewValley.Item, class Netcode.NetRef`1<class StardewValley.Item>>::get_Value()
		IL_11c0: isinst StardewValley.Objects.ColoredObject
		IL_11c5: stloc.s 31
		IL_11c7: ldloc.s 31
		IL_11c9: brfalse IL_124f

		IL_11ce: ldarg.0
		IL_11cf: ldfld class Netcode.NetRef`1<class StardewValley.Item> StardewValley.Buildings.FishPond::output
		IL_11d4: callvirt instance !0 class Netcode.NetFieldBase`2<class StardewValley.Item, class Netcode.NetRef`1<class StardewValley.Item>>::get_Value()
		IL_11d9: callvirt instance string StardewValley.Item::get_QualifiedItemId()
		IL_11de: call class StardewValley.ItemTypeDefinitions.ParsedItemData StardewValley.ItemRegistry::GetDataOrErrorItem(string)
		IL_11e3: ldc.i4.1
		IL_11e4: ldloca.s 9
		IL_11e6: initobj valuetype [System.Runtime]System.Nullable`1<int32>
		IL_11ec: ldloc.s 9
		IL_11ee: callvirt instance valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle StardewValley.ItemTypeDefinitions.ParsedItemData::GetSourceRect(int32, valuetype [System.Runtime]System.Nullable`1<int32>)
		IL_11f3: stloc.s 32
		IL_11f5: ldarg.1
		IL_11f6: ldloc.s 30
		IL_11f8: ldsfld valuetype [xTile]xTile.Dimensions.Rectangle StardewValley.Game1::viewport
		IL_11fd: ldloc.s 25
		IL_11ff: ldloc.s 26
		IL_1201: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::op_Addition(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_1206: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Game1::GlobalToLocal(valuetype [xTile]xTile.Dimensions.Rectangle, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_120b: ldloc.s 32
		IL_120d: newobj instance void valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>::.ctor(!0)
		IL_1212: ldloc.s 31
		IL_1214: ldfld class Netcode.NetColor StardewValley.Objects.ColoredObject::color
		IL_1219: callvirt instance !0 class Netcode.NetFieldBase`2<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, class Netcode.NetColor>::get_Value()
		IL_121e: ldc.r4 0.75
		IL_1223: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
		IL_1228: ldc.r4 0.0
		IL_122d: ldc.r4 8
		IL_1232: ldc.r4 8
		IL_1237: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_123c: ldc.r4 4
		IL_1241: ldc.i4.0
		IL_1242: ldloc.s 28
		IL_1244: ldc.r4 1E-05
		IL_1249: add
		IL_124a: callvirt instance void [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch::Draw(class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.Texture2D, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [System.Runtime]System.Nullable`1<valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Rectangle>, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteEffects, float32)

		IL_124f: ldarg.0
		IL_1250: ldfld class Netcode.NetRef`1<class StardewValley.Item> StardewValley.Buildings.FishPond::output
		IL_1255: callvirt instance !0 class Netcode.NetFieldBase`2<class StardewValley.Item, class Netcode.NetRef`1<class StardewValley.Item>>::get_Value()
		IL_125a: callvirt instance int32 StardewValley.Item::get_Stack()
		IL_125f: ldc.i4.1
		IL_1260: ble.s IL_12bc

		IL_1262: ldarg.0
		IL_1263: ldfld class Netcode.NetRef`1<class StardewValley.Item> StardewValley.Buildings.FishPond::output
		IL_1268: callvirt instance !0 class Netcode.NetFieldBase`2<class StardewValley.Item, class Netcode.NetRef`1<class StardewValley.Item>>::get_Value()
		IL_126d: callvirt instance int32 StardewValley.Item::get_Stack()
		IL_1272: ldarg.1
		IL_1273: ldsfld valuetype [xTile]xTile.Dimensions.Rectangle StardewValley.Game1::viewport
		IL_1278: ldloc.s 25
		IL_127a: ldloc.s 26
		IL_127c: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::op_Addition(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_1281: ldc.r4 16
		IL_1286: ldc.r4 12
		IL_128b: newobj instance void [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::.ctor(float32, float32)
		IL_1290: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 [MonoGame.Framework]Microsoft.Xna.Framework.Vector2::op_Addition(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_1295: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2 StardewValley.Game1::GlobalToLocal(valuetype [xTile]xTile.Dimensions.Rectangle, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2)
		IL_129a: ldc.r4 3
		IL_129f: ldloc.s 28
		IL_12a1: ldc.r4 2E-05
		IL_12a6: add
		IL_12a7: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::get_LightYellow()
		IL_12ac: ldarg.0
		IL_12ad: ldfld float32 StardewValley.Buildings.Building::alpha
		IL_12b2: call valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color [MonoGame.Framework]Microsoft.Xna.Framework.Color::op_Multiply(valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color, float32)
		IL_12b7: call void StardewValley.Utility::drawTinyDigits(int32, class [MonoGame.Framework]Microsoft.Xna.Framework.Graphics.SpriteBatch, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Vector2, float32, float32, valuetype [MonoGame.Framework]Microsoft.Xna.Framework.Color)

		IL_12bc: ret
	} // end of method FishPond::draw
