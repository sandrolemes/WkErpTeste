unit utilitarios;

interface

uses
  Vcl.Forms,
  Vcl.StdCtrls,
  Vcl.Dialogs,
  WinApi.Messages,
  System.SysUtils;

  procedure EnterKeyPress(Sender: TObject; var Key: Char; form: TForm);
  procedure ValorKeyPress(Sender: TObject; var Key: Char; pQtdDecimais: Integer);
  procedure FormatarDecimaisExit(pEdit: TEdit; pQtdDecimais: Integer);


implementation


procedure EnterKeyPress(Sender: TObject; var Key: Char; form: TForm);
begin
  if Key = #13 then
  begin
    Form.Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure ValorKeyPress(Sender: TObject; var Key: Char; pQtdDecimais: Integer);
var
  memKey: char;
  sTextoAtual: string;
begin
  try
    memKey := Key;
    sTextoAtual := TEdit(Sender).Text;
    // Permitir apenas números, ponto decimal e Backspace
    if not (Key in ['0'..'9', ',', #8]) then
    begin
      Key := #0;
      Exit;
    end;

    // Permitir apenas um ponto decimal
    if (Key = ',') and (Pos(',', sTextoAtual) > 0) then
    begin
      Key := #0;
      Exit;
    end;

    // Limitar a quantidade de decimais ao informado em pQtdDecimais
    if (Pos(',', sTextoAtual) > 0) and (Length(sTextoAtual) - Pos(',', sTextoAtual) >= pQtdDecimais) then
    begin
      if (Key in ['0'..'9']) then
        Key := #0;
    end;
  finally
    Key := memKey;
  end;
end;

procedure FormatarDecimaisExit(pEdit: TEdit; pQtdDecimais: Integer);
var
  dValor: Double;
begin
  if TryStrToFloat(pEdit.Text, dValor) then
  begin
    pEdit.Text := FormatFloat('0.' + StringOfChar('0', pQtdDecimais), dValor);
  end
  else
  begin
    pEdit.Text := '0,00';
  end;
end;

end.
