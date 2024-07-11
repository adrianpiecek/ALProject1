table 50114 "EIP Transport Order"
{
    LookupPageId = "EIP Transport List";
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
            trigger OnValidate()
            var
                Status: Enum StatusEnum;
            begin
                if ((xRec."Order Status" = Status::"To Receive") and (Rec."Order Status" = Status::"To Deliever")) then begin
                    rec.TestField("Distance from Pickup Point");
                    rec.TestField(Buyer);
                    rec.TestField("Pickup Point Name");
                end;

            end;
        }
        field(4; Buyer; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(5; "Pickup Point Name"; Text[50])//district name
        {
            DataClassification = ToBeClassified;
            Caption = 'Pickup Point Name';
            TableRelation="EIP District"."Area Name";
            
        }
        field(6; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(7; "Alt. Pickup Point Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Alt. Pickup Point Name';
        }
        field(8; "Pickup Point Postal Code"; Text[6])
        {
            DataClassification = ToBeClassified;
            Caption = 'Pickup Point Postal Code';
        }
        field(9; "Employee receiving the Order"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Employee receiving the Order';
        }
        field(10; "Vechicle Transporting Order"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Vechicle Transporting Order';
        }
        field(11; "Date and Time of Pickup"; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date and Time of Pickup';
        }
        field(12; "Distance from Pickup Point"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Distance from Pickup Point';
        }
        field(13; "Delivery Point Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Delivery Point Name';
        }
        field(14; "Alt. Delivery Point Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Alt. Delivery Point Name';
        }
        field(15; "Delivery Point Adress"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Alt. Delivery Point Adress"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Delivery Point Postal Code"; text[6])
        {
            DataClassification = ToBeClassified;
            Caption = 'Delivery Point Postal Code';
        }
        field(18; "Delivering Employee"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Delivering Employee';
        }
        field(19; "Delivering Vechicle"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Delivering Vechicle';
        }
        field(20; "Delivery Date and Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'Delivery Date and Time';
        }
        field(21; "Distance from Delivery Point"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Distance from Delivery Point';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(key2;"Order Date and Time"){
            Clustered=false;
        }
    }

    var
        SRSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Transfer: Codeunit "EIP Record Transfer";

    trigger OnInsert()
    begin
        rec."Order Date and Time" := CurrentDateTime;


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
        Transfer.RealiseOrder(Rec);
    end;

    trigger OnRename()
    begin

    end;


}
