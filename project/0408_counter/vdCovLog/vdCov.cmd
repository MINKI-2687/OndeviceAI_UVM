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
gui_open_cov  -hier coverage.vdb -testdir {} -test {coverage/sim1} -merge MergedTest -db_max_tests 10 -sdc_level 1 -fsm transition
verdiWindowResize -win $_vdCoverage_1 "830" "370" "985" "709"
verdiWindowResize -win $_vdCoverage_1 "830" "346" "985" "733"
verdiWindowResize -win $_vdCoverage_1 "36" "271" "1290" "930"
gui_list_select -id CoverageTable.1 -list covtblInstancesList { uvm_pkg   }
verdiSetActWin -dock widgetDock_<Summary>
verdiWindowResize -win $_vdCoverage_1 "36" "271" "1291" "932"
gui_list_action -id  CoverageTable.1 -list {covtblInstancesList} uvm_pkg  -column {} 
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} {/$unit::counter_coverage::counter_cg}
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_count}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_count}  {$unit::counter_coverage::counter_cg.cp_enable}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_enable}  {$unit::counter_coverage::counter_cg.cp_count}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cp_count}  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_count}  {$unit::counter_coverage::counter_cg.cx_rst_en}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_rst_en}  {$unit::counter_coverage::counter_cg.cx_en_count}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_en_count}  {$unit::counter_coverage::counter_cg.cp_enable}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cp_enable}  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_enable}  {$unit::counter_coverage::counter_cg.cp_count}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cp_count}  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_count}  {$unit::counter_coverage::counter_cg.cx_en_count}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cx_en_count}  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_en_count}  {$unit::counter_coverage::counter_cg.cx_rst_en}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cx_rst_en}  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_rst_en}  {$unit::counter_coverage::counter_cg.cx_en_count}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cx_en_count}  -column {Group} 
gui_covtable_show -show  { Asserts } -id  CoverageTable.1  -test  MergedTest
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertInstList} Assertion
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertInstList} {Cover Property}
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertInstList} {Cover Sequence}
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertInstList} Total
gui_list_select -id CoverageTable.1 -list covtblAssertList_flat { {/uvm_pkg.\uvm_reg_map::do_read .unnamed$$_0.unnamed$$_1}   }
gui_covtable_show -show  { Statistics } -id  CoverageTable.1  -test  MergedTest
gui_list_expand -id  CoverageTable.1   -list {covtblStatModuleList} Assert
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertDefList} Assertion
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertDefList} {Cover Property}
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertDefList} {Cover Sequence}
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertDefList} Total
gui_covtable_show -show  { Tests } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cx_en_count}  -column {Group} 
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{[off],[max , high , low]}}   }
verdiSetActWin -dock widgetDock_<CovDetail>
gui_filter_by_column_value_apply -id CovDetail.1 -list {covergroup detail} -col cp_count -action show
gui_filter_by_column_value_apply -id CovDetail.1 -list {covergroup detail} -col cp_count -action hide
verdiWindowResize -win $_vdCoverage_1 "36" "271" "1427" "932"
verdiWindowResize -win $_vdCoverage_1 -6 "273" "1075" "932"
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_en_count}  {$unit::counter_coverage::counter_cg.cp_count}   }
verdiSetActWin -dock widgetDock_<Summary>
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cx_en_count}  {$unit::counter_coverage::counter_cg.cp_count}   } -type { {Cover Group} {Cover Group}  }
gui_list_action -id  CovDetail.1 -list {covergroup} {$unit::counter_coverage::counter_cg.cp_count}  -type {Cover Group}
verdiSetActWin -dock widgetDock_<CovDetail>
verdiWindowResize -win $_vdCoverage_1 -6 "273" "1263" "932"
gui_list_select -id CovDetail.1 -list {covergroup detail} { high   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { high  zero   }
gui_list_action -id  CovDetail.1 -list {covergroup detail} zero
verdiWindowResize -win $_vdCoverage_1 -6 "273" "1469" "932"
verdiDockWidgetSetCurTab -dock widgetDock_<HvpDetail>
verdiSetActWin -dock widgetDock_<HvpDetail>
verdiDockWidgetSetCurTab -dock widgetDock_<CovDetail>
verdiSetActWin -dock widgetDock_<CovDetail>
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cp_count}   } -type { {Cover Group}  }
gui_list_action -id  CovDetail.1 -list {covergroup} {$unit::counter_coverage::counter_cg.cp_count}  -type {Cover Group}
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cp_count}  {$unit::counter_coverage::counter_cg.cp_enable}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cp_enable}  {$unit::counter_coverage::counter_cg.cp_rst_n}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cp_rst_n}  {$unit::counter_coverage::counter_cg.cp_enable}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cp_enable}  {$unit::counter_coverage::counter_cg.cp_rst_n}   } -type { {Cover Group} {Cover Group}  }
gui_list_action -id  CovDetail.1 -list {covergroup} {$unit::counter_coverage::counter_cg.cp_rst_n}  -type {Cover Group}
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cp_rst_n}  {$unit::counter_coverage::counter_cg.cp_enable}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cp_enable}  {$unit::counter_coverage::counter_cg.cp_rst_n}   } -type { {Cover Group} {Cover Group}  }
gui_list_action -id  CovDetail.1 -list {covergroup} {$unit::counter_coverage::counter_cg.cp_rst_n}  -type {Cover Group}
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cp_rst_n}  {$unit::counter_coverage::counter_cg.cp_enable}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cp_enable}  {$unit::counter_coverage::counter_cg.cp_rst_n}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cp_rst_n}  {$unit::counter_coverage::counter_cg.cx_en_count}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cx_en_count}   } -type { {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cx_rst_en}   } -type { {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cx_rst_en}  {$unit::counter_coverage::counter_cg.cx_en_count}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{[off],[max , high , low]}}   }
gui_list_action -id  CovDetail.1 -list {covergroup detail} {{[off],[max , high , low]}}
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{[off],[max , high , low]}}  {{[on],[max]}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{[on],[max]}}  {{off,zero}}   }
gui_list_action -id  CovDetail.1 -list {covergroup detail} {{off,zero}}
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{off,zero}}  {{on,zero}}   }
gui_covtable_show -show  { Design Hierarchy } -id  CoverageTable.1  -test  MergedTest
verdiSetActWin -dock widgetDock_<Summary>
gui_list_action -id  CoverageTable.1 -list {covtblInstancesList} uvm_pkg  -column {} 
verdiSetActWin -dock widgetDock_<CovDetail>
gui_list_select -id CovDetail.1 -list Cover { {Cover properties}   } -type { {}  }
gui_list_select -id CovDetail.1 -list Cover { {Cover properties}  {Cover sequences}   } -type { {} {}  }
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
verdiSetActWin -dock widgetDock_<Summary>
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
gui_list_expand -id  CoverageTable.1   -list {covtblModulesList} /uvm_pkg
gui_list_select -id CoverageTable.1 -list covtblModulesList { /uvm_pkg/uvm_pkg   } -type { Scope  }
gui_list_action -id  CoverageTable.1 -list {covtblModulesList} /uvm_pkg/uvm_pkg  -type {Scope}  -column {} 
gui_list_select -id CoverageTable.1 -list covtblModulesList { /uvm_pkg/uvm_pkg  /uvm_pkg   } -type { Scope Module  }
gui_list_action -id  CoverageTable.1 -list {covtblModulesList} /uvm_pkg  -type {Module}  -column {} 
gui_list_select -id CoverageTable.1 -list covtblModulesList { /uvm_pkg  /uvm_pkg/uvm_pkg   } -type { Module Scope  }
gui_list_action -id  CoverageTable.1 -list {covtblModulesList} /uvm_pkg/uvm_pkg  -type {Scope}  -column {} 
gui_list_action -id  CoverageTable.1 -list {covtblModulesList} /uvm_pkg/uvm_pkg  -type {Scope}  -column {} 
gui_list_select -id CovDetail.1 -list Cover { Total   } -type { {}  }
verdiSetActWin -dock widgetDock_<CovDetail>
gui_list_select -id CovDetail.1 -list Cover { Total  Assertions   } -type { {} {}  }
gui_list_select -id CovDetail.1 -list Cover { Assertions  {Cover properties}   } -type { {} {}  }
gui_list_select -id CovDetail.1 -list Cover { {Cover properties}  Total   } -type { {} {}  }
gui_list_select -id CovDetail.1 -list Cover { Total  Assertions   } -type { {} {}  }
gui_covtable_show -show  { Design Hierarchy } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Design Hierarchy } -id  CoverageTable.1  -test  MergedTest
verdiSetActWin -dock widgetDock_<CovSrc.1>
gui_list_select -id CoverageTable.1 -list covtblInstancesList { uvm_pkg   }
verdiSetActWin -dock widgetDock_<Summary>
gui_covtable_show -show  { Statistics } -id  CoverageTable.1  -test  MergedTest
verdiWindowResize -win $_vdCoverage_1 "137" "929" "2236" "932"
gui_covtable_show -show  { Tests } -id  CoverageTable.1  -test  MergedTest
gui_list_select -id CoverageTable.1 -list covtblTestSummaryList { coverage/sim1   }
gui_list_action -id  CoverageTable.1 -list {covtblTestSummaryList} coverage/sim1  -column {Test Name/Test Location} 
gui_covtable_show -show  { Statistics } -id  CoverageTable.1  -test  MergedTest
gui_list_select -id CoverageTable.1 -list covtblStatModuleList { Assert   }
gui_list_select -id CoverageTable.1 -list covtblStatModuleList { Assert  {In Module}   }
gui_list_select -id CoverageTable.1 -list covtblStatModuleList { {In Module}  Total   }
gui_list_select -id CoverageTable.1 -list covtblStatModuleList { Total  Average   }
gui_list_action -id  CoverageTable.1 -list {covtblStatModuleList} Average  -column {} 
gui_list_action -id  CoverageTable.1 -list {covtblStatModuleList} Total  -column {Total} 
gui_list_select -id CoverageTable.1 -list covtblStatCodeList { Assert   }
gui_list_select -id CoverageTable.1 -list covtblStatCodeList { Assert  Total   }
gui_list_action -id  CoverageTable.1 -list {covtblStatCodeList} Total  -column {Metric} 
gui_list_select -id CoverageTable.1 -list covtblStatCodeList { Total  Assert   }
gui_list_action -id  CoverageTable.1 -list {covtblStatCodeList} Assert  -column {Metric} 
gui_list_select -id CoverageTable.1 -list covtblStatCodeList { Assert   }
gui_covtable_show -show  { Asserts } -id  CoverageTable.1  -test  MergedTest
gui_list_select -id CoverageTable.1 -list covtblAssertList_flat { {/uvm_pkg.\uvm_reg_map::do_read .unnamed$$_0.unnamed$$_1}  {/uvm_pkg.\uvm_component_name_check_visitor::visit .unnamed$$_0}   }
gui_list_select -id CoverageTable.1 -list covtblAssertList_flat { {/uvm_pkg.\uvm_component_name_check_visitor::visit .unnamed$$_0}  {/uvm_pkg.\uvm_reg_map::do_read .unnamed$$_0.unnamed$$_1}   }
gui_list_action -id  CoverageTable.1 -list {covtblAssertList_flat} {/uvm_pkg.\uvm_reg_map::do_read .unnamed$$_0.unnamed$$_1}  -column {Assert} 
gui_list_select -id CoverageTable.1 -list covtblAssertList_flat { {/uvm_pkg.\uvm_reg_map::do_read .unnamed$$_0.unnamed$$_1}  {/uvm_pkg.\uvm_component_name_check_visitor::visit .unnamed$$_0}   }
gui_list_action -id  CoverageTable.1 -list {covtblAssertList_flat} {/uvm_pkg.\uvm_component_name_check_visitor::visit .unnamed$$_0}  -column {Assert} 
gui_list_select -id CoverageTable.1 -list covtblAssertList_flat { {/uvm_pkg.\uvm_component_name_check_visitor::visit .unnamed$$_0}  {/uvm_pkg.\uvm_reg_map::do_read .unnamed$$_0.unnamed$$_1}   }
gui_list_action -id  CoverageTable.1 -list {covtblAssertList_flat} {/uvm_pkg.\uvm_reg_map::do_read .unnamed$$_0.unnamed$$_1}  -column {Assert} 
gui_list_select -id CoverageTable.1 -list covtblAssertList_flat { {/uvm_pkg.\uvm_reg_map::do_read .unnamed$$_0.unnamed$$_1}  {/uvm_pkg.\uvm_reg_map::do_write .unnamed$$_0.unnamed$$_1}   }
gui_list_action -id  CoverageTable.1 -list {covtblAssertList_flat} {/uvm_pkg.\uvm_reg_map::do_write .unnamed$$_0.unnamed$$_1}  -column {Assert} 
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_count}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_en_count}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cx_en_count}  -column {Group} 
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{[off],[max , high , low]}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{[off],[max , high , low]}}  {{[on],[max]}}   }
verdiSetActWin -dock widgetDock_<CovDetail>
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{[on],[max]}}  {{[off],[max , high , low]}}   }
gui_filter_by_column_value_apply -id CovDetail.1 -list {covergroup detail} -col cp_count -action show
gui_filter_by_column_value_apply -id CovDetail.1 -list {covergroup detail} -col cp_count -action hide
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{[off],[max , high , low]}}  {{[on],[max]}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{[on],[max]}}  {{[off],[max , high , low]}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{[off],[max , high , low]}}  {{[on],[max]}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{[on],[max]}}  {{[off],[max , high , low]}}   }
gui_filter_by_column_value_apply -id CovDetail.1 -list {covergroup detail} -col cp_count -action show
gui_filter_by_column_value_apply -id CovDetail.1 -list {covergroup detail} -col cp_count -action hide
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{[off],[max , high , low]}}  {{[on],[max]}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{[on],[max]}}  {{off,zero}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{off,zero}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{[on],[max]}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{[on],[max]}}  {{off,zero}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{off,zero}}  {{on,high}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{on,high}}  {{on,zero}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{on,zero}}  {{on,high}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{on,high}}  {{[off],[max , high , low]}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{[off],[max , high , low]}}  {{[on],[max]}}   }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cx_en_count}  {$unit::counter_coverage::counter_cg.cx_rst_en}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{[active],[on]}}   }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cx_rst_en}  {$unit::counter_coverage::counter_cg.cx_en_count}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{on,high}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{on,high}}  {{on,low}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{on,low}}  {{on,zero}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{on,zero}}  {{on,high}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{on,high}}  {{on,low}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{on,low}}  {{on,high}}   }
gui_list_action -id  CovDetail.1 -list {covergroup detail} {{on,high}}
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cx_en_count}  {$unit::counter_coverage::counter_cg.cp_count}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cp_count}  {$unit::counter_coverage::counter_cg.cp_enable}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cp_enable}  {$unit::counter_coverage::counter_cg.cp_rst_n}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cp_rst_n}  {$unit::counter_coverage::counter_cg.cp_enable}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cp_enable}  {$unit::counter_coverage::counter_cg.cp_rst_n}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cp_rst_n}  {/$unit::counter_coverage::counter_cg}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {/$unit::counter_coverage::counter_cg}  {$unit::counter_coverage::counter_cg.cp_count}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cp_count}  {$unit::counter_coverage::counter_cg.cx_en_count}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cx_en_count}  {$unit::counter_coverage::counter_cg.cx_rst_en}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cx_rst_en}  {$unit::counter_coverage::counter_cg.cx_en_count}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_en_count}  {/$unit::counter_coverage::counter_cg}   }
verdiSetActWin -dock widgetDock_<Summary>
gui_covtable_show -show  { Asserts } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
gui_list_select -id CoverageTable.1 -list covtblModulesList { /uvm_pkg/uvm_pkg  /uvm_pkg   } -type { Scope Module  }
gui_covtable_show -show  { Design Hierarchy } -id  CoverageTable.1  -test  MergedTest
verdiDockWidgetSetCurTab -dock widgetDock_<ExclMgr>
verdiSetActWin -dock widgetDock_<ExclMgr>
verdiDockWidgetSetCurTab -dock widgetDock_<RMSERVER>
verdiDockWidgetSetCurTab -dock widgetDock_<ExclMgr>
verdiDockWidgetSetCurTab -dock widgetDock_Message
verdiSetActWin -dock widgetDock_Message
verdiDockWidgetSetCurTab -dock widgetDock_<ExclMgr>
verdiSetActWin -dock widgetDock_<ExclMgr>
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_src_expand -id { CovSrc.1 } -fid  0  -line 1
verdiSetActWin -dock widgetDock_<CovSrc.1>
gui_src_collapse -id { CovSrc.1 } -fid  0  -line 1
gui_src_expand -id { CovSrc.1 } -fid  0  -line 4
gui_src_collapse -id { CovSrc.1 } -fid  0  -line 4
gui_src_expand -id { CovSrc.1 } -fid  0  -line 402
gui_src_collapse -id { CovSrc.1 } -fid  0  -line 402
gui_src_expand -id { CovSrc.1 } -fid  0  -line 402
gui_src_collapse -id { CovSrc.1 } -fid  0  -line 402
gui_src_expand -id { CovSrc.1 } -fid  0  -line 1
gui_src_expand -id { CovSrc.1 } -fid  1  -line 93
gui_src_collapse -id { CovSrc.1 } -fid  1  -line 93
gui_src_expand -id { CovSrc.1 } -fid  1  -line 100
gui_src_collapse -id { CovSrc.1 } -fid  1  -line 100
gui_src_expand -id { CovSrc.1 } -fid  1  -line 99
gui_src_collapse -id { CovSrc.1 } -fid  1  -line 99
vdCovExit -noprompt
