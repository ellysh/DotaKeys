#include <WinAPI.au3>

#include "../config/global.au3"
#include "debug.au3"
#include "hooks.au3"
#include "functions.au3"

func _KeyMapper()
	$key_pressed = @HotKeyPressed

	LogWrite("_KeyMapper() - asc = " & asc($key_pressed) & " key = " & $key_pressed & @CRLF);
	HotKeySet($key_pressed)
	MapKey($key_pressed)
	HotKeySet($key_pressed, $gKeyHandler)
endfunc

func MapKey($key)
	; This is hack to avoid the repeating key mapping.
	if $gMappedKey == $key then
		LogWrite("MapKey() - skip #1: asc = " & asc($key) & " key = " & $key & @CRLF);
		SendClient($key, false);
		return
	endif

	local $keys_array = StringSplit($kKeys, "|")

	for $i = 1 to $keys_array[0] step 1
		LogWrite("MapKey() - key_map = " & $keys_array[$i] & @CRLF);

		local $key_map = StringSplit($keys_array[$i], ",")
		
		if $key = $key_map[1] then
			for $j = 2 to $key_map[0] step 1
				LogWrite("MapKey() - remap: asc = " & asc($key) & " key = " & $key & @CRLF);
				SendClient($key_map[$j], true)
			next
			return
		endif
	next

	LogWrite("MapKey() - skip #2: asc = " & asc($key) & " key = " & $key & @CRLF);
	SendClient($key, false)
endfunc

InitKeyHooks($gKeyHandler)

; Main Loop
while true
	Sleep(10)
wend
