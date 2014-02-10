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
