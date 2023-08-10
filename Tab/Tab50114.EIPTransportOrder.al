table 50114 "EIP Transport Order"
{
    LookupPageId = 50119;
    DataClassification = ToBeClassified;
    Caption = 'New Transport Orders';
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Order No.';
            DataClassification = ToBeClassified;

        }
        field(2; "Order Date and Time"; DateTime)
        {
            Caption = 'Order Date and Time';
        }
        field(3; "Order Status"; Enum StatusEnum)
        {
            Caption = 'Order Status';
            DataClassification = ToBeClassified;
        }
        field(4; Buyer; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(5; "Collection Point Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Collection Point Name';
        }
        field(6; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    var
        SRSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        rec."Order Date and Time" := CurrentDateTime;
        rec.TestField(Buyer);
        rec.TestField("Collection Point Name");



        SRSetup.Get();

        if "No." = '' then begin
            SRSetup.TestField("Transport Order Nos.");
            rec."No. Series" := SRSetup."Transport Order Nos.";
            NoSeriesMgt.InitSeries(SRSetup."Transport Order Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;

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
