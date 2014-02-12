#include <WinAPI.au3>

#include "debug.au3"
#include "hooks.au3"
#include "functions.au3"

func _KeyMapper()
	$key_pressed = @HotKeyPressed

	LogWrite("_KeyMapper() - asc = " & asc($key_pressed) & " key = " & $key_pressed & @CRLF);
	HotKeySet($key_pressed)
	MapKey($key_pressed)
	HotKeySet($key_pressed, "_KeyMapper")
endfunc

func MapKey($key)
	local $keys_array = StringSplit($kKeys, "|")

	for $i = 1 to $keys_array[0] step 1
		LogWrite("MapKey() - key_map = " & $keys_array[$i] & @CRLF);

		local $key_map = StringSplit($keys_array[$i], ",")
		
		if $key = $key_map[1] then
			for $j = 2 to $key_map[0] step 1
				LogWrite("MapKey() - remap: asc = " & asc($key) & " key = " & $key & @CRLF);
				Send($key_map[$j])
			next
			return
		endif
	next

	LogWrite("MapKey() - skip: asc = " & asc($key) & " key = " & $key & @CRLF);
	Send($key)
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
