�  ��	 
�  L   ��    �)   �    E    �    	  �� 
 �  �
    � 	  �  
 � �    �  	  �  
 � �   �  	  �  
  �$   �  	  �  
  �,     	  �  
  � 
   	  �  
 &   	      ��
 (  �      *      �  
 , �      .      �  
 0 �      2      �  
 4 �#      6      �  
 8 �      :      �  
 < �4      >      �  
 @   5      B     ��
 K       D    �
 T       M    �K
 h  �,   V    �  
 t   , 	  j��  �g
 |       v    ��
 �       ~  	  ��
 �    !    �  		  ��
 �    !    �  
	  ��
 �    1   �   @��
 �     B         �
 �             �  �y�� �        �  �  �� �        �  �  �� �        �  �  ��           � ����                �  ��           �E a } � � � 1Su��/+E_ Check Register   &ID Num:   &Mon   D&ay   Y&ear   Amo&unt:   &Payee:  	 C&omment:                               &Next   &Prev   &Check/Withdrawl   &Deposit   Ne&w   &Remove   Overall Balance:   Running Balance:           &File   &New   &Open   &Save   Save &As     E&xit� frmCheck
�	lblFields�	txtFields"cmdNext1cmdPreviousA�optTransTypeKcmdAddX	cmdDeletee		lblCurBalr		lblRunBal�	lblAccountNo�VscScrollBar�mnuFileMenu��mnuFile_RecFile�
mnuDivider  mnuFileExit               ���$ ��i�� >2�� � 
� V t��e �LT`%R��v����t � � �                  i  �  CleanupFile�  NewFileName�  ClearFields[ CopyFile OldName�  NewName�  FileType� 
FileErrors� 
FileOpener 	NameToUse Mode� Length4 GetBal� HowMany BalType   GetName� 
LoadOrSave� CurrentNamek Cancel) 
Initialize� LoadRecords� MakeTempFile� PrepVal:StringToPrepF SaveIt  ScrollerUpdate� 
ShowRecord{ vscScrollBar_Change� 
WriteQuery� 
CheckEmOut   DefaultDate( COMMASEP� POINTSEPv NUMBOXES CREDIT� DEBIT� FALSE� TRUE4 saveFile� loadFileD 
createFileo replaceFileX readFile� 	addToFile� 
randomFile/ 
binaryFile   OVERALL   RUNNING� TransactionType� 	RecordNum 
Identifier� Comment   Amountl TransactionID7 CreditOrDebit` Monthw Dayw YearD	RecordVar RecordNumber� Position FileName� FileNum TempFileNum< BakName   
lastrecord� TempFileFlag� NewRecordFlag+ DecSep� NL   Oldcontents� AH Z�CheckOutHandlera ind# CurrentContents 	txtFields� text� PriorContents� SameText� optTransType� value� TransTypeChange 	cmdDelete   enabled   Temp- CleanFileNum resulti period� 
oldBakNamej didit� cmdAdd_Click   cmdNext� cmdPrevious# cmdDelete_Click  TempVar� frmCheckK cmdNext_Click   vscScrollBar� Max` cmdPrevious_Click  RecVar� 	RecordLen   OldNum" NewNum�	CopyError Action Msg: msgType� response   OpenFileNum�OpenerError   	Form_Load� Left\screen_ width   TopT height� Caption   BalanceG 	lblCurBal 	forecolorP 	lblRunBal TheName   KillIt� 	operation� mnuFileExit_Click   WriteIt   RecordWasStored+ mnuFile_RecFile_Click: Index   optTransType_Click   	lblFields� ThouSep   FoundOne   place   Ans   min   SmallChange   LargeChange   txtFields_GotFocus   selstart   	sellength�	  �     H-  � 1    Visual Basic for MS-DOS Check Register Program-  �      � 0    Copyright (C) 1982-1992 Microsoft Corporation  �      � :    You have a royalty-free right to use, modify, reproduce  � D    and distribute the sample applications and toolkits provided with  � 8    Visual Basic for MS-DOS (and/or any modified version)  � ;    in any way you find useful, provided that you agree thati  � :    Microsoft has no warranty, obligations or liability for  � .    any of the sample applications or toolkits.  �     H-    D  V   e        D  t      D  � � �     �     �       D  � �    D  � � �      �      �        D  � � �             D         %     4       D  >     D  L     D  [     D  k� v  	    D  �  e        D  �     D  �     D  �     D  �� e        D  ��    D  �         � O    Constants to handle period vs. comma as decimal separator (Euro vs. Americn)   # m ," �m ." �    # d 
d dx  d ) )t 2  # d :d	 Fd R  # d `d	 od {  # d �d �  # d �d	 ��  (  Types of Balances displayed  � '    Define a data type to hold a record:l    ��  �   � & $  Keep track of record order in file.  �| 2  � # $  Payee or source of deposit funds.  �| d  �  $  Account owner's  notations   �   �  $  Transaction amount   �   � $ $  Check number or deposit ID number     � ! $  -1 for checks, +1 for depositsb       (     /      ��  � &    Define a variable of the data type.   }�� �  7    � ?    Define shared variables to hold file numbers, record number,u  � /    position of currently displayed record, etc.,   }��    D� % $  The actual record number (in file)r   }��    T� ( $  Position describes presentation order   }��    `� % $  Default filename for dialog boxes.d   }��    l�  $  File Number of FileName   }��    w� % $  Indicates file is a Temporary filed   }��    ��  $  Name for a backup filem   }��    �� # $  Represents total records in filel   }��    �� $ $  TRUE if current file is temp file   }��    �� " &  TRUE until new record is stored   }��    �� 1 $  Store comma or period for FORMAT$ money format    }��    �� % $  Variable to hold chr$(10)+chr$(13)m    � C    Define string array for previous contents of the current record.    }��dd     �� # *  One for each of the 7 text boxesn  	  �������I      
 CheckEmOut8�   ������  � D    Stores current record in file if it needs to be stored or updated  X  ��    � B    Invoked when user wants to display new record, exit, save, etc. �� � E    Compare current field value with values when record was displayed  �d
