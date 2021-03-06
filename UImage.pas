  ///////////////////////////////////////////////////////////
 //  Autor: Ricardo de Assis                              //
//   https://github.com/Flexnetsistemas/image-compare    //
/////////////////////////////////////////////////////////

unit UImage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormPrincipal = class(TForm)
    btnCompare: TButton;
    lbTotal: TLabel;
    LbPercentual: TLabel;
    EdtImage1: TEdit;
    EdtImage2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    Image1: TImage;
    Image2: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Button4: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Button5: TButton;
    procedure btnCompareClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
  function CompImagens(img1, img2: TBitmap): boolean;
  function BitmapToRegion(bmp: TBitmap) : dword;
  procedure ClearResult;

    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

procedure TFormPrincipal.ClearResult;
begin
  lbTotal.caption      := '';
  lbPercentual.caption :='';
end;



procedure TFormPrincipal.Button2Click(Sender: TObject);
begin
if OpenDialog1.Execute then
 begin
  EdtImage1.Text := OpenDialog1.FileName;
  Image1.Picture.LoadFromFile(EdtImage1.Text);

 end;

 end;

procedure TFormPrincipal.Button3Click(Sender: TObject);
begin
if OpenDialog1.Execute then
 begin
 EdtImage2.Text := OpenDialog1.FileName;
 Image2.Picture.LoadFromFile(EdtImage2.Text);
 ClearResult
 end;

end;


function TFormPrincipal.BitmapToRegion(bmp: TBitmap) : dword;
var ix,iy : integer; // loop nas vari�veis
tc : TColor; // transparentColor
b1 : boolean; // est� olhando o "real" pixels (no transparent pixels)
c1 : cardinal; // ajusta a vari�vel na regi�o
i1 : integer; // primeira posi��o real em pixel
begin
  Result := 0;
  i1 := 0;
  // mem�ria do transparent color
  tc := bmp.transparentColor and $FFFFFF;
  with bmp.canvas do
  // enquadrilhe por todas as linhas
  for iy := 0 to bmp.height - 1 do
  begin
    b1 := False;
    // esquadrinhe por todo o pixels nesta linha
    for ix:=0 to bmp.Width - 1 do
    // feito n�s acharmos o come�o/final seguidos em pixel
    if (pixels[ix, iy] and $FFFFFF <> tc) <> b1 then begin
      // sim, e foi o �ltimo pixel,
      // so n�s podemos somar uma regi�o de estilo de linha. . .
      if b1 then begin
        c1:=CreateRectRgn(i1,iy,ix,iy+1);
        if result<>0 then
        begin
          // Esta n�o � a primeira regi�o
          CombineRgn(Result, Result, c1, RGN_OR);
          DeleteObject(c1);
          // Esta � a primeira regi�o
        end
        else
        Result := c1;
      end else i1 := ix;
      // mude o modo e procura o primeiro ou �ltimo pixel?
      b1:=not b1;
    end;
    // o �ltimo pixel nesta fila era um pixel real?
    if b1 then begin
      c1:=CreateRectRgn(i1, iy, bmp.width-1, iy+1);
      if (Result <> 0) then
      begin
        CombineRgn(Result, Result, c1, RGN_OR);
        DeleteObject(c1);
      end
      else
      Result := c1;
    end;
  end;
end;

procedure TFormPrincipal.Button4Click(Sender: TObject);
var
  img1Rgn: DWord;
  x, y, tX, tY:Integer;
  bDentro: Boolean;
begin
  ClearResult;
  bDentro := False;
  img1Rgn := BitmapToRegion(image1.Picture.Bitmap);
  for X := 0 to image2.Picture.Width -1 do
    for y := 0 to image2.Picture.Height -1 do
    begin
      tX := image2.ClientOrigin.X + X;
      tY := image2.ClientOrigin.y + Y;
      bDentro := bDentro or PtInRegion(img1Rgn, tX, tY);
    end;

    if bDentro then
     ShowMessage('Found image!')
    else
     ShowMessage('Image not found or different!') ;


end;

procedure TFormPrincipal.Button5Click(Sender: TObject);
var
i, j : integer;
Dif  : Integer;
Igual : Integer;
Percent : Double;
image1: TBitmap;
begin

  ClearResult;
  image1 := TBitmap.Create;
 // image2 := TBitmap.Create;

  image1.LoadFromFile(EdtImage1.Text);
 // Image2.Canvas.Arc(5,5,10,10,5,5,5,5);

 Image2.Canvas.Arc(1,1,1,1,1,1,1,1);

 for i := 0 to image1.Height-1 do
  begin
   for j := 0 to image1.Width-1 do
    if (image1.Canvas.Pixels[j,i] <> clBlack) then
     image2.Canvas.Pixels[j,i] := image1.Canvas.Pixels[j,i];

  end;
end;

function TFormPrincipal.CompImagens(img1, img2: TBitmap): boolean;
var
i, j : integer;
Dif  : Integer;
Igual : Integer;
Percent : Double;
begin
 {
  if (img1.Width <> img2.Width) or (img1.Height <> img2.Height) then
   begin
    Result := False;
    Exit;
  end;
  }
  Result := True;
  Dif := 1; Igual := 1;


  for i := 0 to img1.Height-1 do
  begin
   for j := 0 to img1.Width-1 do
    if (img1.Canvas.Pixels[j,i] <> img2.Canvas.Pixels[j,i])
      and (img1.Canvas.Pixels[j,i] <> clWhite) then
       inc(Dif)
    else
    if (img1.Canvas.Pixels[j,i] <> clWhite)  then
       inc(Igual);
  end;


  if (Igual - Dif) < 0  then
   begin
    Result := False;
    Exit;
   end;

   Percent :=  (Dif/Igual) * 100;

   lbPercentual.Caption := 'Percent Similarly  = '+FormatFloat('##0.00',100-Percent) + '%';

   LbTotal.Caption :=  'Total equal = ' + IntToStr(Igual)+' / Different Pixel = '+IntToStr(Dif);


         //Result := False;
    //  Result := Abs(img1 - img2) > 20;
     // Break;

end;

procedure TFormPrincipal.btnCompareClick(Sender: TObject);
Var
image1, image2: TBitmap;
begin
 ClearResult;
 image1 := TBitmap.Create;
 image2 := TBitmap.Create;

 image1.LoadFromFile(EdtImage1.Text);
 image2.LoadFromFile(EdtImage2.Text);

 if CompImagens( Image1 , image2 ) then
 Showmessage('Similarly images')
 else
 Showmessage('Images are different');

 FreeAndnil(image1);
 FreeAndnil(image2);

end;

end.
