object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Compare Image'
  ClientHeight = 467
  ClientWidth = 855
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbTotal: TLabel
    Left = 392
    Top = 44
    Width = 43
    Height = 16
    Caption = 'lbTotal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LbPercentual: TLabel
    Left = 392
    Top = 69
    Width = 82
    Height = 19
    Caption = 'LbPercent'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 40
    Top = 7
    Width = 63
    Height = 13
    Caption = 'Image Matrix'
  end
  object Label2: TLabel
    Left = 40
    Top = 55
    Width = 93
    Height = 13
    Caption = 'Image for Compare'
  end
  object Label3: TLabel
    Left = 8
    Top = 121
    Width = 77
    Height = 13
    Caption = 'Image Matrix'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 392
    Top = 121
    Width = 91
    Height = 13
    Caption = 'Image Compare'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnCompare: TButton
    Left = 392
    Top = 13
    Width = 75
    Height = 25
    Caption = 'Compare'
    TabOrder = 0
    OnClick = btnCompareClick
  end
  object EdtImage1: TEdit
    Left = 40
    Top = 23
    Width = 273
    Height = 21
    TabOrder = 1
    Text = 'Image 1 (Only .bmp)'
  end
  object EdtImage2: TEdit
    Left = 40
    Top = 71
    Width = 273
    Height = 21
    TabOrder = 2
    Text = 'Image 2 (Only .bmp)'
  end
  object Button2: TButton
    Left = 319
    Top = 21
    Width = 41
    Height = 25
    Caption = '...'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 319
    Top = 69
    Width = 41
    Height = 25
    Caption = '...'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 504
    Top = 13
    Width = 75
    Height = 25
    Caption = 'Region'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 140
    Width = 369
    Height = 307
    TabOrder = 6
    object Image1: TImage
      Left = 8
      Top = 0
      Width = 352
      Height = 291
      Stretch = True
    end
  end
  object Panel2: TPanel
    Left = 375
    Top = 140
    Width = 426
    Height = 307
    TabOrder = 7
    object Image2: TImage
      Left = 0
      Top = 0
      Width = 433
      Height = 307
      Stretch = True
    end
  end
  object Button5: TButton
    Left = 632
    Top = 13
    Width = 75
    Height = 25
    Caption = 'Draw'
    TabOrder = 8
    OnClick = Button5Click
  end
  object OpenDialog1: TOpenDialog
    Left = 568
    Top = 48
  end
end
