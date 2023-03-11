unit Notes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Colorful, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.StdCtrls, cxButtons, cxControls,
  dxLayoutControlAdapters, dxLayoutcxEditAdapters, cxContainer, cxEdit,
  cxGroupBox, Vcl.ButtonGroup, dxLayoutContainer, cxClasses, dxLayoutControl,
  cxStyles, cxInplaceContainer, cxVGrid, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, dxDateRanges, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ExtDlgs, Data.Win.ADODB;

type
  TForm1 = class(TForm)
    cxButton1: TcxButton;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutItem1: TdxLayoutItem;
    cxGroupBox1: TcxGroupBox;
    dxLayoutItem2: TdxLayoutItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    SaveDialog1: TSaveDialog;
    dxLayoutItem4: TdxLayoutItem;
    cxButton4: TcxButton;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses NewNotes, UpdateNote;

procedure TForm1.cxButton1Click(Sender: TObject);
begin
Form2.Show;
end;

procedure TForm1.cxButton2Click(Sender: TObject);
begin
cxGrid1DBTableView1.DataController.DataSource.DataSet.Delete;
end;

procedure TForm1.cxButton3Click(Sender: TObject);
var F:TextFile;
i:integer;
CopyString:string;
begin
AdoTable1.Active:=True;
 if SaveDialog1.Execute then
 begin

      AssignFile(F,SaveDialog1.FileName);
      Rewrite(F);
      ADOQuery1.Open;
      WriteLn(F, 'Номер  Заметки');
      while not ADOQuery1.eof do
      begin
      CopyString:='';
      for i:=0 to ADOQuery1.FieldCount-1 do
      CopyString:=CopyString + ' ' + ADOQuery1.Fields[i].AsString + chr(VK_TAB);
      WriteLn(F, CopyString);
      ADOQuery1.next;
      end;
      CloseFile(F);

      end;
      end;

procedure TForm1.cxButton4Click(Sender: TObject);
begin
Form3.Show;
end;

procedure TForm1.FormCreate(Sender: TObject);
var CS: String;
begin
CS := Format('Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s;Persist Security Info=False', [ExtractFilePath(ParamStr(0)) + 'NotesBase.mdb']);
ADOConnection1.ConnectionString := CS;
ADOTable1.Active;
end;

end.
