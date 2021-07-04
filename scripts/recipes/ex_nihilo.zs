#priority 0

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import mods.exnihilocreatio.Sieve;

static shapedRecipes as IIngredient[][][][IItemStack] = {
	/*
    <abyssalcraft:necronomicon:0>: [
		[
			[<minecraft:rotten_flesh:0>, <abyssalcraft:corflesh:0>, <minecraft:rotten_flesh:0>],
			[<abyssalcraft:corflesh:0>, <primal:plant_cloth:0>, <abyssalcraft:corflesh:0>],
			[<minecraft:rotten_flesh:0>, <abyssalcraft:corflesh:0>, <minecraft:rotten_flesh:0>]
		]
	]
    */
};

/*
    Shapeless Recipes
*/
static shapelessRecipes as IIngredient[][][IItemStack] = {
};

/*
    Recipe Removals
*/
static removeRecipes as IItemStack[] = [

];

static removeFurnace as IIngredient[] = [

];

function machineRecipes() {
    //
    //Ex Nihilo
    //
    gt.large_forge_hammer.findRecipe(32,[<minecraft:cobblestone>],[<liquid:lubricant>*2]).remove();
    gt.forge_hammer.findRecipe(32,[<minecraft:cobblestone>],[null]).remove();

    val stone_crushedStone as IItemStack[IIngredient] = {
        <ore:cobblestone> : <minecraft:gravel>,
        <ore:gravel> : <minecraft:sand>,
        <ore:sand> : <exnihilocreatio:block_dust>,
        <ore:netherrack> : <exnihilocreatio:block_netherrack_crushed>,
        <ore:endstone> : <exnihilocreatio:block_endstone_crushed>,
        <ore:stoneDiorite> : <exnihilocreatio:block_diorite_crushed>,
        <ore:stoneAndesite> : <exnihilocreatio:block_andesite_crushed>,
        <ore:stoneGranite> : <exnihilocreatio:block_granite_crushed>,
        <exnihilocreatio:block_granite_crushed> : <minecraft:sand:1>
    };

    for stone, crushedStone in stone_crushedStone {
        gt.forge_hammer.recipeBuilder()
            .inputs([stone])
            .outputs([crushedStone])
            .duration(16).EUt(24)
            .buildAndRegister();

        gt.large_forge_hammer.recipeBuilder()
            .inputs([stone])
            .fluidInputs([<liquid:lubricant>*2])
            .outputs([crushedStone])
            .duration(16).EUt(24)
            .buildAndRegister();
    }

    //Ex Nihilo
    //Gregify Ex Nihilo
    recipes.remove(<ore:stickStone>);
    recipes.addShaped(<exnihilocreatio:item_material:6>,[
    [gt.file],
    [null,<ore:stone>]
    ]);
    recipes.remove(<exnihilocreatio:item_material:7>);
    recipes.addShaped(<exnihilocreatio:item_material:7>,[
    [<ore:stickStone>,<ore:stone>,<ore:stickStone>],
    [<ore:stone>, gt.screwDriver, <ore:stone>],
    [<ore:stickStone>,<ore:stone>,<ore:stickStone>]
    ]);
    recipes.addShaped(<exnihilocreatio:item_mesh:1>,
     [[<minecraft:string>,<minecraft:string>,<minecraft:string>],
      [<minecraft:string>,<minecraft:string>,<minecraft:string>],
      [<minecraft:string>,<minecraft:string>,<minecraft:string>]]);
    recipes.remove(<exnihilocreatio:item_mesh:2>);
    recipes.addShaped(<exnihilocreatio:item_mesh:2>,[
    [<ore:stickTinAlloy>,<minecraft:string>,<ore:stickTinAlloy>],
    [<minecraft:string>,<ore:stickTinAlloy>,<minecraft:string>],
    [<ore:stickTinAlloy>,<minecraft:string>,<ore:stickTinAlloy>]
    ]);
    recipes.remove(<exnihilocreatio:item_mesh:3>);
    recipes.addShaped(<exnihilocreatio:item_mesh:3>,[
    [<ore:stickSteel>,<minecraft:string>,<ore:stickSteel>],
    [<minecraft:string>,<ore:stickSteel>,<minecraft:string>],
    [<ore:stickSteel>,<minecraft:string>,<ore:stickSteel>]
    ]);
    recipes.remove(<exnihilocreatio:item_mesh:4>);
    recipes.addShaped(<exnihilocreatio:item_mesh:4>,[
    [<ore:stickAluminium>,<minecraft:string>,<ore:stickAluminium>],
    [<minecraft:string>,<ore:stickAluminium>,<minecraft:string>],
    [<ore:stickAluminium>,<minecraft:string>,<ore:stickAluminium>]
    ]);

    recipes.remove(<exnihilocreatio:block_end_cake>);
    recipes.addShaped(<exnihilocreatio:block_end_cake>,[
    [<deepmoblearning:pristine_matter_enderman>,<deepmoblearning:pristine_matter_enderman>,<deepmoblearning:pristine_matter_enderman>],
    [<ore:gemEnderEye>,<gregtech:meta_item_1:32725>,<ore:gemEnderEye>],
    [<ore:dustHsss>,<ore:dustNaquadria>,<ore:dustHsss>]
    ]);

    //Stone Hammer Change
    recipes.remove(<exnihilocreatio:hammer_stone>);
    recipes.addShaped(<exnihilocreatio:hammer_stone>,[
    [<minecraft:cobblestone>,<minecraft:cobblestone>],
    [<minecraft:cobblestone>,<minecraft:cobblestone>,<minecraft:stick>],
    [<minecraft:cobblestone>,<minecraft:cobblestone>]
    ]);

    //OreDict Dool Recipes
    recipes.remove(<exnihilocreatio:item_doll:5>);
    recipes.addShaped(<exnihilocreatio:item_doll:5>,[
    [<ore:dustSaltpeter>,<ore:dustRedstone>,<ore:dustSaltpeter>],
    [<ore:dustGlowstone>,<exnihilocreatio:item_material:5>,<ore:dustGlowstone>],
    [<ore:dustSaltpeter>,<minecraft:nether_wart>,<ore:dustSaltpeter>]
    ]);
    recipes.remove(<exnihilocreatio:item_doll:6>);
    recipes.addShaped(<exnihilocreatio:item_doll:6>,[
    [<ore:dustObsidian>,<ore:dustRedstone>,<ore:dustObsidian>],
    [<ore:dustGlowstone>,<exnihilocreatio:item_material:5>,<ore:dustGlowstone>],
    [<ore:dustObsidian>,<minecraft:nether_wart>,<ore:dustObsidian>]]);
}

function init() {
	// Un-named recipes
	craft.process(shapedRecipes, false);
    craft.process(shapelessRecipes);
	craft.removeRecipes(removeRecipes);
	craft.removeFurnace(removeFurnace);

    machineRecipes();
}
