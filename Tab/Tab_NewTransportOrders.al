table 50114 NewTransportOrders
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Order's Number"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Order Date and Time"; DateTime)
        {

        }
    }

    keys
    {
        key(Key1; "Order's Number")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        rec."Order Date and Time" := CurrentDateTime;
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