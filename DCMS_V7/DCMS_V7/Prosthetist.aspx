<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Prosthetist.aspx.cs" Inherits="DCMS_V7.Prosthetist" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="GetAllRequests" KeyFieldName="ID" OnSelectionChanged="ASPxGridView1_SelectionChanged" Width="100%">
    <Columns>
        <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="5">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="3">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn FieldName="Note" VisibleIndex="4">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Type" FieldName="TypeString" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
    </Columns>
    <Settings ShowTitlePanel="True" />
    <SettingsText Title="Doctor Requests" />
</dx:ASPxGridView>
<asp:SqlDataSource ID="GetAllRequests" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" SelectCommand="SELECT [ID], [Date], [Note], [TypeString], [Status] FROM [GetPiecesForPatient] WHERE ([PatientID] = @PatientID) ORDER BY [Status]">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="0" Name="PatientID" SessionField="P_ID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Change Status" Width="100%">
    <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server">
        <Items>
            <dx:LayoutItem Caption="Status">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxComboBox ID="ASPxFormLayout1_E1" runat="server">
                            <Items>
                                <dx:ListEditItem Text="Pending" Value="Pending" />
                                <dx:ListEditItem Text="Done" Value="Done" />
                            </Items>
                        </dx:ASPxComboBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption=" ">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxButton ID="ASPxFormLayout1_E2" runat="server" OnClick="ASPxFormLayout1_E2_Click" Text="Update">
                        </dx:ASPxButton>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
    </dx:ASPxFormLayout>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>
    
</asp:Content>