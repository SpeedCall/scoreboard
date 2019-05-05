object frmScoreboard: TfrmScoreboard
  Left = 262
  Top = 123
  Caption = 'OPC Test'
  ClientHeight = 689
  ClientWidth = 1321
  Color = clBtnFace
  Constraints.MinHeight = 270
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pnlSettings: TPanel
    Left = 0
    Top = 0
    Width = 1321
    Height = 689
    Align = alClient
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 427
      Top = 1
      Width = 6
      Height = 646
      ExplicitHeight = 566
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 426
      Height = 646
      Align = alLeft
      TabOrder = 0
      DesignSize = (
        426
        646)
      object Label1: TLabel
        Left = 15
        Top = 34
        Width = 67
        Height = 13
        Caption = 'OPC ServerID'
      end
      object Label2: TLabel
        Left = 15
        Top = 61
        Width = 75
        Height = 13
        Caption = 'Server name/IP'
      end
      object Label3: TLabel
        Left = 15
        Top = 88
        Width = 41
        Height = 13
        Caption = 'OPCTag'
      end
      object Label7: TLabel
        Left = 95
        Top = 6
        Width = 208
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Caption = 'STATE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnAddTag: TButton
        Left = 283
        Top = 112
        Width = 55
        Height = 25
        Caption = 'Tilf'#248'j tag'
        TabOrder = 0
        OnClick = btnAddTagClick
      end
      object btnDeleteTag: TButton
        Left = 344
        Top = 112
        Width = 55
        Height = 25
        Caption = 'Slet tag'
        TabOrder = 1
        OnClick = btnDeleteTagClick
      end
      object edtOPCSrvID: TEdit
        Left = 125
        Top = 31
        Width = 274
        Height = 21
        TabOrder = 2
      end
      object edtTagName: TEdit
        Left = 125
        Top = 85
        Width = 216
        Height = 21
        TabOrder = 3
      end
      object OPCSrvNameIP: TEdit
        Left = 125
        Top = 58
        Width = 274
        Height = 21
        TabOrder = 4
      end
      object sgrdTags: TStringGrid
        Left = 4
        Top = 143
        Width = 418
        Height = 488
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColCount = 6
        DefaultRowHeight = 16
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
        TabOrder = 5
        OnClick = sgrdTagsClick
        OnEnter = sgrdTagsEnter
        OnKeyPress = sgrdTagsKeyPress
        ColWidths = (
          195
          184
          18
          41
          64
          64)
        RowHeights = (
          16
          16)
      end
    end
    object pnlBottom: TPanel
      Left = 1
      Top = 647
      Width = 1319
      Height = 41
      Align = alBottom
      TabOrder = 1
      DesignSize = (
        1319
        41)
      object Label4: TLabel
        Left = 556
        Top = 5
        Width = 9
        Height = 13
        Caption = '- -'
      end
      object Label5: TLabel
        Left = 556
        Top = 24
        Width = 9
        Height = 13
        Caption = '- -'
      end
      object btnDisconnect: TButton
        Left = 149
        Top = 10
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Disconnect'
        TabOrder = 0
        OnClick = btnDisconnectClick
      end
      object btnConnect: TButton
        Left = 68
        Top = 10
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Connect'
        TabOrder = 1
        OnClick = btnConnectClick
      end
      object btnRefresh: TButton
        Left = 228
        Top = 10
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Refresh'
        TabOrder = 2
        OnClick = btnRefreshClick
      end
      object Button1: TButton
        Left = 320
        Top = 10
        Width = 75
        Height = 25
        Caption = 'Constring'
        TabOrder = 3
        OnClick = Button1Click
      end
      object Edit1: TEdit
        Left = 644
        Top = 11
        Width = 121
        Height = 21
        TabOrder = 4
        Visible = False
      end
      object chkAutoRefresh: TCheckBox
        Left = 432
        Top = 16
        Width = 85
        Height = 17
        Caption = 'Auto Refresh'
        TabOrder = 5
      end
    end
    object Panel1: TPanel
      Left = 433
      Top = 1
      Width = 887
      Height = 646
      Align = alClient
      TabOrder = 2
      DesignSize = (
        887
        646)
      object Label9: TLabel
        Left = 6
        Top = 569
        Width = 68
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Antal skift vist:'
        ExplicitTop = 697
      end
      object Label8: TLabel
        Left = 6
        Top = 621
        Width = 80
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Max prod pr/shift'
        ExplicitTop = 753
      end
      object Label6: TLabel
        Left = 6
        Top = 595
        Width = 80
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Log interval (min)'
        ExplicitTop = 727
      end
      object sgrd: TStringGrid
        Left = 1
        Top = 1
        Width = 885
        Height = 240
        Anchors = [akLeft, akTop, akRight]
        ColCount = 23
        DefaultRowHeight = 16
        FixedCols = 0
        RowCount = 2
        TabOrder = 0
        ColWidths = (
          182
          141
          56
          50
          32
          31
          29
          30
          31
          31
          30
          40
          37
          33
          35
          33
          30
          31
          31
          37
          30
          28
          32)
        RowHeights = (
          16
          16)
      end
      object ShownShift: TSpinEdit
        Left = 92
        Top = 566
        Width = 41
        Height = 22
        Anchors = [akLeft, akBottom]
        MaxValue = 21
        MinValue = 0
        TabOrder = 1
        Value = 1
        OnChange = ShownShiftChange
      end
      object edtPrdShift: TEdit
        Left = 92
        Top = 618
        Width = 58
        Height = 21
        Alignment = taRightJustify
        Anchors = [akLeft, akBottom]
        TabOrder = 2
        Text = '205000'
        OnChange = ShownShiftChange
      end
      object speed: TSpinEdit
        Left = 92
        Top = 592
        Width = 41
        Height = 22
        Anchors = [akLeft, akBottom]
        MaxValue = 999
        MinValue = 1
        TabOrder = 3
        Value = 1
        OnChange = ShownShiftChange
      end
      object GroupBox1: TGroupBox
        Left = 200
        Top = 566
        Width = 129
        Height = 76
        Anchors = [akLeft, akBottom]
        TabOrder = 4
        object CheckBox1: TCheckBox
          Left = 8
          Top = 8
          Width = 97
          Height = 17
          Caption = 'Show Norm series'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = CheckBox1Click
        end
        object CheckBox2: TCheckBox
          Left = 8
          Top = 30
          Width = 97
          Height = 17
          Caption = 'Show Stk series'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = CheckBox1Click
        end
        object CheckBox3: TCheckBox
          Left = 8
          Top = 51
          Width = 97
          Height = 17
          Caption = 'Show OPC series'
          TabOrder = 2
        end
      end
      object mmLog: TMemo
        Left = 2
        Top = 247
        Width = 885
        Height = 313
        Anchors = [akLeft, akTop, akRight, akBottom]
        Lines.Strings = (
          'mmLog')
        ScrollBars = ssBoth
        TabOrder = 5
      end
    end
  end
  object pnlScoreboard: TPanel
    Left = 0
    Top = 0
    Width = 1321
    Height = 689
    Align = alClient
    TabOrder = 0
    object Chart: TChart
      Left = 1
      Top = 1
      Width = 1014
      Height = 687
      AllowPanning = pmNone
      Gradient.Balance = 0
      Gradient.Direction = gdDiagonalUp
      Gradient.EndColor = clGray
      Gradient.MidColor = clBackground
      Gradient.StartColor = clSilver
      LeftWall.Color = clWhite
      Legend.HorizMargin = 44
      Legend.TopPos = 21
      Legend.VertSpacing = 1
      Title.Font.Color = clWhite
      Title.Font.Height = -16
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        'Prod/Shift')
      BottomAxis.DateTimeFormat = 'dd|hh:nn'
      BottomAxis.LabelsFormat.Font.Color = clWhite
      BottomAxis.Ticks.Color = clSilver
      BottomAxis.TicksInner.Color = clSilver
      Chart3DPercent = 1
      LeftAxis.LabelsFormat.Font.Color = clWhite
      LeftAxis.MinorTicks.Color = clSilver
      LeftAxis.Ticks.Color = clSilver
      LeftAxis.TicksInner.Color = clSilver
      View3D = False
      View3DOptions.FontZoom = 170
      View3DOptions.HorizOffset = 29
      View3DOptions.OrthoAngle = 0
      View3DOptions.VertOffset = -14
      View3DOptions.Zoom = 105
      View3DWalls = False
      Align = alClient
      Color = clBlack
      TabOrder = 0
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object Series2: TFastLineSeries
        Legend.Text = 'Norm'
        LegendTitle = 'Norm'
        Selected.Hover.Visible = True
        SeriesColor = clBlue
        Title = 'Norm'
        LinePen.Color = clBlue
        LinePen.Width = 7
        TreatNulls = tnDontPaint
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series1: TFastLineSeries
        Legend.Text = 'Stk'
        LegendTitle = 'Stk'
        Selected.Hover.Visible = True
        Active = False
        SeriesColor = 4227327
        Title = 'Stk (OPC)'
        LinePen.Color = 4227327
        LinePen.Width = 7
        TreatNulls = tnDontPaint
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series3: TFastLineSeries
        SeriesColor = clLime
        Title = 'Stk'
        LinePen.Color = clLime
        LinePen.Width = 6
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object pnlTopScore: TPanel
      Left = 1015
      Top = 1
      Width = 305
      Height = 687
      Align = alRight
      Color = clBackground
      ParentBackground = False
      TabOrder = 1
      object lblTopscorer: TLabel
        Left = 88
        Top = 11
        Width = 114
        Height = 27
        Caption = 'Top Scorer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPosHdr: TLabel
        Left = 4
        Top = 47
        Width = 33
        Height = 18
        Caption = 'Pos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPcsHdr: TLabel
        Left = 93
        Top = 47
        Width = 72
        Height = 18
        Caption = 'Stk/skift'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTeamHdr: TLabel
        Left = 43
        Top = 47
        Width = 40
        Height = 18
        Caption = 'Hold'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDateHdr: TLabel
        Left = 195
        Top = 47
        Width = 42
        Height = 18
        Caption = 'Dato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 18
        Top = 72
        Width = 7
        Height = 20
        Caption = '1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblPos1Pcs: TLabel
        Left = 92
        Top = 70
        Width = 79
        Height = 24
        Alignment = taRightJustify
        Caption = '999.999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -21
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblPos1Team: TLabel
        Left = 59
        Top = 72
        Width = 7
        Height = 20
        Caption = '9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblPos1Date: TLabel
        Left = 186
        Top = 72
        Width = 64
        Height = 20
        Caption = '99-99-9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblShiftHdr: TLabel
        Left = 258
        Top = 47
        Width = 40
        Height = 18
        Caption = 'Skift'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPos1Shift: TLabel
        Left = 275
        Top = 72
        Width = 7
        Height = 20
        Caption = '9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label19: TLabel
        Left = 18
        Top = 102
        Width = 7
        Height = 20
        Caption = '2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblPos2Pcs: TLabel
        Left = 92
        Top = 100
        Width = 79
        Height = 24
        Alignment = taRightJustify
        Caption = '999.999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -21
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblPos2Team: TLabel
        Left = 59
        Top = 102
        Width = 7
        Height = 20
        Caption = '9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblPos2Date: TLabel
        Left = 186
        Top = 102
        Width = 64
        Height = 20
        Caption = '99-99-9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblPos2Shift: TLabel
        Left = 275
        Top = 102
        Width = 7
        Height = 20
        Caption = '9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label24: TLabel
        Left = 18
        Top = 130
        Width = 7
        Height = 20
        Caption = '3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblPos3Pcs: TLabel
        Left = 92
        Top = 128
        Width = 79
        Height = 24
        Alignment = taRightJustify
        Caption = '999.999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -21
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblPos3Team: TLabel
        Left = 59
        Top = 130
        Width = 7
        Height = 20
        Caption = '9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblPos3Date: TLabel
        Left = 186
        Top = 130
        Width = 64
        Height = 20
        Caption = '99-99-9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblPos3Shift: TLabel
        Left = 275
        Top = 130
        Width = 7
        Height = 20
        Caption = '9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object GradientLabel1: TGradientLabel
        Left = 1
        Top = 643
        Width = 303
        Height = 43
        Align = alBottom
        Alignment = taCenter
        Caption = 'Brdr. Hartmann'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2434341
        Font.Height = -37
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = []
        ParentFont = False
        Transparent = True
        EllipsType = etNone
        GradientType = gtFullHorizontal
        GradientDirection = gdLeftToRight
        Indent = 0
        Orientation = goHorizontal
        TransparentText = False
        VAlignment = vaTop
        Version = '1.2.0.1'
        ExplicitWidth = 281
      end
    end
  end
  object dOPCServer1: TdOPCServer
    ServerName = '{6E617109-FF2D-11D2-8087-00105AA8F840}'
    Active = False
    ClientName = 'dOPC DA Client'
    KeepAlive = 0
    Version = '4.35'
    OnConnect = dOPCServer1Connect
    OnDisconnect = dOPCServer1Disconnect
    Protocol = coCOM
    Params.Strings = (
      'xml-user='
      'xml-pass='
      'xml-proxy=')
    OPCGroups = <>
    OPCGroupDefault.IsActive = True
    OPCGroupDefault.UpdateRate = 1000
    OPCGroupDefault.LocaleId = 0
    OPCGroupDefault.TimeBias = 0
    ConnectDelay = 300
    OnDatachange = dOPCServer1Datachange
    ComputerName = 'SDKTOFIX001'
    Left = 15
    Top = 144
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 15
    Top = 192
  end
  object qryHitLst2: TFDQuery
    Connection = FDCNCN
    SQL.Strings = (
      'SELECT TOP 10'
      '   F.ProductionDate, F.ProductionShift   '
      '   , T.ProductionTeamProd   , SUM(ProductionNet) AS NETTOOUT '
      'FROM Fix_Prod1 F'
      
        '   LEFT JOIN Fix_ProdPrintTeam1 T ON F.ProductionDate = T.Produc' +
        'tionDate AND F.ProductionShift = T.ProductionShift '
      
        'WHERE ProductionMouldingLine=70 AND (F.ProductionDate <> '#39'2018-1' +
        '0-27'#39' OR F.ProductionShift <> 3) '
      
        'GROUP BY F.ProductionDate, F.ProductionShift, T.ProductionTeamPr' +
        'od '
      
        'ORDER BY SUM(ProductionNet) DESC,F.ProductionDate, F.ProductionS' +
        'hift')
    Left = 112
    Top = 8
  end
  object qryDBVal: TFDQuery
    Connection = FDCNCN
    SQL.Strings = (
      'SELECT F.ProductionDate, F.ProductionShift,'
      '  CASE F.ProductionShift '
      '    WHEN 1 THEN DATEADD(hour,7,F.ProductionDate)'
      '    WHEN 2 THEN DATEADD(hour,15,F.ProductionDate)'
      '    WHEN 3 THEN DATEADD(hour,23,F.ProductionDate) '
      '  END SHIFTDATE'
      '    , SUM(ProductionGross) GROSS, SUM(ProductionWasteWet) WASTE'
      '    , SUM(ProductionGross-ProductionWasteWet) NETTO '
      '    , SUM(ProductionNet) AS NETTOOUT'
      
        '    , SUM(ProductionWasteDry1+ProductionWasteDry2+ProductionWast' +
        'eDry3+ProductionWasteDry4) WASTEALL'
      'FROM Fix_Prod1 F '
      
        '    LEFT JOIN Fix_ProdPrintTeam1 T ON F.ProductionDate = T.Produ' +
        'ctionDate AND F.ProductionShift = T.ProductionShift '
      
        'WHERE F.ProductionDate between GETDATE()-1 AND GETDATE()+1 AND P' +
        'roductionMouldingLine=70'
      
        'GROUP BY F.ProductionDate, F.ProductionShift, T.ProductionTeamPr' +
        'od '
      'ORDER BY F.ProductionDate desc, F.ProductionShift desc'
      '')
    Left = 59
    Top = 8
  end
  object FDCNCN: TFDConnection
    Params.Strings = (
      'Database=SRODB1'
      'User_Name=program1'
      'Password=smp4519'
      'Server=SDKTOFIXDB02'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 8
    Top = 8
  end
  object qryOEEHistLog: TFDQuery
    Connection = FDCNCN
    SQL.Strings = (
      'SELECT [HistLogID]'
      '      ,[ItemsPcs]'
      '      ,[WastePcs]'
      '      ,[LogTime]'
      '  FROM [OEE].[dbo].[BH_HistLog]'
      '  WHERE AreaID=6 and LogTime > GetDate()-3.5'
      '  order by logtime')
    Left = 177
    Top = 9
  end
  object cdsGrp: TFDQuery
    Connection = FDCNCN
    SQL.Strings = (
      'SELECT [DT]'
      '      ,[LT]'
      '      ,[G0]'
      '      ,[G1]'
      '      ,[G2]'
      '      ,[G3]'
      '      ,[G4]'
      '      ,[G5]'
      '      ,[G6]'
      '      ,[G7]'
      '      ,[G8]'
      '      ,[G9]'
      '      ,[G10]'
      '      ,[G11]'
      '      ,[G12]'
      '      ,[G13]'
      '      ,[G14]'
      '      ,[G15]'
      '      ,[G16]'
      '      ,[G17]'
      '      ,[G18]'
      '      ,[G19]'
      '      ,[G20]'
      '      ,[G21]'
      '      ,[G22]'
      '      ,[G23]'
      '      ,[G24]'
      '      ,[G25]'
      '      ,[G26]'
      '      ,[G27]'
      '      ,[G28]'
      '      ,[G29]'
      '      ,[G30]'
      '  FROM [SRODB1].[dbo].[FIX_PrTrData]'
      '  WHERE DT > GETDATE()-5 OR LT>9999')
    Left = 12
    Top = 64
  end
end
