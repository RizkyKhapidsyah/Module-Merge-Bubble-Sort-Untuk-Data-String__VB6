Attribute VB_Name = "Module1"
Option Explicit

Public Function MergeSort(Strings() As String) As String()
    
    Dim s As Long, i As Long, n() As String, m() As String
    Dim u As Long, l As Long, j As Long, x() As String
    
    ' we don't sort 1 element!
    
    If (UBound(Strings) - LBound(Strings)) = 0 Then
        MergeSort = Strings
        Exit Function
    ElseIf (UBound(Strings) - LBound(Strings)) = 1 Then
        MergeSort = BubbleSort(Strings)
        Exit Function
    Else
        l = SplitArray(Strings, m, n)
        m = MergeSort(m)
        n = MergeSort(n)
        MergeSort = MergeArray(m, n)
    End If
       
End Function

Private Function SplitArray(Strings() As String, _
   StringOut1() As String, StringOut2() As String) As Long

' Splits it 50/50 or as close as possible
' if it's just one string, we return StringOut1(0)
' The return number is the total elements of the
' largest of the arrays

    Dim i As Long, j As Long, s1() As String, s2() As String
    Dim z As Long

    If (UBound(Strings) - LBound(Strings)) = 0 Then
        StringOut1 = Strings
        SplitArray = 1
        Exit Function
    End If
    
    i = Int((UBound(Strings) + 1) / 2)
    
    z = 0
    For j = 0 To (i - 1)
        ReDim Preserve StringOut1(z)
        StringOut1(z) = Strings(j)
        z = z + 1
    Next j
    
    z = 0
    For j = i To UBound(Strings)
        ReDim Preserve StringOut2(z)
        StringOut2(z) = Strings(j)
        z = z + 1
    Next j

    If UBound(StringOut1) > UBound(StringOut2) Then
        SplitArray = UBound(StringOut1)
    Else
        SplitArray = UBound(StringOut2)
    End If
    
End Function

Private Function MergeArray(String1() As String, _
   String2() As String) As String()

    Dim i As Long, j As Long
    Dim n() As String, x As Long, y As Long, c As Integer
    On Error Resume Next
    i = -2
    j = -2
    
    i = UBound(String1) + 1
    j = UBound(String2) + 1
    
    If (i < 0) And (j < 0) Then Exit Function
    
    If (i > -1) Then
        i = UBound(String1) + 1
    ElseIf (i = -1) Or ((i = 0) And (String1(0) = "")) Then
        MergeArray = String2
        Exit Function
    End If
    
    If j > -1 Then
        i = i + UBound(String2) + 1
    ElseIf (j = -1) Or ((j = 0) And (String2(0) = "")) Then
        MergeArray = String1
        Exit Function
    End If
    
    ReDim n(i - 1)
    
    For j = 0 To (i - 1) Step 0
        If (x > UBound(String1)) And (y > UBound(String2)) Then
            MergeArray = n
            Exit Function
        End If
        
        c = StrComp(String1(x), String2(y))
        If (c = 0) And (x <= UBound(String1) And _
              (y <= UBound(String2))) Then
            n(j) = String1(x)
            n(j + 1) = String2(y)
            j = j + 2
            y = y + 1
            x = x + 1
        ElseIf ((c < 0) Or (y > UBound(String2))) _
              And (x <= UBound(String1)) Then
            n(j) = String1(x)
            x = x + 1
            j = j + 1
        ElseIf ((c > 0) Or (x > UBound(String1))) _
                And (y <= UBound(String2)) Then
            n(j) = String2(y)
            y = y + 1
            j = j + 1
        End If
    Next
    MergeArray = n
    
End Function

Public Function BubbleSort(Strings() As String) As String()

    Dim a As Long, b As Long, c As Long, d As Long
    Dim e As Integer, f As Integer, g As Integer

    Dim i As String, j As String
    Dim m() As String, n() As String
    
    e = 1
    n = Strings
    Do While e <> -1
    
        For a = 0 To UBound(Strings) - 1
            i = n(a)
            j = n(a + 1)
            f = StrComp(i, j)
            If f <= 0 Then
                n(a) = i
                n(a + 1) = j
            Else
                n(a) = j
                n(a + 1) = i
                g = 1
            End If
        Next a
        If g = 1 Then
            e = 1
        Else
            e = -1
        End If
        
        g = 0
    Loop
    BubbleSort = n
End Function



