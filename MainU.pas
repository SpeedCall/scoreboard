unit MainU;

interface

uses
  Windows, Messages, SysUtils, Variants, System.Classes, Graphics, Forms, Vcl.Controls, Vcl.StdCtrls,
  Dialogs, dOPCIntf, dOPCComn, dOPC, dOPCDA, Vcl.ExtCtrls, Vcl.Grids, System.UITypes, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, System.Generics.Collections, Vcl.Samples.Spin, Datasnap.DBClient, Data.DB, Data.Win.ADODB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, GradientLabel;

const
  TAB_SCORE     = 0;
  TAB_SETTINGS  = 1;

type
  TScoreBox = record
    lblPos    : TGradientLabel;
    lblTeam   : TGradientLabel;
    lblPcs    : TGradientLabel;
    lblDate   : TGradientLabel;
    lblShift  : TGradientLabel;
  end;
  TOPCRec = class
  private
    FValue : double;
    procedure SetValue(Value:double);
  public
    TagName : string;
    TagNameConf : string;  //confirm
    Desc : string;
    Scale : double;
    HistVal : array[0..40] of double;
    Group : Integer;
    property Value:double read FValue write SetValue;
  end;
  TOPCRecList = class(TList)
  private
    function Get(Index: Integer): TOPCRec;  // any class
  public
    destructor Destroy; override;
    function Add(Value: TOPCRec): Integer;
    property Items[Index: Integer]: TOPCRec read Get; default;
  end;
  TfrmScoreboard = class(TForm)
    dOPCServer1: TdOPCServer;
    Timer1: TTimer;
    pnlScoreboard: TPanel;
    Chart: TChart;
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    qryHitLst2: TFDQuery;
    qryDBVal: TFDQuery;
    FDCNCN: TFDConnection;
    pnlTopScore: TPanel;
    lblTopscorer: TLabel;
    lblPosHdr: TLabel;
    lblPcsHdr: TLabel;
    lblTeamHdr: TLabel;
    lblDateHdr: TLabel;
    Label13: TLabel;
    lblPos1Pcs: TLabel;
    lblPos1Team: TLabel;
    lblPos1Date: TLabel;
    lblShiftHdr: TLabel;
    lblPos1Shift: TLabel;
    Label19: TLabel;
    lblPos2Pcs: TLabel;
    lblPos2Team: TLabel;
    lblPos2Date: TLabel;
    lblPos2Shift: TLabel;
    Label24: TLabel;
    lblPos3Pcs: TLabel;
    lblPos3Team: TLabel;
    lblPos3Date: TLabel;
    lblPos3Shift: TLabel;
    pnlSettings: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    btnAddTag: TButton;
    btnDeleteTag: TButton;
    edtOPCSrvID: TEdit;
    edtTagName: TEdit;
    OPCSrvNameIP: TEdit;
    sgrdTags: TStringGrid;
    Splitter1: TSplitter;
    pnlBottom: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    btnDisconnect: TButton;
    btnConnect: TButton;
    btnRefresh: TButton;
    Button1: TButton;
    Edit1: TEdit;
    chkAutoRefresh: TCheckBox;
    GradientLabel1: TGradientLabel;
    qryOEEHistLog: TFDQuery;
    Series3: TFastLineSeries;
    Panel1: TPanel;
    sgrd: TStringGrid;
    Label9: TLabel;
    ShownShift: TSpinEdit;
    Label8: TLabel;
    edtPrdShift: TEdit;
    Label6: TLabel;
    speed: TSpinEdit;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    cdsGrp: TFDQuery;
    mmLog: TMemo;
    procedure FormDestroy(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure dOPCServer1Connect(Sender: TObject);
    procedure dOPCServer1Datachange(Sender: TObject; ItemList: TdOPCItemList);
    procedure dOPCServer1Disconnect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnAddTagClick(Sender: TObject);
    procedure btnDeleteTagClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure sgrdTagsClick(Sender: TObject);
    procedure sgrdTagsEnter(Sender: TObject);
    procedure sgrdTagsKeyPress(Sender: TObject; var Key: Char);
    procedure ShownShiftChange(Sender: TObject);
  private
    tmrTIC : Integer;
    opcLst : TOPCRecList;
    timReconnect : Integer;
    opcgrp : TdOPCGroup;
    timDoConnect: Integer;
    xcdsGrp: TClientDataset;
    DBVal: Integer;
    FActivePage: Integer;
    LastM: Integer;
    LastVal: Integer;
    ifb : array[0..10] of TScoreBox;
    ProdGNb: Integer;
    ProdLine: Integer;
    ProdType: Integer;
    tmrShownShifts: Integer;
    procedure CreateDataset;
    procedure CreateInfoBox(Index, aLeft, aTop: Integer; const Cap: string; fColor: TColor);
    function CreateLabel(own: TWinControl; aLeft, aTop: Integer; const Cap: string; fColor: TColor; Alignment: TAlignment = taLeftJustify;
              aWidth: Integer = 0): TGradientLabel;
    procedure doLog(const Value: string);
    procedure GetDBValSQL;
    procedure GetHistLstSQL;
    procedure LoadList;
    procedure ReadDBVal(aDate: TDateTime; ShiftTime, hour, min: Integer);
    procedure RefreshChart(dt: TDateTime; Val: Integer);
    procedure SaveList(SaveAll: Boolean = False);
    procedure UpdateTags;
    procedure ReadSettings;
    procedure RefreshHitList;
    procedure RefreshSettings;
    procedure SetActivePage(Move: Integer = 0);
    procedure SetFActivePage(Value:Integer);
    procedure UpdateHitLst(aRow: Integer; Team, Netto, aDate, Shift: string);
    { Private declarations }
  public
    procedure AddTag(Text: string);
    property ActivePage: Integer read FActivePage write SetFActivePage;
    { Public declarations }
  end;

var
  frmScoreboard: TfrmScoreboard;
const
  UPDATEINTV      = 60;
  PRODTYPE_PRD    = 1;
  PRODTYPE_TRA    = 2;
  SQL_HSTLST_PRD  = 'SELECT TOP 10 '+
                    '  F.ProductionDate, F.ProductionShift '+
                    '  , T.ProductionTeamProd '+
                    '  , SUM(ProductionNet) AS NETTO '+
                    'FROM Fix_Prod1 F '+
                    '  LEFT JOIN Fix_ProdPrintTeam1 T ON F.ProductionDate = T.ProductionDate AND F.ProductionShift = T.ProductionShift '+
                    'WHERE ProductionMouldingLine=:PLine AND (F.ProductionDate > GETDATE()-365) AND (F.ProductionDate <> ''2018-10-27'' OR F.ProductionShift <> 3) '+  //--Omstilling vintertid(skifte på 9 timer)
                    'GROUP BY F.ProductionDate, F.ProductionShift, T.ProductionTeamProd '+
                    'ORDER BY SUM(ProductionNet) DESC,F.ProductionDate, F.ProductionShift';
  SQL_HSTLST_TRA  = 'SELECT TOP 10 '+
                    '  F.ProductionDate, F.ProductionShift '+
                    '  , T.ProductionTeamProd '+
                    '  , SUM(ProductionNet) AS NETTO '+
                    'FROM Fix_Print1 F '+
                    '  LEFT JOIN Fix_ProdPrintTeam1 T ON F.ProductionDate = T.ProductionDate AND F.ProductionShift = T.ProductionShift '+
                    'WHERE ProductionLine=:PLine AND (F.ProductionDate > GETDATE()-365) AND (F.ProductionDate <> ''2018-10-27'' OR F.ProductionShift <> 3) '+
                    'GROUP BY F.ProductionDate, F.ProductionShift, T.ProductionTeamProd '+
                    'ORDER BY SUM(ProductionNet) DESC,F.ProductionDate, F.ProductionShift';
  SQL_DBVAL_PRD   = 'SELECT F.ProductionDate, F.ProductionShift, '+
                    '  SUM(ProductionGross) GROSS, SUM(ProductionGross-ProductionWasteWet) NETTO2, SUM(ProductionNet) AS NETTO '+
                    'FROM Fix_Prod1 F '+
                    '  LEFT JOIN Fix_ProdPrintTeam1 T ON F.ProductionDate = T.ProductionDate AND F.ProductionShift = T.ProductionShift '+
                    'WHERE F.ProductionDate between GETDATE()-1.25 AND GETDATE()+1 AND F.ProductionShift=:PShift AND ProductionMouldingLine=:PLine '+
                    'GROUP BY F.ProductionDate, F.ProductionShift, T.ProductionTeamProd '+
                    'ORDER BY F.ProductionDate desc, F.ProductionShift desc';
  SQL_DBVAL_TRA   = 'SELECT F.ProductionDate, F.ProductionShift, '+
                    '  SUM(ProductionGross) GROSS, SUM(ProductionNet) AS NETTO '+
                    'FROM Fix_Print1 F LEFT JOIN Fix_ProdPrintTeam1 T ON F.ProductionDate = T.ProductionDate AND F.ProductionShift = T.ProductionShift '+
                    'WHERE F.ProductionDate between GETDATE()-1.25 AND GETDATE()+1 AND F.ProductionShift=:PShift AND F.ProductionLine=:PLine '+
                    'GROUP BY F.ProductionLine, F.ProductionDate, F.ProductionShift, T.ProductionTeamProd '+
                    'ORDER BY F.ProductionLine, F.ProductionDate desc, F.ProductionShift desc ';

implementation

uses
  IniFiles, dOPCCOM, System.Math, CommonU, System.DateUtils, VclTee.TeCanvas;

{$R *.dfm}

procedure TOPCRec.SetValue(Value:double);
begin
  if Value<>FValue then
  begin
    FValue := Value;
  end;
end;

function TOPCRecList.Get(Index: Integer): TOPCRec;
begin
  Result := TOPCRec(inherited Get(Index));
end;

destructor TOPCRecList.Destroy;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    Items[i].Free;
  inherited;
end;

function TOPCRecList.Add(Value: TOPCRec): Integer;
begin
  Result := inherited Add(Value);
end;

procedure TfrmScoreboard.FormDestroy(Sender: TObject);
begin
//  FreeAndNil(xcdsGrp);
end;

procedure TfrmScoreboard.AddTag(Text: string);
  var
    i,z : Integer;
    b : Boolean;
begin
{  b := True;
  for i := 0 to lbTags.Items.Count-1 do
    if UpperCase(lbTags.Items[i]) = UpperCase(Text) then
    begin
      b := False;
      break;
    end;
  if b then
    lbTags.Items.Add(Text);
}
  b := True; z := -1;
  for i := 1 to sgrdTags.RowCount-1 do
    if UpperCase(sgrdTags.Cells[0,i]) = UpperCase(Text) then
    begin
      b := False;
      break;
    end
    else
      if (z < 0) and (Length(sgrdTags.Cells[0,i]) = 0) then
        z := i;
  if b then
  begin
    if z < 0 then
    begin
      z := sgrdTags.RowCount;
      sgrdTags.RowCount := z + 1;
    end;
    sgrdTags.Cells[0,z] := Text;
  end;
end;

procedure TfrmScoreboard.ReadSettings;
  var
    ini: TIniFile;
    s: string;
    i : Integer;
begin
  ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    edtOPCSrvID.Text := ini.ReadString('Settings', 'OPCID', '{6E617109-FF2D-11D2-8087-00105AA8F840}');
    OPCSrvNameIP.Text := ini.ReadString('Settings', 'OPCIP', 'SDKTOFIX001');
    ini.WriteInteger('Settings', 'ProdType', ini.ReadInteger('Settings', 'ProdType', PRODTYPE_PRD));
    ProdType := ini.ReadInteger('Settings', 'ProdType', PRODTYPE_PRD);
    ini.WriteInteger('Settings', 'ProdLine', ini.ReadInteger('Settings', 'ProdLine', 70));
    ProdLine := ini.ReadInteger('Settings', 'ProdLine', 70);
    ini.WriteString('Settings', 'HEADER', ini.ReadString('Settings', 'HEADER', '')); // Insure that the field exists
    Chart.Title.Text.Text := 'Prod/Shift  ' + ini.ReadString('Settings', 'HEADER', '');
    i := 1;
    repeat
      s := ini.ReadString('TAGSDESC', 'OPCT' + IntToStr(i), '');
      if Length(s) > 5 then
      begin
        if sgrdTags.RowCount <= i then
          sgrdTags.RowCount := i + 1;
        sgrdTags.Cells[0, i] := s;
        sgrdTags.Cells[1, i] := ini.ReadString('TAGSDESC', 'OPCD' + IntToStr(i), '');
        sgrdTags.Cells[2, i] := ini.ReadString('TAGSDESC', 'OPCE' + IntToStr(i), '');
        sgrdTags.Cells[3, i] := ini.ReadString('TAGSDESC', 'OPCF' + IntToStr(i), '');
        sgrdTags.Cells[4, i] := ini.ReadString('TAGSDESC', 'OPCG' + IntToStr(i), '');
        sgrdTags.Cells[5, i] := ini.ReadString('TAGSDESC', 'OPCM' + IntToStr(i), '');
      end;
      Inc(i);
    until (Length(s) < 6);
    {    if (lbTags.Items.Count < 1) and (sgrdTags.RowCount < 3) then
    begin
      AddTag('UCON.LEUZE_MM41.BCL308i');
      AddTag('UCON.SICK_MM51.CLV630');
    end;
}
    CheckBox1.Checked := ini.ReadBool('Settings', 'ShowNorm', CheckBox1.Checked);
    CheckBox2.Checked := ini.ReadBool('Settings', 'ShowStk', CheckBox2.Checked);
    CheckBox3.Checked := ini.ReadBool('Settings', 'ShowOPC', CheckBox3.Checked);
    CheckBox3.onClick := CheckBox3Click;
    Series1.Active := CheckBox3.Checked;
    Series3.Active := CheckBox2.Checked;

    Top := ini.ReadInteger('Settings', 'T', Top);
    Left := ini.ReadInteger('Settings', 'L', Left);
    Width := ini.ReadInteger('Settings', 'W', Width);
    Height := ini.ReadInteger('Settings', 'H', Height);
    edtPrdShift.Text := ini.ReadInteger('Settings', 'PrdShift', 200000).ToString;
    Speed.Value := ini.ReadInteger('Settings', 'ChartRefreshRate', 10);
    ShownShift.Value := ini.ReadInteger('Settings', 'ShownShift', 10);
  finally
    ini.Free;
  end;
end;

procedure TfrmScoreboard.btnAddTagClick(Sender: TObject);
begin
  AddTag(edtTagName.Text);
end;

procedure TfrmScoreboard.UpdateTags;
  var
    i,z : Integer;
    rec : TOPCRec;
    buf : double;
begin
  for i := 0 to opcLst.Count-1 do
  begin
    rec := opcLst.Items[i];
    if (rec.HistVal[0] < 10) or (rec.HistVal[0]>(rec.Value*rec.Scale)) then
      rec.HistVal[0] := rec.Value*rec.Scale;
    buf := rec.Value*rec.Scale - rec.HistVal[0];
    for z := High(rec.HistVal) downto 2 do
      rec.HistVal[z] := rec.HistVal[z-1]+buf;
    rec.HistVal[1] := buf;
    rec.HistVal[0] := rec.Value*rec.Scale;
  end;

end;

procedure TfrmScoreboard.btnConnectClick(Sender: TObject);
  var
    //itm : TdOPCItem;
    i : Integer;
    rec : TOPCRec;
begin
  try
    timReconnect := 0;
    dOPCServer1.Active := False;
    dOPCServer1.ServerName := edtOPCSrvID.Text;
    dOPCServer1.ComputerName := OPCSrvNameIP.Text;
    dOPCServer1.OPCGroups.Clear;
    opcgrp := dOPCServer1.OPCGroups.Add('BHM');
    if Assigned(opcgrp) then
    begin
      for i := 1 to sgrdTags.RowCount-1 do
        if (Length(sgrdTags.Cells[0,i]) > 0) and (sgrdTags.Cells[2,i] = 'Y') then
        begin
          opcgrp.OPCItems.AddItem(sgrdTags.Cells[0,i]);
          //itm.Tag := StrToIntDef(sgrdTags.Cells[3,i],1);
          // itm.RequestDatatype := VTi2;
          rec := TOPCRec.Create;
          rec.TagName := sgrdTags.Cells[0,i];
          rec.Desc  := sgrdTags.Cells[1,i];
          rec.Scale := StrToFloatDef(sgrdTags.Cells[3,i],1);
          rec.Group := StrToIntDef(sgrdTags.Cells[4,i],0);
          opcLst.Add(rec);
        end;
      try
        dOPCServer1.Active := True;
      except
        dOPCServer1.Active := False;
        timReconnect := 300;
      end;
    end;
  except
    on e:Exception do
      MessageDlg('Error in btnConnectClick:'+e.ClassName+' - '+e.Message,mtError,[mbOK],0)
  end;
end;

procedure TfrmScoreboard.btnDeleteTagClick(Sender: TObject);
  var
    i,z,p : Integer;
begin
  if edtTagName.Text <> '' then
  begin
    i := sgrdTags.Row;
    if i >= 0 then
    begin
      for z := i to sgrdTags.RowCount-2 do
      begin
        for p := 0 to sgrdTags.ColCount-1 do
          sgrdTags.Cells[p,z] := sgrdTags.Cells[p,z+1];
      end;
      for p := 0 to sgrdTags.ColCount-1 do
        sgrdTags.Cells[p,sgrdTags.RowCount-1] := '';

      sgrdTags.RowCount := sgrdTags.RowCount-1;
      if i > sgrdTags.RowCount-1 then
        sgrdTags.Row := sgrdTags.RowCount-1
      else
        sgrdTags.Row := i;
    end;
    sgrdTagsClick(nil);
  end;
end;

procedure TfrmScoreboard.btnDisconnectClick(Sender: TObject);
begin
  timReconnect := 0;
  dOPCServer1.Active := False;
end;

procedure TfrmScoreboard.btnRefreshClick(Sender: TObject);
begin
  try
    label5.Caption := 'Last refresh:'+FormatDateTime('hh:nn:ss',now);
    if dOPCServer1.Active then
    begin
      //grp := dOPCServer1.OPCGroups.GetOPCGroup('BHM');
      if Assigned(opcgrp) then
      begin
        opcgrp.AsyncRead();
      end;
    end;
  except
    on e:Exception do
    begin
      dOPCServer1.Active := False;
      MessageDlg('Error in btnRefresh :'+e.ClassName+' - '+e.Message,mtError,[mbOK],0);
      timReconnect := 300;
    end;
  end;
end;

procedure TfrmScoreboard.Button1Click(Sender: TObject);
begin
  Edit1.Text := PromptDataSource(Handle, Edit1.Text);
  Edit1.Visible := True;
end;

procedure TfrmScoreboard.CheckBox1Click(Sender: TObject);
begin
  Series2.Active := CheckBox1.Checked;
  Series1.Active := CheckBox3.Checked;
  Series3.Active := CheckBox2.Checked;
end;

procedure TfrmScoreboard.CheckBox3Click(Sender: TObject);
begin
  if not Series1.Active and CheckBox3.Checked then
    btnConnect.Click
  else
  begin
    if not CheckBox3.Checked then
      btnDisconnect.Click;
    tmrShownShifts := 4;
  end;
  Series3.Active := CheckBox2.Checked;
end;

procedure TfrmScoreboard.CreateDataset;
begin
  xcdsGrp := TClientDataset.Create(Self);
  CreateField(xcdsGrp,'DT',ftDateTime,0,fkData);
  CreateField(xcdsGrp,'G110',ftFloat,0,fkData);
  xcdsGrp.IndexFieldNames := 'DT';
  xcdsGrp.CreateDataSet;
  LoadList;
end;

procedure TfrmScoreboard.CreateInfoBox(Index, aLeft, aTop: Integer; const Cap: string; fColor: TColor);
begin
  ifb[Index].lblPos  := CreateLabel(pnlTopScore,lblPosHdr.Left,aTop,Cap,fColor,taCenter,lblPosHdr.Width);
  ifb[Index].lblTeam := CreateLabel(pnlTopScore,lblTeamHdr.Left,aTop,'#',fColor,taCenter,lblTeamHdr.Width);
  ifb[Index].lblPcs  := CreateLabel(pnlTopScore, 92+35,aTop-6,'###.###',fColor,taRightJustify);
//  if Index < 3 then
    ifb[Index].lblPcs.Font.Size := 16;
//  else
//    ifb[Index].lblPcs.Top  := aTop;
  ifb[Index].lblDate := CreateLabel(pnlTopScore,186,aTop,'##-##-####',fColor);
  ifb[Index].lblShift:= CreateLabel(pnlTopScore,258,aTop,'#',fColor,taCenter,lblShiftHdr.Width);
end;

function TfrmScoreboard.CreateLabel(own: TWinControl; aLeft, aTop: Integer; const Cap: string; fColor: TColor; Alignment: TAlignment =
          taLeftJustify; aWidth: Integer = 0): TGradientLabel;
begin
  Result := TGradientLabel.Create(own);
  Result.Parent := own;
  Result.Top := aTop;
  Result.Left := aLeft;
  Result.Transparent := True;
  if Alignment = taCenter then
  Begin
    Result.AutoSize := False;
    Result.Width := aWidth;
  end;
  Result.Caption := Cap;
  Result.Alignment := Alignment;
  Result.Font.Size := 10;
  Result.Font.Name := 'Arial Rounded MT Bold';
  if fColor > 0 then
    Result.Font.Color := fColor;
end;

procedure TfrmScoreboard.doLog(const Value: string);
begin
  mmLog.Lines.Insert(0,FormatDateTime('dd-mm-yyyy hh:nn:ss',now)+ #9 + Value);
end;

procedure TfrmScoreboard.dOPCServer1Connect(Sender: TObject);
begin
  Label7.Caption := 'CONNECTED';
end;

procedure TfrmScoreboard.dOPCServer1Datachange(Sender: TObject; ItemList: TdOPCItemList);
  var
    Grp110: Integer;
    i,z : Integer;
    rec : TOPCRec;
    updated : Boolean;
begin
  updated := False;
  try
    Grp110 := 0;
    for i := 0 to dOPCServer1.OPCGroups[0].OPCItems.Count-1 do
    begin
      rec := opcLst.Items[i];
      if dOPCServer1.OPCGroups[0].OPCItems[i].IsGoodQuality then
      begin
        if i > sgrd.RowCount-2 then sgrd.RowCount := i+2;
        rec.TagNameConf := dOPCServer1.OPCGroups[0].OPCItems[i].ItemID;
        rec.Value := dOPCServer1.OPCGroups[0].OPCItems[i].Value;
        if rec.TagName=rec.TagNameConf then
        begin
          sgrd.Cells[0,i+1] := rec.TagName;
          sgrd.Cells[1,i+1] := rec.Desc;
//          if sgrd.Cells[2,i+1] <> FloatToStr(rec.Value*rec.Scale) then updated := True;
          sgrd.Cells[2,i+1] := FloatToStr(rec.Value*rec.Scale);
        end
        else
          sgrd.Cells[0,i+1] := '??????';
      end;
      case rec.Group of
        110 : Grp110 := Grp110+Trunc(rec.Value*rec.Scale);
      end;
    end;
    RefreshChart(now,Grp110);
    if updated then
    begin
      Label4.Caption := 'Last update:'+FormatDateTime('hh:nn:ss',now);
      for i := 0 to dOPCServer1.OPCGroups[0].OPCItems.Count-1 do
        for z := sgrd.ColCount-1 downto 3 do
          sgrd.Cells[z,i+1] := sgrd.Cells[z-1,i+1];
    end;
    timReconnect := 300;
  except
    on e:Exception do
      MessageDlg('Error in dOPCServer1Datachange:'+e.ClassName+' - '+e.Message,mtError,[mbOK],0)
  end;
end;

procedure TfrmScoreboard.dOPCServer1Disconnect(Sender: TObject);
begin
  Label7.Caption := 'DISCONNECTED';
end;

procedure TfrmScoreboard.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveList(True);
end;

procedure TfrmScoreboard.FormCreate(Sender: TObject);
  var
    i : Integer;
    s : string;
begin
  mmLog.Clear;
  opcLst := TOPCRecList.Create;
  timReconnect := 0;
  timDoConnect := 5;
  tmrShownShifts := 4;
  LastM := -1;
  LastVal := -1;
  sgrd.Cells[0,0] := 'TAG NAME';
  sgrd.Cells[1,0] := 'DESCRIPTION';
  sgrd.Cells[2,0] := 'PCS/Shift';
  for i := 3 to sgrd.ColCount-1 do
    sgrd.Cells[i,0] := IntToStr(i-3);
  sgrdTags.Cells[0,0] := 'TAG NAME';
  sgrdTags.Cells[1,0] := 'DESCRIPTION';
  sgrdTags.Cells[3,0] := 'FACTOR';
  sgrdTags.Cells[4,0] := 'Group';
  sgrdTags.Cells[5,0] := '';
  ReadSettings;
  for i := 0 to ParamCount do
    if Pos('PRODTYPE:',UpperCase(ParamStr(i))) > 0 then
    begin
      ExplodeStr(':',s,ParamStr(i));
      ProdType := StrToIntDef(s,PRODTYPE_PRD);
    end
    else if Pos('PRODLINE:',UpperCase(ParamStr(i))) > 0 then
    begin
      ExplodeStr(':',s,ParamStr(i));
      ProdLine := StrToIntDef(s,70);
    end
    else if Pos('HEADER:',UpperCase(ParamStr(i))) > 0 then
    begin
      ExplodeStr(':',s,ParamStr(i));
      Chart.Title.Text.Text := 'Prod/Shift  ' +s;
    end;
  if ProdType = PRODTYPE_PRD then
    ProdGNb := ProdLine div 10 - 1      // 0 - 7
  else
    ProdGNb := ProdLine + 7;            // 8 - 15
  GetHistLstSQL;
  GetDBValSQL;
//  CreateDataset;
  dOPCInitSecurity;
  ActivePage := TAB_SCORE;
  for i := 0 to 2 do
    CreateInfoBox(i,0,72+28*i,(i+1).ToString,clWhite);
  for i := 3 to 9 do
    CreateInfoBox(i,0,72+28*i,(i+1).ToString,$00505050);
end;

procedure TfrmScoreboard.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) and (ssctrl in Shift) then
    SetActivePage(CommonU.IfThen((ssshift in Shift),-1,1));
  if (Key = VK_ESCAPE) and (BorderStyle = bsNone) then
  begin
    Tag := 1;
    WindowState := wsNormal;
    BorderStyle := bsSizeable;
  end;
end;

procedure TfrmScoreboard.FormResize(Sender: TObject);
  var
    M : TMonitor;
begin
  M := Screen.MonitorFromWindow(frmScoreboard.Handle);
  if (Tag = 0) and (Width >= M.Width-5) and (Height >= M.Height-5) then
    WindowState := wsMaximized;
  if WindowState = wsMaximized then
  begin
    Tag := 0;
    BorderStyle := bsNone;
  end;
end;

procedure TfrmScoreboard.GetDBValSQL;
  var
    s : string;
begin
  if ProdType = PRODTYPE_PRD then
    s := SQL_DBVAL_PRD
  else
    s := SQL_DBVAL_TRA;
  qryDBVal.SQL.Text := StringReplace(s,':PLine',ProdLine.ToString,[rfReplaceAll]);
end;

procedure TfrmScoreboard.GetHistLstSQL;
  var
    s : string;
begin
  if ProdType = PRODTYPE_PRD then
    s := SQL_HSTLST_PRD
  else
    s := SQL_HSTLST_TRA;
  qryHitLst2.SQL.Text := StringReplace(s,':PLine',ProdLine.ToString,[rfReplaceAll]);
end;

procedure TfrmScoreboard.LoadList;
begin
  if FileExists(ChangeFileExt(Application.ExeName, '.dat')) then
  begin
    xcdsGrp.LoadFromFile(ChangeFileExt(Application.ExeName, '.dat'));
  end;
end;

procedure TfrmScoreboard.ReadDBVal(aDate: TDateTime; ShiftTime, hour, min: Integer);
  var
    shift : Integer;
begin
  if (hour in [7,15,23]) and (min < 15) then
    DBVal := 0
  else
  begin
    case ShiftTime of
       7 : shift := 1;
      15 : shift := 2;
    else
      shift := 3;
    end;
    qryDBVal.Params[0].Value := Shift;
    qryDBVal.Active  := True;
    while not qryDBVal.EOF do
    begin
      DBVal := qryDBVal.FieldByName('NETTO').AsInteger;
      Break;
    end;
    qryDBVal.Active  := False;
  end;
//  qryDBVal.Active  := True;
//  aDate := Trunc(aDate);
//  case ShiftTime of
//     7 : shift := 1;
//    15 : shift := 2;
//  else   shift := 3;
//  end;
//  DBVal := 0;
//  while not qryDBVal.EOF do
//  begin
//    if (qryDBVal.FieldByName('ProductionDate').AsDateTime = aDate) and (qryDBVal.FieldByName('ProductionShift').AsInteger = shift) then
//    begin
//      DBVal := qryDBVal.FieldByName('NETTO').AsInteger;
//      break;
//    end;
//    qryDBVal.Next;
//  end;
//  qryDBVal.Active  := False;
end;

procedure TfrmScoreboard.RefreshChart(dt: TDateTime; Val: Integer);
  var
    y,m,d,t,
    h,mn,s,ms : Word;
    tms,pcs : LONG64;
    iHourOf, lastHourOf : Integer;
    mI,mP,mO : TDateTime;
begin
  DecodeTime(dt,h,mn,s,ms);
  if (((mn-1) mod speed.Value = 0) or (Val < LastVal) or (LastM < 0)) and (mn <> LastM) or (Val = -99) then
  begin
    LastM := mn;
    case h of
       7..14 : t := 7;
      15..22 : t := 15;
    else
      t := 23;
    end;
    if (t = 23) and (h < 7) then tms := 1 else tms := 0;
    FDCNCN.Connected := True;
    cdsGrp.Active := True;
    RefreshSettings;
    SetFilter(cdsGrp,'LT=55');
    mI := Trunc(dt)-tms+EncodeTime(t,0,0,0);
    if Between(ShownShift.Value,1,10) then
      mP := IncHour(mI,-8*ShownShift.Value)
    else
      mP := mI;
    mO := IncHour(mI,8);
    Series3.Clear;
    cdsGrp.First;
    while not cdsGrp.Eof do
    begin
      if cdsGrp.FieldByName('DT').AsDateTime >= mP then
        Series3.AddXY(cdsGrp.FieldByName('DT').AsDateTime,
                      cdsGrp.FieldByName('G'+ProdGNb.ToString).AsFloat)
      else
        if cdsGrp.FieldByName('DT').AsDateTime < (mI-8) then
          cdsGrp.Delete;
      cdsGrp.Next;
    end;
    cdsGrp.Active := False;
    FDCNCN.Connected := False;
    tms := StrToIntDef(edtPrdShift.Text,-1);
    Series2.Clear;
    while mP < mI do
    begin
      Series2.AddXY(mP,0);
      mP := IncHour(mP,8);
      Series2.AddXY(mP,tms);
    end;
    Series2.AddXY(mI,0);
    Series2.AddXY(mO,tms);
  end;
end;

procedure TfrmScoreboard.RefreshHitList;
  var
    i : Integer;
begin
  i := 0;
  qryHitLst2.Active := True;
  while not qryHitLst2.Eof do
  begin
    Inc(i);
    UpdateHitLst(i,qryHitLst2.FieldByName('ProductionTeamProd').AsString,
                   FormatFloat('###,##0',qryHitLst2.FieldByName('NETTO').AsInteger),
                   FormatDateTime('dd-mm-yyyy',qryHitLst2.FieldByName('ProductionDate').AsDateTime),
                   qryHitLst2.FieldByName('ProductionShift').AsString);
    qryHitLst2.Next;
  end;
  qryHitLst2.Active := False;
end;

procedure TfrmScoreboard.RefreshSettings;
  var
    i : Integer;
    changed : Boolean;
begin
  changed := False;
  try
    cdsGrp.Filtered := False;
    if cdsGrp.Locate('LT',10000,[]) then
    begin
      if ProdGNb < 31 then
        edtPrdShift.Text := cdsGrp.FieldByName('G'+ProdGNb.ToString).AsString;
      changed := True;
    end;

    if cdsGrp.Locate('LT',10005,[]) then
      if (cdsGrp.FieldByName('G0').AsInteger <> ShownShift.Value) or
         (cdsGrp.FieldByName('G1').AsInteger <> Speed.Value) then
      begin
        ShownShift.Value := cdsGrp.FieldByName('G0').AsInteger;
        Speed.Value := cdsGrp.FieldByName('G1').AsInteger;
        changed := True;
      end;

  except
    on e:Exception do
      doLog('Error in RefreshSettings:'+e.ClassName+' - '+e.Message); //,mtError,[mbOK],0);
  end;
end;

procedure TfrmScoreboard.SaveList(SaveAll: Boolean = False);
  var
    ini : TIniFile;
    i : Integer;
begin
  ini := TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
  try
    if SaveAll then
    begin
      ini.WriteString('Settings','OPCID',edtOPCSrvID.Text);
      ini.WriteString('Settings','OPCIP',OPCSrvNameIP.Text);
      ini.EraseSection('TAGS');
      ini.EraseSection('TAGSDESC');
      for i := 1 to sgrdTags.RowCount-1 do
      begin
        ini.WriteString('TAGSDESC','OPCT'+IntToStr(i),sgrdTags.Cells[0,i]);
        ini.WriteString('TAGSDESC','OPCD'+IntToStr(i),sgrdTags.Cells[1,i]);
        ini.WriteString('TAGSDESC','OPCE'+IntToStr(i),sgrdTags.Cells[2,i]);
        ini.WriteString('TAGSDESC','OPCF'+IntToStr(i),sgrdTags.Cells[3,i]);
        ini.WriteString('TAGSDESC','OPCG'+IntToStr(i),sgrdTags.Cells[4,i]);
        ini.WriteString('TAGSDESC','OPCM'+IntToStr(i),sgrdTags.Cells[5,i]);
      end;
      ini.WriteInteger('Settings','T',Top);
      ini.WriteInteger('Settings','L',Left);
      ini.WriteInteger('Settings','W',Width);
      ini.WriteInteger('Settings','H',Height);
    end;
    ini.WriteInteger('Settings', 'PrdShift', StrToIntDef(edtPrdShift.Text,200000));
    ini.WriteInteger('Settings', 'ChartRefreshRate', Speed.Value);
    ini.WriteInteger('Settings', 'ShownShift', ShownShift.Value);
    ini.WriteBool('Settings', 'ShowNorm', CheckBox1.Checked);
    ini.WriteBool('Settings', 'ShowStk', CheckBox2.Checked);
    ini.WriteBool('Settings', 'ShowOPC', CheckBox3.Checked);
  finally
    ini.Free;
  end;
//  xcdsGrp.SaveToFile(ChangeFileExt(Application.ExeName, '.dat'));
end;

procedure TfrmScoreboard.SetActivePage(Move: Integer = 0);
begin
  FActivePage := FActivePage + Move;
  if FActivePage > TAB_SETTINGS then FActivePage := TAB_SCORE;
  if FActivePage < TAB_SCORE then FActivePage := TAB_SETTINGS;
  pnlScoreboard.Visible := FActivePage = TAB_SCORE;
  pnlSettings.Visible   := FActivePage = TAB_SETTINGS;
end;

procedure TfrmScoreboard.SetFActivePage(Value: Integer);
begin
  FActivePage := Value;
  SetActivePage;
end;

procedure TfrmScoreboard.sgrdTagsClick(Sender: TObject);
begin
  edtTagName.Text := sgrdTags.Cells[0,sgrdTags.Row];
//  lbTags.ItemIndex := lbTags.Items.IndexOf(edtTagName.Text);
end;

procedure TfrmScoreboard.sgrdTagsEnter(Sender: TObject);
begin
  sgrdTagsClick(nil);
end;

procedure TfrmScoreboard.sgrdTagsKeyPress(Sender: TObject; var Key: Char);
begin
  if sgrdTags.Col = 2 then
  begin
    case Key of
      #78,#110 : sgrdTags.Cells[2,sgrdTags.Row] := 'N';
      #89,#121 : sgrdTags.Cells[2,sgrdTags.Row] := 'Y';
      #32 : if sgrdTags.Cells[2,sgrdTags.Row] = 'N' then
              sgrdTags.Cells[2,sgrdTags.Row] := 'Y'
            else
              sgrdTags.Cells[2,sgrdTags.Row] := 'N';
    end;
    Key := #13;
  end;
end;

procedure TfrmScoreboard.ShownShiftChange(Sender: TObject);
begin
//  if dOPCServer1.Active then
    tmrShownShifts := 4;
end;

procedure TfrmScoreboard.Timer1Timer(Sender: TObject);
begin
  if dOPCServer1.Active then
  begin
    if tmrTIC mod UPDATEINTV = 0 then
    begin
      btnRefresh.Click;
      UpdateTags;
    end;
    Inc(tmrTIC);
  end;
  if TimerReady(timDoConnect) then
  begin
    if CheckBox3.Checked then
      btnConnect.Click;
    Chart.Gradient.StartColor := clblack;
    Chart.Gradient.EndColor := clblack;
    Chart.Title.Font.Color := clwhite;
    Chart.LeftAxis.LabelsFont.Color := clwhite;
    Chart.BottomAxis.LabelsFont.Color := clwhite;
//      RefreshHitList;
//      cncn.Connected := False;
    FDCNCN.Connected := True;
    RefreshHitList;
    FDCNCN.Connected := False;
  end;
  if timReconnect > 0 then
  begin
    Dec(timReconnect);
    Label4.Caption := 'Reconnect in:'+IntToStr(timReconnect);
    if timReconnect = 0 then
      try
        dOPCServer1.Active := True
      finally
        timReconnect := 60;
        dOPCServer1.Active := False;
      end;
  end;
  if chkAutoRefresh.checked then
    btnRefresh.Click;
  if TimerReady(tmrShownShifts) then
  begin
    RefreshChart(now,-99);
    if not dOPCServer1.Active then
      tmrShownShifts := 60*10;
  end;
end;

procedure TfrmScoreboard.UpdateHitLst(aRow: Integer; Team, Netto, aDate, Shift: string);
begin
  case aRow of
    1 : begin
          lblPos1Team.Caption := Team;
          lblPos1Pcs.Caption  := Netto;
          lblPos1Date.Caption := aDate;
          lblPos1Shift.Caption:= Shift;
        end;
    2 : begin
          lblPos2Team.Caption := Team;
          lblPos2Pcs.Caption  := Netto;
          lblPos2Date.Caption := aDate;
          lblPos2Shift.Caption:= Shift;
        end;
    3 : begin
          lblPos3Team.Caption := Team;
          lblPos3Pcs.Caption  := Netto;
          lblPos3Date.Caption := aDate;
          lblPos3Shift.Caption:= Shift;
        end;
  end;
  if aRow < 11 then
  begin
    ifb[aRow-1].lblTeam.Caption := Team;
    ifb[aRow-1].lblPcs.Caption  := Netto;
    ifb[aRow-1].lblDate.Caption := aDate;
    ifb[aRow-1].lblShift.Caption:= Shift;
  end;
end;

end.
