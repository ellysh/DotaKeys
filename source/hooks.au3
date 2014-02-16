; Global hooks
HotKeySet($kStartKey, "_GrabWindow")
HotKeySet($kExitKey, "_Exit")
HotKeySet($kPauseKey, "_TogglePause")

global $gIsGrab = false
Global $gIsPaused = false

func _Exit()
	exit
endfunc

func _GrabWindow()
	$gIsGrab = true
endfunc

func _TogglePause()
	HotKeySet($kPauseKey)
	Send($kPauseKey)
	HotKeySet($kPauseKey, "_TogglePause")

	$gIsPaused = not $gIsPaused

	if $gIsPaused then
		InitKeyHooks("")
	else
		InitKeyHooks($gKeyHandler)
	endif
	
	while $gIsPaused
		sleep(1)
	wend
endfunc
