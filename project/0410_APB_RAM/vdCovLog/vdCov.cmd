verdiWindowResize -win $_vdCoverage_1 "830" "370" "900" "700"
gui_set_pref_value -category {coveragesetting} -key {geninfodumping} -value 1
gui_exclusion -set_force true
verdiSetFont  -font  {DejaVu Sans}  -size  11
verdiSetFont -font "DejaVu Sans" -size "11"
gui_assert_mode -mode flat
gui_class_mode -mode hier
gui_excl_mgr_flat_list -on  0
gui_covdetail_select -id  CovDetail.1   -name   Line
verdiWindowWorkMode -win $_vdCoverage_1 -coverageAnalysis
verdiSetActWin -dock widgetDock_Message
verdiWindowResize -win $_vdCoverage_1 "35" "378" "1015" "709"
gui_open_cov  -hier coverage.vdb -testdir  {coverage.vdb} -test { coverage/sim1 } -merge MergedTest -db_max_tests 10 -sdc_level 1 -fsm transition
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
verdiSetActWin -dock widgetDock_<Summary>
gui_covtable_show -show  { Design Hierarchy } -id  CoverageTable.1  -test  MergedTest
gui_list_select -id CoverageTable.1 -list covtblInstancesList { uvm_pkg   }
gui_list_action -id  CoverageTable.1 -list {covtblInstancesList} uvm_pkg  -column {} 
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_list_sort -id  CoverageTable.1   -list {covtblFGroupsList} -descending  {Group}
gui_list_sort -id  CoverageTable.1   -list {covtblFGroupsList} {Group}
gui_covtable_show -show  { Design Hierarchy } -id  CoverageTable.1  -test  MergedTest
verdiSetActWin -dock widgetDock_<CovDetail>
verdiDockWidgetSetCurTab -dock widgetDock_<HvpDetail>
verdiDockWidgetSetCurTab -dock widgetDock_<CovDetail>
gui_close_db -file coverage.vdb -design Cov
gui_open_cov  -hier coverage.vdb -testdir  {coverage.vdb} -test { coverage/sim1 } -merge MergedTest -db_max_tests 10 -sdc_level 1 -fsm transition
gui_list_select -id CoverageTable.1 -list covtblInstancesList { uvm_pkg   }
gui_list_action -id  CoverageTable.1 -list {covtblInstancesList} uvm_pkg  -column {} 
verdiSetActWin -dock widgetDock_<Summary>
gui_covtable_show -show  { Design Hierarchy } -id  CoverageTable.1  -test  MergedTest
gui_src_cov_navigation_backward -id  CovSrc.1
gui_src_cov_navigation_forward -id  CovSrc.1
verdiSetActWin -dock widgetDock_<CovSrc.1>
gui_src_cov_navigation_forward -id  CovSrc.1
gui_src_cov_navigation_forward -id  CovSrc.1
gui_src_cov_navigation_forward -id  CovSrc.1
gui_src_cov_navigation_forward -id  CovSrc.1
gui_src_cov_navigation_forward -id  CovSrc.1
gui_src_cov_navigation_forward -id  CovSrc.1
gui_src_cov_navigation_forward -id  CovSrc.1
gui_src_cov_navigation_forward -id  CovSrc.1
gui_src_cov_navigation_forward -id  CovSrc.1
gui_src_cov_navigation_forward -id  CovSrc.1
gui_src_cov_navigation_forward -id  CovSrc.1
gui_src_cov_navigation_forward -id  CovSrc.1
gui_src_cov_navigation_forward -id  CovSrc.1
gui_src_cov_navigation_forward -id  CovSrc.1
gui_list_select -id CovDetail.1 -list Cover { Assertions   } -type { {}  }
gui_list_action -id  CovDetail.1 -list {Cover} Assertions  -type {}
verdiSetActWin -dock widgetDock_<CovDetail>
gui_list_select -id CovDetail.1 -list Cover { Assertions  {Cover properties}   } -type { {} {}  }
gui_list_action -id  CovDetail.1 -list {Cover} {Cover properties}  -type {}
gui_list_select -id CovDetail.1 -list Cover { {Cover properties}  {Cover sequences}   } -type { {} {}  }
gui_list_action -id  CovDetail.1 -list {Cover} {Cover sequences}  -type {}
gui_list_action -id  CovDetail.1 -list {Cover} {Cover sequences}  -type {}
gui_list_select -id CovDetail.1 -list Cover { {Cover sequences}  Total   } -type { {} {}  }
gui_list_action -id  CovDetail.1 -list {Cover} Total  -type {}
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Asserts } -id  CoverageTable.1  -test  MergedTest
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertInstList} Assertion
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertInstList} {Cover Property}
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertInstList} {Cover Sequence}
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertInstList} Total
verdiSetActWin -dock widgetDock_<Summary>
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
verdiWindowResize -win $_vdCoverage_1 "85" "399" "1024" "709"
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
gui_list_select -id CoverageTable.1 -list covtblModulesList { /uvm_pkg   } -type { Module  }
gui_list_expand -id  CoverageTable.1   -list {covtblModulesList} /uvm_pkg
gui_list_expand -id CoverageTable.1   /uvm_pkg
gui_list_action -id  CoverageTable.1 -list {covtblModulesList} /uvm_pkg  -type {Module}  -column {} 
gui_covtable_show -show  { Design Hierarchy } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Asserts } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Statistics } -id  CoverageTable.1  -test  MergedTest
gui_list_expand -id  CoverageTable.1   -list {covtblStatModuleList} Assert
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertDefList} Assertion
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertDefList} {Cover Property}
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertDefList} {Cover Sequence}
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertDefList} Total
gui_covtable_show -show  { Tests } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Asserts } -id  CoverageTable.1  -test  MergedTest
gui_list_select -id CoverageTable.1 -list covtblAssertList_flat { {/uvm_pkg.\uvm_component_name_check_visitor::visit .unnamed$$_0}   }
gui_list_action -id  CoverageTable.1 -list {covtblAssertList_flat} {/uvm_pkg.\uvm_component_name_check_visitor::visit .unnamed$$_0}  -column {Assert} 
verdiWindowResize -win $_vdCoverage_1 "85" "399" "1147" "709"
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_list_sort -id  CoverageTable.1   -list {covtblFGroupsList} -descending  {Group}
verdiSetActWin -dock widgetDock_<CovDetail>
gui_list_select -id CovDetail.1 -list Cover { {Assert Name}   } -type { {}  }
gui_list_action -id  CovDetail.1 -list {Cover} {Assert Name}  -type {}
verdiDockWidgetSetCurTab -dock widgetDock_<ExclMgr>
verdiDockWidgetSetCurTab -dock widgetDock_<RMSERVER>
verdiSetActWin -dock widgetDock_<RMSERVER>
verdiDockWidgetSetCurTab -dock widgetDock_Message
verdiSetActWin -dock widgetDock_Message
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Design Hierarchy } -id  CoverageTable.1  -test  MergedTest
verdiSetActWin -dock widgetDock_<Summary>
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Design Hierarchy } -id  CoverageTable.1  -test  MergedTest
gui_list_action -id  CoverageTable.1 -list {covtblInstancesList} uvm_pkg  -column {} 
verdiWindowResize -win $_vdCoverage_1 "85" "399" "1670" "709"
verdiWindowResize -win $_vdCoverage_1 "85" "399" "892" "709"
gui_column_config -id  CoverageTable.1  -list  covtblInstancesList  -show 
gui_column_config -id  CoverageTable.1  -list  covtblInstancesList
gui_list_select -id CoverageTable.1 -list covtblInstancesList { uvm_pkg   }
verdiWindowResize -win $_vdCoverage_1 "85" "399" "1082" "709"
gui_covtable_show -show  { Design Hierarchy } -id  CoverageTable.1  -test  MergedTest
verdiSetActWin -dock widgetDock_<CovSrc.1>
gui_list_select -id CoverageTable.1 -list covtblInstancesList { uvm_pkg   }
gui_list_action -id  CoverageTable.1 -list {covtblInstancesList} uvm_pkg  -column {Assert} 
verdiSetActWin -dock widgetDock_<Summary>
gui_list_action -id  CoverageTable.1 -list {covtblInstancesList} uvm_pkg  -column {Assert} 
gui_list_action -id  CoverageTable.1 -list {covtblInstancesList} uvm_pkg  -column {Assert} 
gui_list_select -id CoverageTable.1 -list covtblInstancesList { uvm_pkg   }
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_list_sort -id  CoverageTable.1   -list {covtblFGroupsList} {Group}
gui_group_mode  -instance
gui_column_config -id  CoverageTable.1  -list  topo_covtblFGroupsList  -col  Instances  -show 
vdCovExit -noprompt
