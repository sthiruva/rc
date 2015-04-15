debug_print("Window Name: " .. get_window_name());
debug_print("Window Class: " .. get_application_name());


if (get_application_name()=="Vim") then
    maximize();
end
