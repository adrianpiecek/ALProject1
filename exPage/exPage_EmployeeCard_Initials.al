pageextension 50103 EmployeeCardInitials extends "Employee Card"
{

    layout
    {
        // Add changes to page layout here
        modify("First Name")
        {
            trigger OnAfterValidate()
            var
            //FirstLetter: Text;
            begin
                FirstLetterOfName := UpperCase(Rec."First Name".Substring(1, 1));
                Message('%1', FirstLetterOfName);

                //InitialsArray[1]:=
            end;
        }
        modify("Last Name")
        {
            trigger OnAfterValidate()
            var

            begin
                FirstLetterOfLastName := UpperCase(Rec."Last Name".Substring(1, 1));
                Message('%1', FirstLetterOfLastName);
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

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var

    begin
        if (rec."First Name" = '') or (rec."Last Name" = '') then begin
            Message('First Name and Last Name must be filled');
            exit(false);
        end;
    end;

    trigger OnClosePage()
    var
        myInt: Integer;
    begin
        /*for myInt := 1 to ArrayLen(InitialsArray) do begin
            InitialsArray[myInt] := '';
        end;*/
        //InitialsArray[1] := Rec."First Name"/*.Substring(1, 1)*/;
        //InitialsArray[2] := Rec."Last Name"/*.Substring(1, 1)*/;
        if not Rec.FindLast() then begin
            Rec.Rename(FirstLetterOfName + FirstLetterOfLastName + '1');// rec."No." := FirstLetterOfName + FirstLetterOfLastName + '1';
        end else begin

        end;
        Message('%1', FirstLetterOfName + FirstLetterOfLastName);
        Message('page closed');
        //Rename(Employee."No.", InitialsArray[1] + InitialsArray[2]);
    end;

    var
        InitialsArray: array[2] of Text;
        FirstLetterOfName: Text;
        FirstLetterOfLastName: Text;
        Employee: Record Employee;
}