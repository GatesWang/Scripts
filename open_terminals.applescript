
# tell application "Finder" to open the startup disk
#use alt + return
set directories to {"/Users/wangates/simulator/src/LilyRoutingEngineSimulator", Â
	"/Users/wangates/simulator/src/LilyRoutingRefactoredEngine", Â
	"/Users/wangates/telephony/src/TelephonyRoutingService"}

repeat with theCurrentListItem in directories
	tell application "Terminal"
		activate
		#do script 
		do script "cd " & theCurrentListItem
	end tell
	delay 0.2
end repeat

(*
tell application "System Events"
	tell process "Finder"
		#click menu item "Merge All Windows" of menu "Window" of menu bar 1
	end tell
end tell
*)




