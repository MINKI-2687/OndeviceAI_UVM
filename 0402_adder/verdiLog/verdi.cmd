simSetSimulator "-vcssv" -exec "./simv" -args
debImport "-dbdir" "./simv.daidir/"
debLoadSimResult /home/hedu04/KMK/0402_adder/wave.fsdb
wvCreateWindow
verdiSetActWin -win $_nWave2
verdiWindowResize -win $_Verdi_1 "238" "449" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowResize -win $_Verdi_1 "198" "283" "1147" "897"
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_adder"
verdiSetActWin -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_adder/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_adder"
wvGetSignalSetScope -win $_nWave2 "/tb_adder"
wvGetSignalSetScope -win $_nWave2 "/tb_adder/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_adder"
wvGetSignalSetScope -win $_nWave2 "/tb_adder/dut"
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_adder/a\[7:0\]} \
{/tb_adder/b\[7:0\]} \
{/tb_adder/y\[8:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 )} 
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
srcHBSelect "tb_adder.dut" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
wvSelectGroup -win $_nWave2 {G1}
verdiSetActWin -win $_nWave2
wvSelectGroup -win $_nWave2 {G1}
wvSelectGroup -win $_nWave2 {G1}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_adder/dut"
wvGetSignalClose -win $_nWave2
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSelectGroup -win $_nWave2 {G1}
verdiSetActWin -win $_nWave2
wvSelectGroup -win $_nWave2 {G2}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSelectGroup -win $_nWave2 {G1}
wvSelectGroup -win $_nWave2 {G1}
verdiDockWidgetSetCurTab -dock widgetDock_<Message>
verdiSetActWin -dock widgetDock_<Message>
verdiDockWidgetSetCurTab -dock windowDock_OneSearch
verdiSetActWin -win $_OneSearch
verdiDockWidgetSetCurTab -dock widgetDock_<Message>
verdiSetActWin -dock widgetDock_<Message>
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
verdiSetActWin -win $_nWave2
srcHBSelect "tb_adder.dut" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "tb_adder" -win $_nTrace1
srcHBSelect "tb_adder.dut" -win $_nTrace1
srcHBSelect "tb_adder.dut" -win $_nTrace1
srcSetScope "tb_adder.dut" -delim "." -win $_nTrace1
srcHBSelect "tb_adder.dut" -win $_nTrace1
srcHBSelect "tb_adder.dut" -win $_nTrace1
srcSetScope "tb_adder.dut" -delim "." -win $_nTrace1
srcHBSelect "tb_adder.dut" -win $_nTrace1
srcHBSelect "tb_adder" -win $_nTrace1
srcSetScope "tb_adder" -delim "." -win $_nTrace1
srcHBSelect "tb_adder" -win $_nTrace1
verdiDockWidgetSetCurTab -dock widgetDock_<Decl._Tree>
verdiSetActWin -dock widgetDock_<Decl._Tree>
srcTBBTreeSelect -win $_nTrace1 -path "adder"
srcTBBTreeSelect -win $_nTrace1 -path "tb_adder"
srcTBBTreeSelect -win $_nTrace1 -path "adder"
srcTBBTreeSelect -win $_nTrace1 -path "tb_adder"
srcTBBTreeSelect -win $_nTrace1 -path "adder"
srcTBTreeAction -win $_nTrace1 -path "adder"
srcTBBTreeSelect -win $_nTrace1 -path "tb_adder"
srcTBTreeAction -win $_nTrace1 -path "tb_adder"
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "tb_adder.dut" -win $_nTrace1
srcSetScope "tb_adder.dut" -delim "." -win $_nTrace1
srcHBSelect "tb_adder.dut" -win $_nTrace1
srcHBSelect "tb_adder" -win $_nTrace1
srcSetScope "tb_adder" -delim "." -win $_nTrace1
srcHBSelect "tb_adder" -win $_nTrace1
srcHBSelect "tb_adder.dut" -win $_nTrace1
srcHBSelect "tb_adder.dut" -win $_nTrace1
srcHBSelect "tb_adder.dut" -win $_nTrace1
srcHBSelect "tb_adder.dut" -win $_nTrace1
srcHBSelect "tb_adder" -win $_nTrace1
srcSetScope "tb_adder" -delim "." -win $_nTrace1
srcHBSelect "tb_adder" -win $_nTrace1
srcHBSelect "tb_adder" -win $_nTrace1
srcHBSelect "tb_adder" -win $_nTrace1
srcSetScope "tb_adder" -delim "." -win $_nTrace1
srcHBSelect "tb_adder" -win $_nTrace1
srcHBDrag -win $_nTrace1
wvSetPosition -win $_nWave2 {("dut" 0)}
wvRenameGroup -win $_nWave2 {G1} {dut}
wvAddSignal -win $_nWave2 "/tb_adder/dut/a\[7:0\]" "/tb_adder/dut/b\[7:0\]" \
           "/tb_adder/dut/y\[8:0\]"
