set vpnName to display dialog "VPN's Name:" ""
set vpnAddress to display dialog "VPN's Address:" ""
set vpnUsername to display dialog "Username:" ""
set vpnPassword to display dialog "Password:" ""
on createVPN(vpnName)
	tell application "System Preferences"
		reveal pane "com.apple.preference.network"
		activate
		
		tell application "System Events"
			tell process "System Preferences"
				tell window 1
					click button 10 -- "Add Service"
					tell sheet 1
						-- set location type
						click pop up button 1
						click menu item "VPN" of menu 1 of pop up button 1
						delay 1
						
						-- set connection type
						click pop up button 2
						click menu item "L2TP over IPSec" of menu 1 of pop up button 2
						delay 1
						
						-- set name of the service
						-- for some reason the standard 'set value of text field 1' would not work
						set value of text field 1 to vpnName
						click button 1 -- "Create"
					end tell
					click button 7 -- "Apply"
				end tell
			end tell
		end tell
	end tell
end createVPN

on updateVPN(vpnName, vpnAddress, vpnUsername, vpnPassword)
	tell application "System Preferences"
		reveal pane "com.apple.preference.network"
		activate
		
		tell application "System Events"
			tell process "System Preferences"
				tell window 1
					repeat with r in rows of table 1 of scroll area 1
						if (value of attribute "AXValue" of static text 1 of r as string) contains vpnName then
							select r
						end if
					end repeat
					
					-- Set the address and username
					tell group 1
						set value of text field 1 to vpnAddress
						set value of text field 2 to vpnUsername
						click button 2 -- "Authentication Settings…"
					end tell
					
					-- Set password
					tell sheet 1
						set value of text field 1 to vpnPassword
						click button 1 -- "Ok"
					end tell
					
					click button 7 -- "Apply"
				end tell
			end tell
		end tell
	end tell
end updateVPN



