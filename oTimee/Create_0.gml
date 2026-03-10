if (!variable_global_exists("timee_defeated"))
{
    global.timee_defeated = false;
}
if (global.timee_defeated)
{
    instance_destroy();
}