wvSetPosition -win $_nWave2 {("dut" 0)}
wvSetPosition -win $_nWave2 {("dut" 3)}
wvSetPosition -win $_nWave2 {("dut" 3)}
wvSelectSignal -win $_nWave2 {( "dut" 3 )} 
verdiSetActWin -win $_nWave2
wvSelectSignal -win $_nWave2 {( "dut" 2 )} 
wvSelectGroup -win $_nWave2 {dut}
srcTBInvokeSim
verdiSetActWin -dock widgetDock_<Member>
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
verdiSetActWin -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
verdiDockWidgetSetCurTab -dock windowDock_InteractiveConsole_3
verdiSetActWin -win $_InteractiveConsole_3
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
verdiSetActWin -win $_nWave2
srcHBSelect "tb_adder.dut" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Local>
verdiSetActWin -dock widgetDock_<Local>
verdiDockWidgetSetCurTab -dock widgetDock_<Object._Tree>
verdiSetActWin -dock widgetDock_<Object._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>
verdiSetActWin -dock widgetDock_<Inst._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Decl._Tree>
verdiSetActWin -dock widgetDock_<Decl._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcTBRunSim
wvZoomAll -win $_nWave2
verdiSetActWin -win $_nWave2
verdiDockWidgetSetCurTab -dock windowDock_InteractiveConsole_3
verdiSetActWin -win $_InteractiveConsole_3
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
verdiSetActWin -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomAll -win $_nWave2
srcHBSelect "tb_adder.dut" -win $_nTrace1
srcSetScope "tb_adder.dut" -delim "." -win $_nTrace1
srcHBSelect "tb_adder.dut" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "tb_adder" -win $_nTrace1
srcSetScope "tb_adder" -delim "." -win $_nTrace1
srcHBSelect "tb_adder" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "a" -line 2 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcTBInsertDataTree -win $_nTrace1 -tab 1 -tree "tb_adder.a\[7:0\]"
srcDeselectAll -win $_nTrace1
srcSelect -signal "b" -line 2 -pos 1 -win $_nTrace1
srcSelect -win $_nTrace1 -range {1 2 1 13 1 1} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "b" -line 2 -pos 1 -win $_nTrace1
srcTBInsertDataTree -win $_nTrace1 -tab 1 -tree "tb_adder.b\[7:0\]"
srcDeselectAll -win $_nTrace1
srcSelect -signal "y" -line 3 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("dut" 0)}
srcTBInsertDataTree -win $_nTrace1 -tab 1 -tree "tb_adder.y\[8:0\]"
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "b" -line 14 -pos 1 -win $_nTrace1
srcSelect -win $_nTrace1 -range {14 14 1 9 1 1}
srcTBAddBrkPnt -line 14 -file /home/hedu04/KMK/0402_adder/tb_adder.sv
srcSelect -win $_nTrace1 -range {14 14 1 9 1 1}
srcTBSetBrkPnt -disable -index 1
srcSelect -win $_nTrace1 -range {14 14 1 9 1 1}
srcTBSetBrkPnt -delete -index 1
srcSelect -win $_nTrace1 -range {14 14 1 9 1 1}
srcTBAddBrkPnt -line 14 -file /home/hedu04/KMK/0402_adder/tb_adder.sv
srcTBSimReset
srcTBRunSim
srcTBRunSim
srcSelect -win $_nTrace1 -range {13 13 1 9 1 1}
srcTBAddBrkPnt -line 13 -file /home/hedu04/KMK/0402_adder/tb_adder.sv
srcSelect -win $_nTrace1 -range {14 14 1 9 1 1}
srcTBSetBrkPnt -disable -index 1
srcSelect -win $_nTrace1 -range {14 14 1 9 1 1}
srcTBSetBrkPnt -delete -index 1
srcTBSimReset
srcTBRunSim
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
wvZoomAll -win $_nWave2
verdiSetActWin -win $_nWave2
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBSimReset
srcTBRunSim
srcTBStepIn
srcTBStepIn
srcTBStepIn
srcTBStepIn
srcTBStepIn
srcTBStepIn
srcTBStepNext
srcTBStepNext
srcTBStepNext
verdiDockWidgetSetCurTab -dock windowDock_InteractiveConsole_3
verdiSetActWin -win $_InteractiveConsole_3
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
verdiSetActWin -win $_nWave2
verdiDockWidgetSetCurTab -dock windowDock_InteractiveConsole_3
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
srcSelect -win $_nTrace1 -range {13 13 1 9 1 1}
srcTBSetBrkPnt -disable -index 1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcSelect -win $_nTrace1 -range {13 13 1 9 1 1}
srcTBSetBrkPnt -delete -index 1
srcSelect -win $_nTrace1 -range {13 13 1 9 1 1}
srcTBAddBrkPnt -line 13 -file /home/hedu04/KMK/0402_adder/tb_adder.sv
srcDeselectAll -win $_nTrace1
srcSelect -signal "a" -line 2 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "b" -line 2 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "a" -line 2 -pos 1 -win $_nTrace1
srcTBRunSim
srcTBSimReset
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBRunSim
wvZoomAll -win $_nWave2
verdiSetActWin -win $_nWave2
verdiDockWidgetSetCurTab -dock windowDock_InteractiveConsole_3
verdiSetActWin -win $_InteractiveConsole_3
srcSelect -win $_nTrace1 -range {13 13 1 9 1 1}
srcTBSetBrkPnt -disable -index 1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcTBAddBrkPnt -line 11 -file /home/hedu04/KMK/0402_adder/tb_adder.sv
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {13 13 1 9 1 1}
srcTBSetBrkPnt -delete -index 1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debExit
