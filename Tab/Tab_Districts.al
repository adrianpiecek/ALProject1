table 50104 Districts
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Area Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Area Code';
        }
        field(2; "Area Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Area Name';
        }
        field(3; "Signed Employee"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Signed Employee';
            TableRelation = Employee."No.";
        }
        field(4; "Signed Vechicle"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Signed Vechicle';
            TableRelation = Resource."No." where(Type = filter(= 'Transport'));
        }
        /*field(5; "Number of Received Packages";)
        {
            FieldClass = FlowField;
            CalcFormula = lookup()
        }*/

    }

    keys
    {
        key(Key1; "Area Code")
        {
            Clustered = true;
        }
        key(Key2; "Signed Employee", "Signed Vechicle")
        {

        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}