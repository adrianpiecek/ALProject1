pageextension 50103 EmployeeCardInitials extends "Employee Card"
{
    layout
    {
        // Add changes to page layout here
        modify("First Name")
        {
            trigger OnAfterValidate()
            var

            begin
                if not (xRec."First Name" = Rec."First Name") then begin
                    if Dialog.Confirm('Name has changed. Do you want to update No.?') then begin
                        if rec."First Name" <> '' then begin
                            FirstLetterOfName := UpperCase(Rec."First Name".Substring(1, 1));
                        end;
                    end;
                end else begin
                    FirstLetterOfName := UpperCase(Rec."First Name".Substring(1, 1));
                end;
            end;
        }
        modify("Last Name")
        {
            trigger OnAfterValidate()
            var

            begin
                if not (xRec."Last Name" = Rec."Last Name") then begin
                    if Confirm('Name has changed. Do you want to update No.?') then begin
                        if rec."Last Name" <> '' then begin
                            FirstLetterOfLastName := UpperCase(Rec."Last Name".Substring(1, 1));
                        end;
                    end;
                end else begin
                    FirstLetterOfLastName := UpperCase(Rec."Last Name".Substring(1, 1));
                end;
            end;
        }

    }

    actions
    {
        // Add changes to page actions here

    }


    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        Employee: Record Employee;
    begin

        if (rec."First Name" = '') or (rec."Last Name" = '') then begin
            Message('First Name and Last Name must be filled');
            exit(false);
        end else begin
            Employee.SetFilter("No.", FirstLetterOfName + FirstLetterOfLastName + '*');
            if Employee.FindLast() then begin
                rec.Rename(IncStr(Employee."No."));
            end else begin
                rec.Rename(FirstLetterOfName + FirstLetterOfLastName + '1');
            end;
        end;
    end;


    var
        FirstLetterOfName: Text;
        FirstLetterOfLastName: Text;

}