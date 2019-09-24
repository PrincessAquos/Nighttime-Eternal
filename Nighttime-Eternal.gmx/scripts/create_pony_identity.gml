///create_pony_identity(argName, argModel, argMane, argTail, argAccessory, argBodyPalette)
var argName = argument[0]
var argModel = argument[1]
var argMane = argument[2]
var argTail = argument[3]
var argAccessories = argument[4]
var argPalette = argument[5]

var body = ds_map_create();
ds_map_add(body, "model", argModel);
ds_map_add(body, "palette", argPalette);

var identity = ds_map_create();

ds_map_add(identity, "name", argName);
ds_map_add(identity, "body", body);
ds_map_add(identity, "mane", argMane);
ds_map_add(identity, "tail", argTail);
if (argAccessories == noone) {
    argAccessories = ds_list_create()
}
ds_map_add(identity, "accessories", argAccessories);

return identity;
