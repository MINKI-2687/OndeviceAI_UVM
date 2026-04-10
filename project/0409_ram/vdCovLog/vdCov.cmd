verdiWindowResize -win $_vdCoverage_1 "750" "65" "1765" "1300"
gui_set_pref_value -category {coveragesetting} -key {geninfodumping} -value 1
gui_exclusion -set_force true
verdiSetFont  -font  {DejaVu Sans}  -size  11
verdiSetFont -font "DejaVu Sans" -size "11"
gui_assert_mode -mode flat
gui_class_mode -mode hier
gui_excl_mgr_flat_list -on  0
gui_covdetail_select -id  CovDetail.1   -name   Line
verdiWindowWorkMode -win $_vdCoverage_1 -coverageAnalysis
gui_open_cov  -hier coverage.vdb -testdir {} -test {coverage/sim1} -merge MergedTest -db_max_tests 10 -sdc_level 1 -fsm transition
verdiSetActWin -dock widgetDock_<CovDetail>
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
verdiSetActWin -dock widgetDock_<Summary>
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {/$unit::ram_coverage::ram_cg}   }
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} {/$unit::ram_coverage::ram_cg}
gui_list_expand -id CoverageTable.1   {/$unit::ram_coverage::ram_cg}
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {/$unit::ram_coverage::ram_cg}  -column {Group} 
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_summarybar_goto -id  CovSrc.1   180
verdiSetActWin -dock widgetDock_<CovSrc.1>
verdiSetActWin -dock widgetDock_<CovDetail>
gui_list_select -id CovDetail.1 -list covergroup { {$unit::ram_coverage::ram_cg.cp_addr}  {$unit::ram_coverage::ram_cg.cp_rdata}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::ram_coverage::ram_cg.cp_rdata}  {$unit::ram_coverage::ram_cg.cp_addr}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::ram_coverage::ram_cg.cp_addr}  {$unit::ram_coverage::ram_cg.cp_rdata}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::ram_coverage::ram_cg.cp_rdata}  {$unit::ram_coverage::ram_cg.cp_wdata}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::ram_coverage::ram_cg.cp_wdata}  {$unit::ram_coverage::ram_cg.cp_wr}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::ram_coverage::ram_cg.cp_wr}  {$unit::ram_coverage::ram_cg.cx_addr_wdata}   } -type { {Cover Group} {Cover Group}  }
gui_filter_by_column_value_apply -id CovDetail.1 -list {covergroup detail} -col cp_wdata -action show
gui_filter_by_column_value_apply -id CovDetail.1 -list {covergroup detail}  -col cp_wdata -action unselect  -value {{(Select All)}}
gui_filter_by_column_value_apply -id CovDetail.1 -list {covergroup detail}  -col cp_wdata -action select  -value {{max}}
gui_filter_by_column_value_apply -id CovDetail.1 -list {covergroup detail}  -col cp_wdata -action select  -value {{zero}}
gui_filter_by_column_value_apply -id CovDetail.1 -list {covergroup detail} -action apply -col cp_wdata
gui_filter_by_column_value_apply -id CovDetail.1 -list {covergroup detail} -col cp_wdata -action show
gui_filter_by_column_value_apply -id CovDetail.1 -list {covergroup detail}  -col cp_wdata -action select  -value {{(Select All)}}
gui_filter_by_column_value_apply -id CovDetail.1 -list {covergroup detail} -action apply -col cp_wdata
gui_list_select -id CovDetail.1 -list covergroup { {$unit::ram_coverage::ram_cg.cx_addr_wdata}  {$unit::ram_coverage::ram_cg.cx_addr_wr}   } -type { {Cover Group} {Cover Group}  }
vdCovExit -noprompt
