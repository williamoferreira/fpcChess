unit piece;

{$mode objfpc}

interface

type
    EPieceColor = (White, Black);

    EPieceType = (Pawn, Rook, Knight, Bishop, Queen, King);

    TPiece = class(TObject)    
    private
        PColor : EPieceColor;
        PType : EPieceType;
    public
        constructor Create(const AColor: EPieceColor; const AType: EPieceType);
        constructor CreateWhite(const AType: EPieceType);
        constructor CreateBlack(const AType: EPieceType);
        function GetType: EPieceType;
        function GetColor: EPieceColor;
        function TextOut : String;
    end;

implementation

uses
    crt;

    constructor TPiece.Create(const AColor: EPieceColor; const AType: EPieceType);
    begin
        Self.PColor := AColor;
        Self.PType := AType;
    end;

    constructor TPiece.CreateWhite(const AType : EPieceType);
    begin
        Self.PColor := White;
        Self.PType := AType;
    end;

    constructor TPiece.CreateBlack(const AType : EPieceType);
    begin
        Self.PColor := Black;
        Self.PType := AType;
    end;

    function TPiece.GetType: EPieceType;
    begin
        result := Self.PType;
    end;

    function TPiece.GetColor: EPieceColor;
    begin
        result := Self.PColor;
    end;

    function TPiece.TextOut() : String;
    begin

        if self.PColor = EPieceColor.White then
            TextColor(7)
        else
            TextColor(0);

        case Self.PType of 
            EPieceType.Pawn: Write('P');
            EPieceType.Rook: Write('R');
            EPieceType.Knight: Write('K');
            EPieceType.Bishop: Write('B');
            EPieceType.Queen: Write('Q');
            EPieceType.King: Write('M');
        end;
        
        //write(PType);

        result := '?';
    end;
end.
