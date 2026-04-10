verdiWindowResize -win $_vdCoverage_1 "578" "196" "1602" "1052"
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
gui_set_pref_value -category {ColumnCfg} -key {covtblAssertList_Assert} -value {true}
gui_set_pref_value -category {ColumnCfg} -key {covtblAssertList_Match} -value {false}
gui_set_pref_value -category {ColumnCfg} -key {covtblAssertList_Success} -value {false}
verdiSetActWin -dock widgetDock_<CovDetail>
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
verdiSetActWin -dock widgetDock_<Summary>
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {/$unit::ram_coverage::ram_cg}   }
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} {/$unit::ram_coverage::ram_cg}
gui_list_expand -id CoverageTable.1   {/$unit::ram_coverage::ram_cg}
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {/$unit::ram_coverage::ram_cg}  -column {Group} 
gui_list_select -id CovDetail.1 -list covergroup { {$unit::ram_coverage::ram_cg.cp_addr}  {$unit::ram_coverage::ram_cg.cp_rdata}   } -type { {Cover Group} {Cover Group}  }
verdiSetActWin -dock widgetDock_<CovDetail>
gui_list_select -id CovDetail.1 -list covergroup { {$unit::ram_coverage::ram_cg.cp_rdata}  {$unit::ram_coverage::ram_cg.cp_write}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::ram_coverage::ram_cg.cp_write}  {$unit::ram_coverage::ram_cg.cx_addr_wdata}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::ram_coverage::ram_cg.cx_addr_wdata}  {$unit::ram_coverage::ram_cg.cx_addr_write}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::ram_coverage::ram_cg.cx_addr_write}  {/$unit::ram_coverage::ram_cg}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {/$unit::ram_coverage::ram_cg}  {$unit::ram_coverage::ram_cg.cp_addr}   } -type { {Cover Group} {Cover Group}  }
verdiWindowResize -win $_vdCoverage_1 "908" "195" "1602" "1053"
gui_list_select -id CovDetail.1 -list covergroup { {$unit::ram_coverage::ram_cg.cp_addr}  {$unit::ram_coverage::ram_cg.cp_rdata}   } -type { {Cover Group} {Cover Group}  }
gui_list_set_durable -id ExclMgr.1 -list exclMgrList -option true
gui_list_sort -id  CovDetail.1   -list {covergroup} -descending  {Cover Group Item}
gui_list_sort -id  CovDetail.1   -list {covergroup} {Cover Group Item}
gui_list_select -id CovDetail.1 -list covergroup { {$unit::ram_coverage::ram_cg.cp_rdata}  {$unit::ram_coverage::ram_cg.cp_wdata}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::ram_coverage::ram_cg.cp_wdata}  {$unit::ram_coverage::ram_cg.cp_write}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::ram_coverage::ram_cg.cp_write}  {$unit::ram_coverage::ram_cg.cx_addr_wdata}   } -type { {Cover Group} {Cover Group}  }
verdiDockWidgetMaximize -dock widgetDock_<CovDetail>
verdiWindowResize -win $_vdCoverage_1 "960" "192" "1602" "1186"
verdiWindowResize -win $_vdCoverage_1 "960" "53" "1602" "1325"
gui_list_select -id CovDetail.1 -list covergroup { {$unit::ram_coverage::ram_cg.cx_addr_wdata}  {$unit::ram_coverage::ram_cg.cx_addr_write}   } -type { {Cover Group} {Cover Group}  }
vdCovExit -noprompt
