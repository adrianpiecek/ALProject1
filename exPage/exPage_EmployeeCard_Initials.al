pageextension 50103 EmployeeCardInitials extends "Employee Card"
{

    layout
    {
        // Add changes to page layout here
        modify("First Name")
        {
            trigger OnAfterValidate()
            var
                FirstLetter: Text;
            begin
                FirstLetter := Rec."First Name".Substring(1, 1);
                Message('%1', FirstLetter);
                //InitialsArray[1]:=
            end;
        }
        /*modify("No.")
        {
            
        }*/
    }

    actions
    {
        // Add changes to page actions here

    }

    trigger OnClosePage()
    var
        myInt: Integer;
    begin
        for myInt := 1 to ArrayLen(InitialsArray) do begin
            InitialsArray[myInt] := '';
        end;
        InitialsArray[1] := Rec."First Name"/*.Substring(1, 1)*/;
        InitialsArray[2] := Rec."Last Name"/*.Substring(1, 1)*/;
        Message('%1', InitialsArray[1] + InitialsArray[2]);
        Message('page closed');
        //Rename(Employee."No.", InitialsArray[1] + InitialsArray[2]);
    end;

    var
        InitialsArray: array[2] of Text;
}