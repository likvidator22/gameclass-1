unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MemTableDataEh, Db, ADODB, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DBVertGridsEh, ExtCtrls, GridsEh, DBAxisGridsEh,
  ObjectInspectorEh, DBGridEh, MemTableEh, DataDriverEh, ADODataDriverEh,
  DBCtrls, XPMan;

type
  TForm1 = class(TForm)
    ADOConnectionProviderEh1: TADOConnectionProviderEh;
    ADODataDriverEh1: TADODataDriverEh;
    MemTableEh1: TMemTableEh;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    DBVertGridEh1: TDBVertGridEh;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    procedure ADOConnectionProviderEh1InlineConnectionBeforeConnect(
      Sender: TObject);
    procedure ADODataDriverEh1BuildDataStruct(DataDriver: TDataDriverEh;
      DataStruct: TMTDataStructEh);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ADOConnectionProviderEh1InlineConnectionBeforeConnect(
  Sender: TObject);
var
  FilePath: String;
begin
  if FileExists(ExtractFilePath(ParamStr(0))+'\BioLife.mdb') then
    FilePath := ExtractFilePath(ParamStr(0))+'\BioLife.mdb'
  else if FileExists(ExtractFilePath(ParamStr(0))+'..\Data\BioLife.mdb') then
    FilePath := ExtractFilePath(ParamStr(0))+'..\Data\BioLife.mdb'
  else if FileExists(ExtractFilePath(ParamStr(0))+'..\..\..\Data\BioLife.mdb') then
    FilePath := ExtractFilePath(ParamStr(0))+'..\..\..\Data\BioLife.mdb';

  ADOConnectionProviderEh1.InlineConnection.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;'+
    'Data Source=' + FilePath + ';'+
    'Mode=Share Deny None;Jet OLEDB:System database="";';
end;

procedure TForm1.ADODataDriverEh1BuildDataStruct(DataDriver: TDataDriverEh;
  DataStruct: TMTDataStructEh);
begin
  DataDriver.DefaultBuildDataStruct(DataStruct);
  TMTBlobDataFieldEh(DataStruct.FieldByName('Graphic')).BlobType := ftGraphic;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ShowObjectInspectorForm(DBGridEh1, Rect(Left+Width+10, Top, Left+Width+10+300, Top+Height));
end;

procedure TForm1.DBGridEh1Enter(Sender: TObject);
begin
  ShowObjectInspectorForm(Sender, Rect(Left+Width+10, Top, Left+Width+10+300, Top+Height));
end;

initialization
  DefFontData.Name := 'Tahoma';
end.
