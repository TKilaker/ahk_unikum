; UA
; Open support ticket on selected text.
+§::
	IfWinExist, Unikum datasystem ab
	{
		; Save clipboard content for later use.
		OldClipBoardContentAll := ClipboardAll
		OldClipBoardContent := Clipboard
		; Get selected text
		Send, ^c
		ClipWait,1
		SelectedText := ClipBoard
		; If something was selected that seems resonable, open, hopefully a number, in UA.
		if ((StrLen(SelectedText)>=5) && (StrLen(SelectedText)<=10)){
			WinActivate
			ControlFocus, Edit1
			Send, 21
			Send, {Enter}
			Send, %SelectedText%
			Send, {Enter}
		} else {
			MsgBox, Could not detect a number.
		}
		; Load old clipboard content.
		ClipBoard := OldClipBoardContentAll
	}
	 Else
	{
		MsgBox, Could not find UA. UA needs to be running.
	}
Return


; UA
; Open bug ticket on selected text.
§::
	IfWinExist, Unikum datasystem ab
	{
		; Save clipboard content for later use.
		OldClipBoardContentAll := ClipboardAll
		OldClipBoardContent := Clipboard
		Send, ^c
		ClipWait,1
		SelectedText := ClipBoard
		; If something was selected that seems resonable, open, hopefully a number, in UA.
		if ((StrLen(SelectedText)>=5) && (StrLen(SelectedText)<=10)){
			WinActivate
			ControlFocus, Edit1
			Send, 30
			Send, {Enter}
			Send, %SelectedText%
			Send, {Enter}
		} else {
			MsgBox, Could not detect a number.
		}
		; Load old clipboard content.
		ClipBoard := OldClipBoardContentAll
	}
	 Else
	{
		MsgBox, Could not find UA. UA needs to be running.
	}
Return


; Mouse 4:
; CTRL+Shift+F9
#If WinActive("ahk_exe pbs.exe") or WinActive("ahk_exe krutw32.exe") or WinActive("ahk_exe stub32.exe")
{
	XButton1::
		send, {ctrl down}{shift down}{F9 down}
		sleep 5	
		send, {F9 up}{ctrl up}{shift up}
	Return	
}


; Mouse 5:
; CTRL+Shift+F7
#If WinActive("ahk_exe pbs.exe") or WinActive("ahk_exe krutw32.exe")
{
	XButton2::
		send, {ctrl down}{shift down}{F7 down}
		sleep 5
		send, {F7 up}{ctrl up}{shift up}
	Return
}


; CTRL+(§)
; CTRL+F7 (compile VK)
#If WinActive("ahk_exe Kosmos.exe")
{
	^§::
		send, {ctrl down}{F7 down}
		sleep 5
		send, {ctrl up}{F7 up}
	Return
}


/*
; UA, Visa ärende
; OBS! Under utveckling.
+§::
	IfWinExist, Unikum datasystem ab
	{
		OldClipBoardContent := ClipboardAll
		Send, ^c
		ClipWait,1
		WinActivate
		ControlFocus, Edit1
		Send, 30
		Send, {Enter}
		Send, %ClipBoard%
		Send, {Enter}
		Sleep 1000
		If WinActive("ahk_class #32770")
		{
			; WinActivate
			ControlGetText, OutputVar, Edit41
			ToolTip, %OutputVar%, 300, 500
			MsgBox OK to quit
			ToolTip
		}
		ClipBoard := OldClipBoardContent
	}
	 Else
	{
		MsgBox, Kunde inte hitta UA.
	}
Return
*/