#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases. 
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, RegEx

;Test variables for Keyword seperating characters
test1 := ","
test2 := "."
test3 := ";"
test4 := "  "
test5 := "·"

;Script to add keywords where seperated by chracters -NOT a line break- using ctrl+k
^k::

;copy selected text
send, ^c

;Open Keywords.txt in notepad++
Run, notepad++.exe %A_WorkingDir%\Keywords.txt
WinActivate, notepad++
sleep, 1000

;copy over all text in the file and open find and replace window
send, ^a
sleep 70
send, ^v
sleep 70
send, ^h
sleep 70

;Selection statement to test if common characters that break up keywords are pressent if they are not it will assume they are sperated by line breaks and skip this section
if InStr(Clipboard, test1) or InStr(Clipboard, test2) or InStr(Clipboard, test3) or InStr(Clipboard, test4) or InStr(Clipboard, test5)
{
;replace all line breaks with a space
send, \r\n 
send, `t
send, {SPACE}
send, !a

;replace all chracters seperating keywords with a line break
send, ,\s|\s·\s|\s.\s|{SPACE}{SPACE}|`;\s
sleep 70
send, `t 
send, \r\n
send, !a 
}

;Attempt to remove lower case for the beginning of words while not doing it for acronyms - Will make a proper noun start with a lower case letter
send, ([A-Z][a-z])
send, `t
send, \L$1
send, !a

;Remove trailing white space and fullstops - more characters can be added if common
send, \s$|\.$|{^}{SPACE}
sleep 100
send, `t
send, {delete}
send, !a

;Close find & replace window, save changes and close notepad++ file tab
send, {ESC}
sleep, 500
send, ^s
sleep, 500
send, ^w
sleep, 600

;Open Haplo tab
WinActivate, .*: Haplo.*
sleep, 500

;Loop that reads Keywords.txt and adds each line to keyword filed in Haplo
loop,read,%A_WorkingDir%\Keywords.txt
{
;Navigating to the keywords field
send, ^f
sleep 70
send, keywords
sleep 500
send, +`t
send, {ENTER}
sleep 70
;Adding keyword
send, +`t
sleep 70
send, {ENTER}
sleep 70
sendInput,% a_loopReadLine

}

;Removing initial keyword field - left blank
sleep 500
send, ^f
sleep 500
send, keywords
send, +`t
send, {ENTER}
sleep 70
send, {TAB}
sleep 70
send, {TAB}
sleep 70
send, {ENTER}

return 

;Script to create file names from daily feed using ctrl+j
^j::

;copy selected text
send, ^c
sleep, 100
;open notepad++
WinActivate, .*- Notepad++.*

;copy over all text in the file and open find and replace window
sleep, 100
send, ^a
sleep 70
send, ^v
sleep 70
send, ^h
sleep 70

;extract first 6 words of title and place underscores between them
send, Title(.*?) (.*?) (.*?) (.*?) (.*?) (.*?) .*
sleep 70
send, `t 
send, $1_$2_$3_$4_$5_$6
send, !a 

;extract first authors surname
send, Authors(.*?),.*
sleep 70
send, `t 
send, $1
send, !a 

;extract year
send, Year(.*) (.*) (.*)
sleep 70
send, `t 
send, $3
send, !a 

;remove line breaks
send, \r\n
sleep 70
send, `t 
send, {#}
send, !a 

;Place author, year and title in correct order with underscors between
send, (.*?){#}(.*?){#}(.*)`#
sleep 70
send, `t 
send, $2_$3_$1
send, !a 

;Place author, year and title in correct order with underscors between
send, :|'|{"}|{"}|,
sleep 70
send, `t 
send, {delete}
send, !a 

;Place author, year and title in correct order with underscors between
send, (.*?_.*?_.*?_)(.*)
sleep 70
send, `t 
send, $1\L$2
send, !a 

;Close find replace window
send, {ESC}

return 

