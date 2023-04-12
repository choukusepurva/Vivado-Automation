open_project [pwd]/Automation/Automation.xpr

foreach module_name $argv {
    add_files -norecurse [pwd]/Modules/$module_name
    update_compile_order -fileset sources_1                      
 }



close_project
 