dwV �����  "  Check each textboxe �   #E+ �  �E++ �   #m  q �dua   �  =  Does box contain text?   + �dua    0<d <  P  I ��� / 
  Only comment field can validly be left blanki (+a    0<d < (P  P  e ����  7   a   �  ,  Now check whether there d  H X 2qa   �  ,  was a change to the optioni   2a�   ,  buttons for Check vs. Deposit P   7  M �� d  H X 2qa      2a P  P  � .   If there was a change, place record in file <
qaua     Td]   d T�  -  New file, first recordi � F   Assign each field to the appropriate element of the record variable d   #Z 7 � d   #Z 7 ( d	   #Z 7  d   #Z 7 / d   # 7 � d    kZ 7 � d   # 7 � d  H X 2a   �  2  Assign Deposit/Withdraw (  7  I �� (   7  P   � wdqa   �  2  If this was a temporary ( w l�  2  file, put number in P �  2  expected variable.m  �a   �  2  If record is new, ( �dq]    2 t � ( �d  ��  6  put at end of file. ( � 7 � ( 7 � D (l�  � 7� �� ( ) � I ���  2  Otherwise, just replace ( D 7 ��  2  it with new data. (l�  D 7� �� P  d �  � �  � ��  .  Show account balancea  � �  � ��  .  Balance at this position  P   U �� ��� ���� n   Q 	  � ����C   ��  CleanupFile 8�  � D    Expunge deleted records from the file by copying valid records...  v  V   e       �    d l d w� ! *  Close files; zero file numbersa � A   Open the record file and a tempfile to write valid records to..  ` � 7-��  � l m ~T2m3p7~.Tmp � 7-��  � � �d �V ���� � F   Place valid records (i.e. those preceding LastRecord) in temp file.  l� � 7� �� �� � 7� �� �f ���� l�   dl� %    Close both files. If it was a tempr ��  � !    or renamed file, use CopyFile.t  � `Ye Yqnua    m ~T2m3p7~.Tmpe  �  � � m ~T2m3p7~.Tmp�  I �� � 5   If file is just being cleaned up, but not renamed, � E   delete original file, and rename the temp file with original name..  e �  m ~T2m3p7~.Tmp e �  P  �    d l d w�   (  Close all then reopen records e  `� % $  Give local name to shared variabler  ` � 7-��  � l �    Update the old backup file  `m ."$� �a     `�,m BAK" � I ��  `m BAK" � P  ��m  q]   �    ��   `� �  � � � �� *   Make global agree with this backup file  Q 	  ��������$   ��  ClearFields 8  � @    Clear the fields, set the default fields and store the values  v  t     � +   Set all text box fields to empty strings  �ddV ���� m  �   # �   #�  � e ���� 8   �� %   Put in current date as convenience   Q 	  ��������	   ��  cmdAdd_Click 0�  � 6    Present a default form for user to enter new record  v  �    � &   See if current record needs storing d   #m  a    m( ID or Check Number field entry required.dm Check Register� d  �� �     Start in field onei U �� P  d   #m  a    m Amount field entry required.dm Check Register� d  �� �     Start in field oneh U �� P  8   �  ) t �� %   Disable/enable appropriate buttons  �d^]    2 � �  2 � � 8   t � '   Empty the fields for new data recordt  2 �� !   Set flag indicating new recordc d  �� �    Start in field oner  Q 	  ��������   ��   cmdDelete_Click 0�  � 9    Delete record by stashing it at the end of the file...t  v  �     � A    Start with position of current record (Position) and copy each   � @    RecordNumber+1 to RecordNumber. This leaves duplicate of last  � ?    record at end of file, so reset LastRecord to LastRecord -1.t  � B    When user exits, duplicate records are expunged by CleanUpFile. }�� �  � % &  Allocate temporary record variableb  T � �da    m Deleting last record and file"d��d	qa    �     `�   � N  I �� U �� P  P  � T �dwV �����  (  Perform serial overwrite:  l� �d  � ��� ! (  Get record following one to bel �  �� # (  deleted & change its record num.n  l� � � ��� " (  Overwrite record to delete with e �����  (  the data in TempVar  T �]    Tdw T  �dw � 8   ��  (  Show the record  � �  � ��  (  Display running balance  � �  � ��  (  Overall balance  Q 	  ��������   ��   cmdNext_Click 0�  � /    If not at end of records, increment Position   v  #     T �ca   �  $  If it's not the last record,o  Td  T�  $  increment Positionl  4 D T^a     T 4 X I ��  4 D 4 X P   T �  � � � B   If user decided not to add a new record turn the flag off here.  �]    ) �  2 t �  T �M �� � �  $  Beep if lastrecordt P   Q 	  ��������   ��   cmdPrevious_Click 0`  � 5    If not at beginning of records, decrement Positionl  v  K     Td^a     Td_]    Tdw T�  4  Decrement positionP  4 X Ta     8   � I ��   T 4 X� ' *  Move thumb bar (causes change event)o P   T �  � � � 0   If user didn't add new record, turn flag off.  �]    ) �  2 t � P   Q 	  ��������   ��   CopyFile8,  � 0    Copy the file, record by record to a new name  X  � � �     �     �      }�� �  `� " !  Create  variable of record type  ) �   `-��j � m  � m  ujdu]   U �� � � j  � w wd]   U �� � � j  � � �d]   U �� �� wdq�dqa    �dw/j`V �����  /  Do the actual copying w� � `� �� �� � `� �� e ����  2 �  P  w�   ��    U �� ���  � � �t ��  d;  0l   d;  0n   d	;  0 ) �  0U ��  :  0�  R   Q 	  �������#   ��  DefaultDate 8  � 5    Place the current date in proper fields as default   v  �    dd	3n+d   #�  3  Put default datea d	,n+d	   #�  3  into date fieldst dBn+d   # d   #d  � d	   #d	  � d   #d  �  Q 	  ��������	   �� 
 FileErrors88  � &    Handle common errors in disk access  X  � �    �     Return value
 Meaningn  �    "=   �       0 Resume   �       1 Resume Next  �       2 Cannot handle error  �       3 Unanticipated error  �     t �� eG ; �  *  Disk not readye  m* Insert disk in drive, and close drive door�  d� e@ ; e4 ; �  2 Bad filename...or number  m Filename or number is illegal"�  de  � eK ; eL ; � # 2  Path not found or does not existo  m) That path wasn't found or does not exist."�  de  � � E   Use similar approach for error numbers: 54, 55, 57, 61, 62, 68, 72u :   d�   U �� R  ��m
 Disk Error�� �t �� d; d; �    OK, Retry buttons (d�  d; �    Ignore button (d�  d	; d; �    Cancel, Abort buttons (d	�  :  (d�  R   Q 	  ��������$   �� 
 FileOpener8j  � 5    Open file and return its file number if successful,  X  � � �      �      �       � ��  � t ��  �; �    Random access   � � � �   R  ��   U �� ���  � � �t ��  d;  0l   d;  0n   � @   You needn't specify Case 2 since Case Else uses same response  :  0d� �    Tell caller open failed 0U �� R   Q 	  � ������   �� 	 Form_Load 0�  � C    Prepare form and display it, then initialize temporary data/file7  v  �     � � �wnd	` �  �  wnd	`  � 9   Figure out what country keyboard type is being used...  k�̌?m #,##0.00� �$a     � � dm #,##0.00� �$M ��  � � P  m Check register   e 	d)	  �� % !  Define newline character sequence.d ��	  7   >� # !  Separate init procedure for whene  Q � " !  user chooses New from File menu	  ��������   ��   GetBal8\  � >    Add up Amount fields for Overall balance or Running balance  X  � � �             ldqa   � ! $  Figure the appropriate balancer �d � V ����  l� 7� ��  7 � 7 pn" " e ����   �a   � # $  Display proper balance in proper "dca   �  $  place...y  d - :� " $  If balance is negative, show it I ���  $  in red ink...  d - : P  m Overall Balance: ""m $#,##0.00;($#,##0.00)"�  -  I �� "dca     d G : I ��  d G : P  m Running Balance: ""m $#,##0.00;($#,##0.00)"�  G  P  P   Q 	  ��������   ��  GetName 8  � #    Ask user for a name for the file;  v         %     4      � !   Get the filename from the userl  m	 File name" %��  � =   Convert the name to all capitals for consistent appearance  � m  qa    � YE+ % I ��  2 4 P   Q 	  ��������   �� 
 Initialize 8  � H    Reset important variables and properties when working with File + New  v  >    d T� &   Set everything to initial values... d D �   �    Close any open filesi m   `�    Necessary when user chooses d l�    File+ New d w m   � d �  2 � �d 
dwV ���� m  �  � e ���� m   -  m   G  7   [    7  dd  H X 8   � � =   Adding records is only permissable action with new file...   ) t �  ) � �  ) � � d 4 X  Q 	  ��������   ��  LoadRecords 8�  � 7    Get name of file, then open it and show first recordi  v  L     `T� "   Local name to pass to procedure m Please enter file to open:T47   4ta   � !   If user gave a name, go for it  � B   If the file needs saving, get user's permission, then clean up.  �dqa     �d_   �ua    (e   � 2a    8e n8  V  (I �� 8 2 _ (P  (�   � *  close files preparatory to starting over (d l d w�  '  Zero the File Numbers ( _]    `�  P  P  �    Make a backup file. First,e dTm ."%��  &  check for an extension, �a   �  &  then construct the name.x T�,m BAK"  � I �� Tm .BAK  � P  � -   Create a .BAK file before loading records.  Tm   �m  u]   U �� T� �  � � � )   If there was a problem, warn the user.r � 2qa    m   � U �� P   �a     w�   d w  `�   ) � P  T � 7-��  � l ldqa   �  %  Initialize the globals.  l/ 7-��` � i Rq �dqa     d �  d D  d T   T 4 X   l T 7� �� P  T ` 8   ��  &  Display record  P �  &  P �  (  End of IF NOT Cancel% block m Check register:  `    Q 	  ��������7   ��  MakeTempFile 8V  � L    Random access needs a file, so make a temporary one if this is File + New  v  [    � C   Create name for default file then delete it if it exists alreadyi �dBm \"qa    �m \" m NEWCHECK.TMP  ` I �� �m NEWCHECK.TMP  ` P   `�m  q]    `�  � 7   Open the temporary file and check if it has records. ` � 7-��  �  w  wa     2 �  2�� (   Set flag indicating a temporary file. m Check register:  " `  �  .  Show file name" I �� m% Cannot create default file: FileName "dm Check Register�  � N  P   Q 	  ��������   ��  mnuFileExit_Click 0  � L    If user wants to exit app, make sure everything gets appropriately saved.  v  v     � 2a    � ;   Ask if user wants to save records to a permanent file...r e   � 2a     2��  "  If so, set flag True. I ���   "  Otherwise close all files and �    d l d w�  $  Zero the File Numbers  `� � " $  delete the temporary file, then  )��  $  then set the flag to False. P � ! $  If it wasn't a temporary file,s I ���   $  see if user wants to save it. e   � 2a     2��  $  If so, set flag to True.. I ��  �m  qa   �  '  If there is a backup  (�   �  '  ...close all files, (d l d w�  '  Zero the File Numbers ( `� �  '  then delete the filee ' �  '  before restoring backup ( � ` �  � � P  P  P  � 2a   �  &  If records are to be saved,    ��� # &  pass NewFileName$ (received from  e n8  V �   &  WriteQuery), and clean it up. P  �   � = 
  On close, anything not written to disk is written to disk.t  � N   Q 	  ��������    ��   mnuFile_RecFile_Click 0J  � <    Handle the New, Open, Save and Save As items on File menu  v  �  �       �t �� d;  , �  ,  File +  New  �dqa      `e   e   �a    (e 7  �  e m  M �� (U ��  I �� 0�     `�   P  P  8   t  7   >  ) � �  ) � �  d	;  , �  ,  File + Open 7   L  � �  � �  �dq]    2 � �  2 � �  2 t �  ldq]   8   � d;  , �  ,  File + Save  `e  e 7  � d;  , �  ,  File + Save As  `e  m Name to save file to:"e 47   4ta     e 7  �   ) � P  R   Q 	  ��������"   ��   optTransType_Click 0�  � E    Synchronize captions to coincide with Check/withdrawal vs. Deposit   v  �  �       �da   �  .  Change the text field m &ID Num:d  � �  .  labels to match optiont m &Source:d  � �  .  of Withdrawal/Deposit I �� m Chec&k Num:"d  � �  .  Note: With option buttons,  m Pa&yee:"d  � �  .  click event only occurs ifo P �  .  the user changes choice...k  Q 	  ��������
   ��   PrepVal8�  � I    Make sure values entered as amounts can be converted with VAL functione  X  k� v  	    v #��  3  Put amount in temporary � +   If user typed a currency sign, remove itb �d,m 0"^�d,m 9"bG �� �m  ]   U ���  (  Get out if it's empty �d	�-��3� b �� � 1   If user typed a thousands separator, remove itv � N   If period is decimal separator, thousands separator is a comma & vice versa  � �]   m ,"�I   m ."� d�� #   Initialize start point for INSTRn F  ���%� �d]   S ��  �d�dw3��d 2 � b �� � >   Get rid of sign & ThouSeps completely by altering parameter � v #   � E   Now silently convert from comma as decimal separator, if necessaryi  � �a    d� �% d  ���  P  �   Return the value VAL can use:m � k  Q 	  ��������   ��  SaveIt 8  �     Save the file  v  �  e        ��  +  See if record needs storing e n8  V �  +  Get rid of deleted recordsi e  `�  +  Make global filename currentd  ` � 7-��  �  l�  = reopen it� m Check register:  `    Q 	  ��������   ��  ScrollerUpdate 8*  � >    Called to keep scroll bar thumb bar correctly positioned...  v  �    � !   See if a record needs storing.b    ��  �dqa    � $   Update the scroll bar properties.  � 4 D d 4  d 4   �d)`nd & 4 +    4 X �_]    � 4 X P   Q 	  ��������   �� 
 ShowRecord 8�  � E    Display record at Position, then save old values for comparison...i  v  �     �d_a    � <   Convert display-order position to a file-record position.  T D  l D 7� ��   � E   Many deposits have no ID, so 0 is a valid entry for transaction IDi  7 �Q+d   #  7  a    dxd  H X�  0  Set Withdrawal/Depositl I ���  0  options buttons to be dxd  H X�  0  consistent with recordl P   7 (dqa     7 (Q+d   # P   7 dqa     7 Q+d	   # P   7 /dqa     7 /Q+d   # P   7 �E+d   #  7 �m #,##0.00;(#,##0.00)"�+d   #  7 �E+d   # d  ��  � I   Save values shown in text boxes and transaction type later comparison.0 �d 
dwV ���� �   #�  � e ���� I �� 8   t � 9   If there are no records, make sure fields are cleared.o P   Q 	  ��������#   ��  txtFields_GotFocus 0�   � -    Select the text in the box if there is anyi  v  :  �      � /   Highlight current text in current data field  d �   P  �   #-�� �   \  Q 	  ��������   ��   vscScrollBar_Change 8,  � 8    Triggered when change occurs in a scroll bar property  v  �    � *   See if scroll bar values need updating. 8   � � %   Set position of record to display.t  4 X T �    Display it. 8   ��  %  Display the record ands  T �  � ��  &  update the Balances  Q 	  ��������
   �� 
 WriteQuery8n  � =    Returns TRUE if user wants to write file, FALSE otherwise.d  X  �� e        m" Do you want to save these records? � � �m    Choose Yes to save file."  � � �m    Choose No to delete file. � �dm Save these records?"�da     `e  m Save As:e 47   4ta     2 � P  I ��  ) � P   Q 	  ��������   ��