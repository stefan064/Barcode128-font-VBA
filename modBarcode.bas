Option Compare Database
Option Explicit

Private Const CODE128A_START = 203    '203 = code128 font character for code128A start - ASCII characters 00 to 95 (0-9, A-Z and control codes), special characters, and FNC 1-4
Private Const CODE128B_START = 204    '204 = code128 font character for code128B start - ASCII characters 32 to 127 (0-9, A-Z, a-z), special characters, and FNC 1-4
Private Const CODE128C_START = 205    '205 = code128 font character for code128C start - 00-99 (encodes two digits with a single code point) and FNC1
Private Const CODE128_END = 206       '206 = code128 font character for CODE128 end symbol

Private Const CODE128_SELECT_A = 201 'used in Auto mode for changing the code set in use
Private Const CODE128_SELECT_B = 200
Private Const CODE128_SELECT_C = 199

Private Enum codeMode
    MODE_AUTO
    MODE_AUTO_A
    MODE_AUTO_B
    MODE_AUTO_C
End Enum


Public Function Barcode128A(barcodeText As String) As String
    'intended for code128 truetype font
    'https://www.dafont.com/code-128.font
    'see comments section for sample code
    'This function currently only handles CODE128A
    
    Dim START_CHAR As String
    START_CHAR = Chr(CODE128A_START)
    barcodeText = UCase(barcodeText) 'code128A only supports upper case characters so we need to ensure there's no lower case
    
    Dim i As Integer
    For i = 1 To Len(barcodeText)
        Dim charcode As Integer
        charcode = Asc(Mid(barcodeText, i, 1))
        If charcode < 32 Then 'ascii control codes, applies to code128A only
            charcode = charcode + Asc("`") 'control codes are shifted to where CODE128B would have lowercase characters
            Mid(barcodeText, i, 1) = Chr(charcode) 'replace character in the string to be sent
        End If
    Next i
    
    Barcode128A = START_CHAR & barcodeText & CalculateChecksum(START_CHAR & barcodeText) & Chr(CODE128_END)
End Function


Private Function CalculateChecksum(barcodeText As String) As String
    Dim checksum As Long
    checksum = Asc(barcodeText) - 100
    Dim i As Integer
    For i = 2 To Len(barcodeText)
        Dim charcode As Integer
        charcode = Asc(Mid(barcodeText, i, 1))
        If charcode >= CODE128_SELECT_C Then 'convert from font ascii values to code128 symbol values
            charcode = charcode - 100
        Else
            charcode = charcode - 32 'offset by 32 to start at symbol 0. Assumes ascii control codes (<32) were already remapped to lowercase ascii area
        End If
        checksum = checksum + (charcode * (i - 1))
    Next i
    'code 128 font printable characters range (ascii decimal): 32 - 126, 195 - 207 (203 - 207 are start/end symbols)
    
    checksum = checksum Mod 103 'checksum range 0 - 102
    checksum = checksum + 32 'offset to 32 - 134 to line up with first symbol in code128 font (symbols in range 32 - 126, 195 - 202)
    If (checksum > 126) Then 'symbols in ascii range 126 - 134 are mapped in code128 font characters 195 - 202
        checksum = checksum + (195 - 126 - 1)
    End If
    CalculateChecksum = Chr(checksum)
End Function


'returns a human readable ascii decimal numbering of each character in inputText
Function DebugString(inputText As String) As String
    Dim i As Integer
    For i = 1 To Len(inputText)
        DebugString = DebugString & Mid(inputText, i, 1) & "(" & Asc(Mid(inputText, i, 1)) & ") "
    Next i
End Function


Public Function Barcode128Auto(barcodeText As String)
'intended for code128 truetype font
'https://www.dafont.com/code-128.font
'see comments section for sample code
'This function automatically selects modes A/B/C and switches between them for smallest possible output length

    Dim outputString As String
    outputString = Convert128Auto(MODE_AUTO, barcodeText)
    
    Dim startChar As Integer
    Select Case Asc(Left(outputString, 1))
    Case CODE128_SELECT_A: startChar = CODE128A_START 'convert first mode-switch symbol to equivalent start symbol
    Case CODE128_SELECT_B: startChar = CODE128B_START
    Case CODE128_SELECT_C: startChar = CODE128C_START
    End Select
    Mid(outputString, 1, 1) = Chr(startChar)

    Barcode128Auto = outputString & CalculateChecksum(outputString) & Chr(CODE128_END)
End Function


Private Function Convert128Auto(currentMode As codeMode, inputString As String) As String
    Dim out As String
    
    If NumOfNumericDigits(inputString) = 2 Then 'minor optimisation for specific case having two numeric digits at start (no gain if there's 1 or 3)
        out = out & Chr(CODE128_SELECT_C)
        currentMode = MODE_AUTO_C
    End If
    
    Dim i As Integer
    i = 1
    Do While i <= Len(inputString)
        Dim s As String
        s = Mid(inputString, i)
        If currentMode <> MODE_AUTO_C And NumOfNumericDigits(s) >= 4 Then
            out = out & Chr(CODE128_SELECT_C)
            currentMode = MODE_AUTO_C
        End If
        Dim nextModeCheck As codeMode
        nextModeCheck = FindNextBestMode(s) 'TODO: some redundant A/B mode switching might still occur
        If currentMode = MODE_AUTO_C And NumOfNumericDigits(s) >= 2 Then
            out = out & NumberToCode128CSymbol(Left(s, 2))
            i = i + 2
        ElseIf currentMode <> nextModeCheck Then 'not two numberic digits (or control code/lowercase swap), we need another mode
            currentMode = nextModeCheck
            Select Case currentMode
            Case MODE_AUTO_A: out = out & Chr(CODE128_SELECT_A)
            Case MODE_AUTO_B: out = out & Chr(CODE128_SELECT_B)
            End Select
        Else
            'convert one character
            If Asc(s) < 32 Then 'ascii control codes, applies to code128A only
                out = out & Chr(Asc(s) + Asc("`")) 'control codes are shifted to where CODE128B would have lowercase characters
            Else
                out = out & Left(s, 1)
            End If
            i = i + 1
        End If
        
    Loop
    Convert128Auto = out
End Function


Private Function FindNextBestMode(inputString As String) As codeMode
    Dim i As Integer
    For i = 1 To Len(inputString)
        Select Case Asc(Mid(inputString, i, 1))
        Case 0 To 31: 'control code ascii values
            FindNextBestMode = MODE_AUTO_A
            Exit Function
        Case Asc("`") To 127: 'lowercase ascii values
            FindNextBestMode = MODE_AUTO_B
            Exit Function
        End Select
    Next i
    FindNextBestMode = MODE_AUTO_A 'default
End Function


Private Function NumberToCode128CSymbol(inputVal As Integer) As String
    If inputVal > 99 Then Err.Raise 1, "NumberTo128CSymbol", "Can only fit two digits per symbol"
    NumberToCode128CSymbol = Chr(inputVal + 32) 'offset for code128 font. symbol value 0 mapped to ascii 32
End Function


Private Function NumOfNumericDigits(inputString As String) As Integer
'returns number of consecutive numeric digits from the start of inputstring (stops counting at the first non-numeric character)
    Dim i As Integer
    For i = 1 To Len(inputString)
        Select Case Mid(inputString, i, 1)
        Case "0" To "9": NumOfNumericDigits = i
        Case Else: Exit For
        End Select
    Next i
End Function