#include <WinAPI.au3>

#include "../source/debug.au3"
#include "../source/hooks.au3"
#include "../source/functions.au3"

; This is needed for Windows Vista and above
#requireadmin

func _KeyMapper()
	$key_pressed = @HotKeyPressed

	LogWrite("_KeyMapper() - asc = " & asc($key_pressed) & " key = " & $key_pressed & @CRLF);
	HotKeySet($key_pressed)
	MapKey($key_pressed)
	HotKeySet($key_pressed, "_KeyMapper")
endfunc

func MapKey($key)
	if $key = "1" then
		LogWrite("MapKey() - remap: asc = " & asc($key) & " key = " & $key & @CRLF);
		Send("2")
	else
		LogWrite("MapKey() - skip: asc = " & asc($key) & " key = " & $key & @CRLF);
		Send($key)
	endif
endfunc

func InitKeyHooks()
	for $i = 0 to 256
		HotKeySet(Chr($i), "_KeyMapper")
	next

	for $i = 0 to 12
		HotKeySet("{F" & $i & "}", "_KeyMapper")
	next
endfunc

InitKeyHooks()

; Main Loop
while true
	Sleep(10)
wend
