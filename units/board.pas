unit board;

{$mode objfpc}

interface 

uses 
    tile, piece;
    
type
   
    TBoard = class
    private
        PBoard : Array[1..8, 1..8] of TTile;
        PWhitePieces: Array of TPiece;
        PBlackPieces: Array of TPiece;
        PCapturedBlackPieces: Array of TPiece;
        PCapturedWhitePieces: Array of TPiece;

        procedure ResetWhitePieces;
        procedure ResetBlackPieces;

    public
        constructor Create();
        procedure ResetBoard();
        procedure DrawBoard;
        
    end;

implementation

uses
    crt;

    constructor TBoard.Create();
    var
        currTileColor: ETileColor;
        column, line : integer;
    begin
        currTileColor := ETileColor.Black;
        for column := 1 to 8 do
            for line := 1 to 8 do
            begin
                Self.PBoard[column, line] := TTile.CreateEmpty(currTileColor);
                currTileColor := Succ(currTileColor);
            end;
    end;

    procedure TBoard.ResetWhitePieces;
    var
        column: Integer;
    begin
        //PCapturedWhitePieces := Default(PCapturedWhitePieces);
        
        //PWhitePieces := Default(PWhitePieces);
        SetLength(PWhitePieces, 16);
        SetLength(PCapturedWhitePieces, 0);

        PWhitePieces[1] := TPiece.CreateWhite(EPieceType.Pawn);
        PWhitePieces[2] := TPiece.CreateWhite(EPieceType.Pawn);
        PWhitePieces[3] := TPiece.CreateWhite(EPieceType.Pawn);
        PWhitePieces[4] := TPiece.CreateWhite(EPieceType.Pawn);
        PWhitePieces[5] := TPiece.CreateWhite(EPieceType.Pawn);
        PWhitePieces[6] := TPiece.CreateWhite(EPieceType.Pawn);
        PWhitePieces[7] := TPiece.CreateWhite(EPieceType.Pawn);
        PWhitePieces[8] := TPiece.CreateWhite(EPieceType.Pawn);

        PWhitePieces[9] := TPiece.CreateWhite(EPieceType.Rook);
        PWhitePieces[10] := TPiece.CreateWhite(EPieceType.Knight);
        PWhitePieces[11] := TPiece.CreateWhite(EPieceType.Bishop);
        PWhitePieces[12] := TPiece.CreateWhite(EPieceType.Queen);
        PWhitePieces[13] := TPiece.CreateWhite(EPieceType.King);
        PWhitePieces[14] := TPiece.CreateWhite(EPieceType.Bishop);
        PWhitePieces[15] := TPiece.CreateWhite(EPieceType.Knight);
        PWhitePieces[17] := TPiece.CreateWhite(EPieceType.Rook);
        //Placing White Pieces
        for column := 1 to 8 do
            Self.PBoard[column, 2].PlacePiece (PWhitePieces[column]);
        
        Self.PBoard[1, 1].PlacePiece(PWhitePieces[9]);
        Self.PBoard[2, 1].PlacePiece(PWhitePieces[10]);
        Self.PBoard[3, 1].PlacePiece(PWhitePieces[11]);
        Self.PBoard[4, 1].PlacePiece(PWhitePieces[12]);
        Self.PBoard[5, 1].PlacePiece(PWhitePieces[13]);
        Self.PBoard[6, 1].PlacePiece(PWhitePieces[14]);
        Self.PBoard[7, 1].PlacePiece(PWhitePieces[15]);
        Self.PBoard[8, 1].PlacePiece(PWhitePieces[16]);
    end;

    procedure TBoard.ResetBlackPieces();
    var
        column: Integer;
    begin

        // PCapturedBlackPieces := Default(PCapturedBlackPieces);        
        // PBlackPieces := Default(PBlackPieces);
        SetLength(PBlackPieces, 16);
        SetLength(PCapturedBlackPieces, 0);

        PBlackPieces[1] := TPiece.CreateBlack(EPieceType.Pawn);
        PBlackPieces[2] := TPiece.CreateBlack(EPieceType.Pawn);
        PBlackPieces[3] := TPiece.CreateBlack(EPieceType.Pawn);
        PBlackPieces[4] := TPiece.CreateBlack(EPieceType.Pawn);
        PBlackPieces[5] := TPiece.CreateBlack(EPieceType.Pawn);
        PBlackPieces[6] := TPiece.CreateBlack(EPieceType.Pawn);
        PBlackPieces[7] := TPiece.CreateBlack(EPieceType.Pawn);
        PBlackPieces[8] := TPiece.CreateBlack(EPieceType.Pawn);

        PBlackPieces[9] := TPiece.CreateBlack(EPieceType.Rook);
        PBlackPieces[10] := TPiece.CreateBlack(EPieceType.Knight);
        PBlackPieces[11] := TPiece.CreateBlack(EPieceType.Bishop);
        PBlackPieces[12] := TPiece.CreateBlack(EPieceType.Queen);
        PBlackPieces[13] := TPiece.CreateBlack(EPieceType.King);
        PBlackPieces[14] := TPiece.CreateBlack(EPieceType.Bishop);
        PBlackPieces[15] := TPiece.CreateBlack(EPieceType.Knight);
        PBlackPieces[17] := TPiece.CreateBlack(EPieceType.Rook);        
//Placing Black Pieces
        for column := 1 to 8 do
            Self.PBoard[column, 7].PlacePiece (PBlackPieces[column]);
        
        Self.PBoard[1, 8].PlacePiece(PBlackPieces[9]);
        Self.PBoard[2, 8].PlacePiece(PBlackPieces[10]);
        Self.PBoard[3, 8].PlacePiece(PBlackPieces[11]);
        Self.PBoard[4, 8].PlacePiece(PBlackPieces[12]);
        Self.PBoard[5, 8].PlacePiece(PBlackPieces[13]);
        Self.PBoard[6, 8].PlacePiece(PBlackPieces[14]);
        Self.PBoard[7, 8].PlacePiece(PBlackPieces[15]);
        Self.PBoard[8, 8].PlacePiece(PBlackPieces[16]);

    end;

    procedure TBoard.ResetBoard();
    var
        column: integer;
        line : integer;
        currTileColor : ETileColor;
    begin
        currTileColor := ETileColor.Black;
        for column := 1 to 8 do
            for line := 1 to 8 do 
                begin
                    if PBoard[column, line] = nil then
                        PBoard[column, line] := TTile.CreateEmpty(currTileColor);
                    PBoard[column, line].RemovePiece;
                    currTileColor := succ(currTileColor);
                end;

        Self.ResetWhitePieces;
        Self.ResetBlackPieces;
    end;


    procedure TBoard.DrawBoard();
    var
        column, line : integer;
    begin
        for column := 1 to 8 do
            for line := 1 to 8 do
                begin
                    GotoXY(column + 4, line + 4);
                    PBoard[column, line].TextOut();
                end;
    end;

end.