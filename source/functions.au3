WaitGrabCommand()

Sleep(200)

Opt("SendKeyDownDelay", 10)
Opt("PixelCoordMode", 2)
Opt("MouseCoordMode", 2)

func WaitGrabCommand()
	while not $gIsGrab
		Sleep(1)
	wend
endfunc

func InitKeyHooks($handler)
	for $i = 0 to 256
		if $handler <> "" then
			HotKeySet(Chr($i), $handler)
		else
			HotKeySet(Chr($i))
		endif
	next

	for $i = 0 to 12
		if $handler <> "" then
			HotKeySet("{F" & $i & "}", $handler)
		else
			HotKeySet("{F" & $i & "}")
		endif
	next
endfunc
