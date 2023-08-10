tableextension 50116 OrderNo extends "Sales & Receivables Setup"
{

    fields
    {
        field(50118; "Transport Order Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Transport Order Nos.';
            TableRelation = "No. Series";
        }
    }

}