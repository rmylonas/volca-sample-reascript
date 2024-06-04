reaper.Undo_BeginBlock()

reaper.PreventUIRefresh(1)


--ultraschall.ShowLastErrorMessage()
selected_trk = reaper.GetSelectedTrack( 0, 0 )
_, trackname = reaper.GetSetMediaTrackInfo_String(selected_trk, "P_NAME", "", 0) 


reaper.ShowConsoleMsg(trackname)
reaper.ShowConsoleMsg("\n")

slot_nr = trackname:gsub(".*_(.*)", "%1")
reaper.ShowConsoleMsg(slot_nr)
reaper.ShowConsoleMsg("\n")

-- render to mono
reaper.Main_OnCommand(40789, 0)

-- select all items
reaper.Main_OnCommand(40421, 0)

sel_item =  reaper.GetSelectedMediaItem(0, 0)  
retval, str = reaper.GetSetItemState(sel_item, "")
reaper.ShowConsoleMsg(str)
reaper.ShowConsoleMsg("\n")

os.execute("perl -e 'print(\"coucou\");' > /tmp/a")

-- create new track
-- reaper.Main_OnCommand(40001, 0)
reaper.InsertMedia("/Users/rmylonas/Private/Synthies/samples/drum_kits/80s/kick/XD5Kick03.wav", 1)

       
reaper.PreventUIRefresh(0)
reaper.UpdateArrange()

reaper.Undo_EndBlock("Copy selected items to track, duplicate all track settings", 0)
