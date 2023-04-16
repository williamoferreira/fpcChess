unit tile;

{$mode objfpc}

interface

uses
    piece;

Type

    ETileColor = (White, Black);

    TTile = class
    private 
        PPiece : TPiece;
        PColor: ETileColor;
    public
        function HasPiece() : Boolean;
        function PlacePiece(const APiece : TPiece): Boolean;
        function GetPiece() : TPiece;
        function RemovePiece(): Boolean;
        constructor CreateEmpty(const AColor : ETileColor);
        constructor CreateWithPiece(const AColor: ETileColor; const APiece : TPiece);
        function TextOut() : String;
    end;

implementation

uses
    crt;

    function TTile.HasPiece: Boolean;
    begin
        result := self.PPiece <> nil;
    end;

    function TTile.PlacePiece(const APiece : TPiece) : Boolean;
    begin
        result := true;
        if self.PPiece = nil then
            self.PPiece := APiece
        else
            result := false;
    end;

    function TTile.GetPiece: TPiece;
    begin
        result := self.PPiece;
    end;

    function TTile.RemovePiece(): Boolean;
    begin
        //Created as function 'cos i was not sure if could check if it was really removed
        Self.PPiece.Destroy;
        result := True;
    end;

    constructor TTile.CreateEmpty(const AColor : ETileColor);
    begin
        Self.PColor := AColor;
    end;

    constructor TTile.CreateWithPiece(const AColor: ETileColor; const APiece : TPiece);
    begin
        Self.PPiece := APiece;
        Self.PColor := AColor;
    end;

    function TTile.TextOut(): String;
    begin
        if Self.PColor = ETileColor.White then
            TextBackground(7)
        else
            TextBackground(0); 

        if Self.PPiece = nil then
            write(' ')
        else
            Self.PPiece.TextOut();
        result := '?';
    end;


end.