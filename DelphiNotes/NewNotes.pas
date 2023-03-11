unit NewNotes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxTextEdit, Vcl.Menus,
  dxLayoutControlAdapters, dxLayoutcxEditAdapters, dxLayoutContainer, cxClasses,
  dxLayoutControl, Vcl.StdCtrls, cxButtons, cxMemo, cxRichEdit;

type
  TForm2 = class(TForm)
    cxTextEdit1: TcxTextEdit;
    cxButton1: TcxButton;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Notes;

procedure TForm2.cxButton1Click(Sender: TObject);
var StringNotes, QueryString:string;
begin
if(cxTextEdit1.Text='') then
begin
   ShowMessage('Заполните Поля!');
end else
begin
   StringNotes:=StringReplace(cxTextEdit1.Text, ',', '.', [rfReplaceAll, rfIgnoreCase]);
   QueryString:= ('INSERT INTO Notes VALUES ('''+ StringNotes +''')');
   Form1.ADOQuery1.Close;
   Form1.ADOQuery1.SQL.Clear;
   Form1.ADOQuery1.SQL.Add(QueryString);
   Form1.ADOQuery1.ExecSQL;
   Form1.ADOTable1.Active:= False;
   Form1.ADOTable1.Active:= True;
   ShowMessage('Заметка успешно оформлена!');
end;
Form2.Close;
end;

end.
