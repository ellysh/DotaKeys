WaitGrabCommand()

Sleep(200)

global const $gKeyHandler = "_KeyMapper"

global $gMappedKey = ""

func WaitGrabCommand()
	while not $gIsGrab
		Sleep(1)
	wend
endfunc

func InitKeyHooks($handler)
	for $i = 0 to 256
		if Chr($i) == $kPauseKey then
			continueloop
		endif

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

func SendClient($key, $is_mapped)
	if $is_mapped then
		$gMappedKey = $key
		Send($key)
		$gMappedKey = ""
	else
		Send($key)
	endif
	
	if $kIsAutoClick then
		MouseClick("left")
	endif
endfunc
