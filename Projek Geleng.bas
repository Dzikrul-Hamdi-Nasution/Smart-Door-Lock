$regfile = "m32def.dat"
$crystal = 8000000
$eeprom


Config Lcdbus = 4
Config Lcd = 16 * 2
Config Lcdpin = Pin , Db4 = Porta.3 , Db5 = Porta.2 , Db6 = Porta.1 , Db7 = Porta.0 , E = Porta.4 , Rs = Porta.5
Cls : Cursor Off
Config Portd.0 = Input
Config Portd.1 = Input
Config Portd.2 = Input
Config Portd.3 = Input
Config Portd.4 = output
Config Portd.5 = Output
Config Portd.6 = Output
Config Portd.7 = Output                                     '

Set Portd.0
Set Portd.1
Set Portd.2
Set Portd.3

Config Porta.6 = Output
Config Porta.7 = Input
Set Porta.7
Config Servos = 1 , Servo1 = Porta.6 , Reload = 20
Dim Sudut As Integer , Nilai As String * 16 , Banding As String * 16


 Sudut = 90

 Lcd "Inisialisasi..."
  Disable Interrupts

 Wait 2
 Cls
Locate 1 , 4 : Lcd "Miniatur"
Locate 2 , 3 : Lcd "Door  Lock"
Wait 2
 Enable Interrupts 
Servo(1) = Sudut

Hapus:
Nilai = ""
Cls
Lcd "Insert Password"

 Lowerline
Do

        Portd = &B11101111
       If Pind.0 = 0 Then
           Gosub Nilai_a
            Portd = &B11101111
            If Pind.1 = 0 Then
               Portd = &B11101111
               If Pind.2 = 0 Then Gosub Ubah_pass
            End If
       End If
       If Pind.1 = 0 Then Gosub Nilai_4
       If Pind.2 = 0 Then Gosub Nilai_7
       If Pind.3 = 0 Then Gosub Bintang
       'If Pind = &B11100000 Then Gosub Ubah_pass

       portd = &B11011111
       If Pind.0 = 0 Then Gosub Nilai_1
       If Pind.1 = 0 Then Gosub Nilai_5
       If Pind.2 = 0 Then Gosub Nilai_8
       If Pind.3 = 0 Then Gosub Nilai_0

       portd = &B10111111
       If pind.0 = 0 Then gosub nilai_2
       If Pind.1 = 0 Then Gosub Nilai_6
       If Pind.2 = 0 Then Gosub Nilai_9
       If Pind.3 = 0 Then Gosub Pagar

       Portd = &B01111111
       If Pind.0 = 0 Then Gosub Nilai_3
       If Pind.1 = 0 Then Gosub Nilai_b
       If Pind.2 = 0 Then Gosub Hapus
       If Pind.3 = 0 Then Gosub Enter

Loop


Enter:
      Readeeprom Banding , &H001A
      If Nilai = Banding Then
         Cls : Lcd "Akses Diterima"
         Servo(1) = 90
         Wait 2
         Cls
         Do
           Locate 1 , 1 : Lcd "Standby....."
         Loop Until Pina.7 = 0
         Waitms 200
         Servo(1) = 83
      Else
          Cls : Lcd "Akses Ditolak"
          Wait 2
      End If
      Goto Hapus
Return

Ubah_pass:
          Cls
          Nilai = ""
          Lcd "Change Password"
          Locate 2 , 1 : Lcd "New : "
          Do
                  Portd = &B11101111
                   If Pind.0 = 0 Then
                       Gosub Nilai_a
                   End If
                   If Pind.1 = 0 Then Gosub Nilai_4
                   If Pind.2 = 0 Then Gosub Nilai_7
                   If Pind.3 = 0 Then Gosub Bintang
                   'If Pind = &B11100000 Then Gosub Ubah_pass

                   portd = &B11011111
                   If Pind.0 = 0 Then Gosub Nilai_1
                   If Pind.1 = 0 Then Gosub Nilai_5
                   If Pind.2 = 0 Then Gosub Nilai_8
                   If Pind.3 = 0 Then Gosub Nilai_0

                   portd = &B10111111
                   If pind.0 = 0 Then gosub nilai_2
                   If Pind.1 = 0 Then Gosub Nilai_6
                   If Pind.2 = 0 Then Gosub Nilai_9
                   If Pind.3 = 0 Then Gosub Pagar

                   Portd = &B01111111
                   If Pind.0 = 0 Then Gosub Nilai_3
                   If Pind.1 = 0 Then Gosub Nilai_b
                   If Pind.2 = 0 Then Gosub Ubah_pass
                   If Pind.3 = 0 Then Gosub Verifikasi
       Loop
Return


Verifikasi:
           Banding = Nilai
           Writeeeprom Banding , &H001A
           Cls
           Lcd "Password Changed"
           Wait 2
           Goto Hapus
Return




Nilai_a:
        Waitms 200
        Nilai = Nilai + "a"
        Lcd "*"
Return

 Nilai_b:
         Waitms 200
        Nilai = Nilai + "b"
        Lcd "*"
Return

Nilai_c:
        Waitms 200
        Nilai = Nilai + "c"
        Lcd "*"
Return

Nilai_1:
        Waitms 200
        Nilai = Nilai + "1"
        Lcd "*"
Return

 Nilai_0:
         Waitms 200
        Nilai = Nilai + "0"
        Lcd "*"
Return

Nilai_2:
        Waitms 200
        Nilai = Nilai + "2"
        Lcd "*"
Return

Nilai_3:
        Waitms 200
        Nilai = Nilai + "3"
        Lcd "*"
Return

Nilai_4:
        Waitms 200
        Nilai = Nilai + "4"
        Lcd "*"
Return

Nilai_5:
        Waitms 200
        Nilai = Nilai + "5"
        Lcd "*"
Return

Nilai_6:
        Waitms 200
        Nilai = Nilai + "6"
        Lcd "*"
Return

Nilai_7:
        Waitms 200
        Nilai = Nilai + "7"
        Lcd "*"
Return

Nilai_8:
        Waitms 200
        Nilai = Nilai + "8"
        Lcd "*"
Return

Nilai_9:
        Waitms 200
        Nilai = Nilai + "9"
        Lcd "*"
Return

Bintang:
        Waitms 200
        Nilai = Nilai + "p"
        Lcd "*"
Return

Pagar:
      Waitms 200
        Nilai = Nilai + "n"
        Lcd "*"
Return









