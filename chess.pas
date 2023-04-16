program Chess;

{$mode objfpc}

uses
    board in '.\units\board.pas',
    piece in '.\units\piece.pas',
    tile in '.\units\tile.pas';

var

    MainBoard : TBoard;

begin

    MainBoard := TBoard.Create;

    MainBoard.ResetBoard;
    MainBoard.DrawBoard;

end.