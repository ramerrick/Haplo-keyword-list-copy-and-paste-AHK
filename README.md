# Haplo-keyword-list-copy-and-paste-AHK

New record script includes two shortcut keys one to quickly cut and paste a list of article keywords into a Haplo record and the other the create a standardised file name from an existing Haplo record. 

<b>Keywords (ctrl + k)</b></br>
<b>Instructions</b>
<ol>
  <li>Select a list of keywords from an article.</li>
  <li>Use the shortcut ctrl + k on your keyboard.</li>
  <li>The keywords will be copied into Notepad++, cleaned using find and replace and regular expressions, each keyword will then be copy in pasted into the keywords section of the haplo record, each keyword on a new line (automatically but you will need to sit and let the script un, it is not in the background).</li>
</ol>

<b>Requirements and limitations</b>
<ul>
  <li>Notepad++ must be installed</li>
  <li>Notepad++ must have regular expression and wrap text selected in the find and replace.</li>
  <li>a file called Keywords.txt must be saved in the same location as the AHK executable file, the file will be repeatably written over.</li>
  </li>A browser with the Haplo record in edit mode must be open in a browser as the current tab of a window.</li>
  <li>The script recognises these keyword script separators uses by publishers - "," ".", ";", " ", "·" and keywords separated by a new line (including those in unnumbered).</li>
</ul>

<b>New file name (ctrl + j)</b></br>
<b>Instructions</b>
<ol>
  <li>Highlight the author, year and title years</li>
  <li>Use the shortcut ctrl + j on your keyboard.</li>
  <li>The text will be copied into Notepad++ and cleaned and reordered into the standardised file name.</li>
</ol>

The file name format set up is Author surname, year and the first six letters of the title separated by underscores. e.g. Merrick_2022_new_record_auto_hot_key_script.</br>
The script may not work with how your records in Haplo display and could be adjusted accordingly. 

<b>Requirements and limitations</b>
<ul>
  <li>Notepad++ must be installed</li>
  <li>A browser with the Haplo record in edit mode must be open in a browser as the current tab of a window.</li>
</ul>

**Both shortcuts in the NewRecord script may need to be altered to work with your PC's running times and your Haplo configuration.
