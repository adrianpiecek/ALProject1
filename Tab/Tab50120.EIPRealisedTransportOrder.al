table 50120 "EIP Realised Transport Order"
{
    DataClassification = ToBeClassified;
    Caption = 'EIP Realised Transport Order';
    LookupPageId = 50122;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = "EIP Transport Order"."No.";
            DataClassification = ToBeClassified;

        }
        field(4; Buyer; Code[50])
        {
            Caption = 'Buyer';
            //DataClassification = ToBeClassified;
            //TableRelation = "EIP Transport Order".Buyer;
            //FieldClass = FlowField;
            //CalcFormula = lookup("EIP Transport Order".Buyer);

        }
        field(5; "No. Series"; Code[20])
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
        myInt: Integer;
        Transfer: Codeunit "EIP Record Transfer";
        SRSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        //Transfer.RealiseOrder(Rec);
        SRSetup.Get();

        if "No." = '' then begin
            SRSetup.TestField("Realised Order Nos.");
            rec."No. Series" := SRSetup."Realised Order Nos.";
            NoSeriesMgt.InitSeries(SRSetup."Realised Order Nos.", xRec."No. Series", 0D, "No.", "No. Series");
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