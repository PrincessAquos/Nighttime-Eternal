///queue_items_get_direction(queueItems)
// Returns the direction of origin
queueItems = argument[0];

return ds_list_find_value(queueItems, 1);
