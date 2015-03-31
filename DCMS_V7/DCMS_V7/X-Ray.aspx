<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="X-Ray.aspx.cs" Inherits="DCMS_V7.X_Ray" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Doctor requests, Select a request and upload an image" Width="100%">
        <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
    <dx:ASPxGridLookup ID="ASPxGridLookup2" runat="server" AutoGenerateColumns="False" AutoPostBack="True" DataSourceID="NullXrays" KeyFieldName="ID" MultiTextSeparator="," OnTextChanged="ASPxGridLookup2_TextChanged" TextFormatString="{0}" Width="100%">
        <GridViewProperties EnableCallBacks="False">
            <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
        </GridViewProperties>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TypeString" ShowInCustomizationForm="True" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Date" ShowInCustomizationForm="True" VisibleIndex="3">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Note" ShowInCustomizationForm="True" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridLookup>
    <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" ShowProgressPanel="True" ShowUploadButton="True" UploadMode="Auto" Width="280px">
    </dx:ASPxUploadControl>
            </dx:PanelContent>
</PanelCollection>
    </dx:ASPxRoundPanel>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="Xrays" KeyFieldName="ID" OnSelectionChanged="ASPxGridView1_SelectionChanged" Width="100%">
    <Columns>
        <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="TypeString" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="2">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn FieldName="Note" VisibleIndex="3">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataImageColumn FieldName="ImageURL" VisibleIndex="4">
            <PropertiesImage ImageHeight="500px">
            </PropertiesImage>
        </dx:GridViewDataImageColumn>
    </Columns>
        <Settings ShowTitlePanel="True" />
        <SettingsText Title="Recent X-Rays For this Patient" />
</dx:ASPxGridView>
    <asp:SqlDataSource ID="NullXrays" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" SelectCommand="SELECT [ID], [ImageURL], [TypeString], [Date], [Note] FROM [GetXRayForPatient] WHERE (([PatientID] = @PatientID) AND ([ImageURL] IS NULL))">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="PatientID" SessionField="P_ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
<asp:SqlDataSource ID="Xrays" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" SelectCommand="SELECT [ID], [TypeString], [Date], [Note], [ImageURL] FROM [GetXRayForPatient] WHERE (([PatientID] = @PatientID) AND ([ImageURL] IS NOT NULL))">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="1" Name="PatientID" SessionField="P_ID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="Images" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" SelectCommand="SELECT [ImageURL], [TypeString], [Date], [Note] FROM [GetXRayForPatient] WHERE (([PatientID] = @PatientID) AND ([ImageURL] IS NOT NULL))">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="1" Name="PatientID" SessionField="P_ID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>