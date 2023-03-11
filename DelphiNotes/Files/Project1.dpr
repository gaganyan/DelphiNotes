program Project1;

uses
  Vcl.Forms,
  Notes in 'Notes.pas' {Form1},
  NewNotes in 'NewNotes.pas' {Form2},
  UpdateNote in 'UpdateNote.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
