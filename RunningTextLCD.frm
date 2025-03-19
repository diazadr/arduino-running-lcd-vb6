VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form Form1 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Form1"
   ClientHeight    =   5295
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   9390
   LinkTopic       =   "Form1"
   ScaleHeight     =   10215
   ScaleWidth      =   18960
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Left            =   8040
      Top             =   3360
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   8040
      Top             =   2400
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      CommPort        =   7
      DTREnable       =   -1  'True
   End
   Begin VB.TextBox Text1 
      Height          =   855
      Left            =   3120
      TabIndex        =   6
      Top             =   6360
      Width           =   4455
   End
   Begin VB.CommandButton Exit 
      Caption         =   "Exit"
      Height          =   975
      Left            =   5520
      TabIndex        =   5
      Top             =   5040
      Width           =   2055
   End
   Begin VB.CommandButton Reset 
      Caption         =   "Reset"
      Height          =   975
      Left            =   3120
      TabIndex        =   4
      Top             =   5040
      Width           =   2055
   End
   Begin VB.CommandButton Pause 
      Caption         =   "Pause"
      Height          =   975
      Left            =   5520
      TabIndex        =   3
      Top             =   3720
      Width           =   2055
   End
   Begin VB.CommandButton Start 
      Caption         =   "Start"
      Height          =   975
      Left            =   3120
      TabIndex        =   2
      Top             =   3720
      Width           =   2055
   End
   Begin VB.CommandButton Disconnect 
      Caption         =   "Disconnect"
      Height          =   975
      Left            =   5520
      TabIndex        =   1
      Top             =   2400
      Width           =   2055
   End
   Begin VB.CommandButton Connect 
      Caption         =   "Connect"
      Height          =   975
      Left            =   3120
      TabIndex        =   0
      Top             =   2400
      Width           =   2055
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H005E3717&
      BorderWidth     =   2
      Height          =   975
      Left            =   3240
      Shape           =   4  'Rounded Rectangle
      Top             =   840
      Width           =   5535
   End
   Begin VB.Image Image1 
      Height          =   1335
      Left            =   1800
      Picture         =   "RunningTextLCD.frx":0000
      Stretch         =   -1  'True
      Top             =   720
      Width           =   1185
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "RUNNING TEXT LCD"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H005E3717&
      Height          =   615
      Left            =   3000
      TabIndex        =   8
      Top             =   1080
      Width           =   6015
   End
   Begin VB.Label Label1 
      Height          =   735
      Left            =   3120
      TabIndex        =   7
      Top             =   7440
      Width           =   4455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Connect_Click()
    If MSComm1.PortOpen = False Then
       MSComm1.PortOpen = True
    End If
End Sub

Private Sub Disconnect_Click()
    If MSComm1.PortOpen = True Then
       MSComm1.PortOpen = False
    End If
End Sub

Private Sub Start_Click()
    Label1.Caption = Text1.Text
    MSComm1.Output = Label1.Caption
    Timer1.Enabled = True
End Sub

Private Sub Pause_Click()
    Timer1.Enabled = False
End Sub

Private Sub Exit_Click()
    Unload Me
End Sub

Private Sub Reset_Click()
    Timer1.Enabled = False
    MSComm1.Output = Chr(12)
End Sub

Private Sub Form_Load()
    MSComm1.RThreshold = 1
    MSComm1.Settings = "9600,n,8,1"
    Label1.FontSize = 30
End Sub

Private Sub Timer1_Timer()
    If (i > Len(Label1.Caption)) Then
        i = 0
    End If
    MSComm1.Output = Chr(12)
    Label1.Caption = Right(Label1.Caption, Len(Label1.Caption) - 1) + Left(Label1.Caption, 1)
    MSComm1.Output = Label1.Caption
    i = i + 1
End Sub
