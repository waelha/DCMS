<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Doctor.aspx.cs" Inherits="DCMS_V7.Doctor1" %>

<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxSplitter ID="ASPxSplitter2" runat="server" Height="100%" Orientation="Vertical" SaveStateToCookies="True">
        <Panes>
            <dx:SplitterPane>
                <ContentCollection>
<dx:SplitterContentControl runat="server" SupportsDisabledAttribute="True">
    <br />
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="GetPatientInfromation" Width="100%" KeyFieldName="ID">
        <Columns>
            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                <EditButton Visible="True">
                </EditButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="FirstName" ShowInCustomizationForm="True" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LastName" ShowInCustomizationForm="True" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PhoneNumber" ShowInCustomizationForm="True" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmailAddress" ShowInCustomizationForm="True" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Address" ShowInCustomizationForm="True" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="DoB" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Date of Birth">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowTitlePanel="True" />
        <SettingsText Title="Patient Information:" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="GetPatientInfromation" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" SelectCommand="SELECT [FirstName], [LastName], [PhoneNumber], [EmailAddress], [Address], [DoB], [ID] FROM [Patient] WHERE ([ID] = @ID)" DeleteCommand="DELETE FROM [Patient] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Patient] ([FirstName], [LastName], [PhoneNumber], [EmailAddress], [Address], [DoB], [ID]) VALUES (@FirstName, @LastName, @PhoneNumber, @EmailAddress, @Address, @DoB, @ID)" UpdateCommand="UPDATE [Patient] SET [FirstName] = @FirstName, [LastName] = @LastName, [PhoneNumber] = @PhoneNumber, [EmailAddress] = @EmailAddress, [Address] = @Address, [DoB] = @DoB WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="PhoneNumber" Type="String" />
            <asp:Parameter Name="EmailAddress" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter DbType="Date" Name="DoB" />
            <asp:Parameter Name="ID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="ID" SessionField="P_ID" Type="Int32" />
        </SelectParameters>
        
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="PhoneNumber" Type="String" />
            <asp:Parameter Name="EmailAddress" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter DbType="Date" Name="DoB" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        
    </asp:SqlDataSource>
                    </dx:SplitterContentControl>
</ContentCollection>
            </dx:SplitterPane>
            <dx:SplitterPane>
                <ContentCollection>
<dx:SplitterContentControl runat="server" SupportsDisabledAttribute="True">
    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" OnActiveTabChanged="ASPxPageControl1_ActiveTabChanged" RenderMode="Lightweight" Width="100%">
        <TabPages>
            <dx:TabPage Text="Teeth &amp; Treatments">
                <ContentCollection>
                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Select a tooh:" Theme="DevEx">
                        </dx:ASPxLabel>
                        <dx:ASPxGridLookup ID="ASPxGridLookup1" runat="server" AutoGenerateColumns="False" AutoPostBack="True" DataSourceID="GetAllPatientTeeth" KeyFieldName="ID" MultiTextSeparator="," OnTextChanged="ASPxGridLookup1_TextChanged" TextFormatString="{0}" Width="100%">
                            <GridViewProperties EnableCallBacks="False">
                                <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                <Settings ShowFilterRow="True" ShowTitlePanel="True" />
                                <SettingsText Title="Teeth:" />
                            </GridViewProperties>
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="ToothNumber" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Status" ShowInCustomizationForm="True" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Note" ShowInCustomizationForm="True" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:ASPxGridLookup>
                        <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="AllTreatmentsByTooth" KeyFieldName="ID" Width="100%">
                            <Columns>
                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                    <EditButton Visible="True">
                                    </EditButton>
                                    <DeleteButton Visible="True">
                                    </DeleteButton>
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="FirstName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Doctor name">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="KindString" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Treatment Kind">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn FieldName="Date" ShowInCustomizationForm="True" VisibleIndex="4">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataTextColumn FieldName="Note" ShowInCustomizationForm="True" VisibleIndex="5">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" />
                            <Settings ShowGroupPanel="True" ShowTitlePanel="True" />
                            <SettingsText Title="Tooth Treatments:" />
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="AllTreatmentsByTooth" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" DeleteCommand="DELETE FROM [Treatment] WHERE [ID] = @ID" SelectCommand="SELECT [ID], [FirstName], [KindString], [Date], [Note] FROM [GetTreatmentsByToothID] WHERE ([ToothID] = @ToothID) ORDER BY [Date], [KindString]" UpdateCommand="UPDATE [Treatment] SET [Note] = @Note WHERE [ID] = @ID">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="0" Name="ToothID" SessionField="T_ID" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Note" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <dx:LinqServerModeDataSource ID="TreatmentsGetAll" runat="server" ContextTypeName="DCMS_V7.DCMS_DBDataContext" EnableUpdate="True" TableName="Treatments" />
                        <asp:SqlDataSource ID="GetAllPatientTeeth" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" DeleteCommand="DELETE FROM [Tooth] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Tooth] ([ID], [ToothNumber], [Status], [Note]) VALUES (@ID, @ToothNumber, @Status, @Note)" SelectCommand="SELECT [ID], [ToothNumber], [Status], [Note] FROM [Tooth] WHERE ([PatientID] = @PatientID) ORDER BY [ToothNumber]" UpdateCommand="UPDATE [Tooth] SET [ToothNumber] = @ToothNumber, [Status] = @Status, [Note] = @Note WHERE [ID] = @ID">
                            <DeleteParameters>
                                <asp:Parameter Name="ID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="ID" Type="Int32" />
                                <asp:Parameter Name="ToothNumber" Type="Int32" />
                                <asp:Parameter Name="Status" Type="String" />
                                <asp:Parameter Name="Note" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="0" Name="PatientID" SessionField="P_ID" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="ToothNumber" Type="Int32" />
                                <asp:Parameter Name="Status" Type="String" />
                                <asp:Parameter Name="Note" Type="String" />
                                <asp:Parameter Name="ID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Enabled="False" HeaderText="New Treatment:" Width="100%">
                            <PanelCollection>
                                <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" AlignItemCaptionsInAllGroups="True" ColCount="3" Width="100%">
                                        <Items>
                                            <dx:LayoutItem Caption="Choose a Treatment Kind:">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxComboBox ID="ASPxFormLayout1_E3" runat="server" DataSourceID="GetTreatmentKinds" TextField="KindString" ValueField="KindString">
                                                        </dx:ASPxComboBox>
                                                        <asp:SqlDataSource ID="GetTreatmentKinds" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" SelectCommand="SELECT [KindString] FROM [Kind] ORDER BY [ID]"></asp:SqlDataSource>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Pick a day:" RowSpan="2">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxCalendar ID="ASPxFormLayout1_E5" runat="server">
                                                        </dx:ASPxCalendar>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:EmptyLayoutItem>
                                            </dx:EmptyLayoutItem>
                                            <dx:LayoutItem Caption="Enter a Note:">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E4" runat="server" Width="170px">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption=" ">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxButton ID="ASPxFormLayout1_E6" runat="server" OnClick="ASPxFormLayout1_E6_Click" Text="Add Treatment" Width="150px">
                                                        </dx:ASPxButton>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                        <SettingsItemCaptions Location="Top" />
                                    </dx:ASPxFormLayout>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="X-Ray Images">
                <ContentCollection>
                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxImageSlider ID="ASPxImageSlider1" runat="server" BinaryImageCacheFolder="~\Thumb\" DataSourceID="xRaysforPatient" ImageUrlField="ImageURL" NameField="TypeString" TextField="Note" Width="100%">
                        </dx:ASPxImageSlider>
                        <asp:SqlDataSource ID="xRaysforPatient" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" SelectCommand="SELECT [ImageURL], [Note], [Date], [TypeString] FROM [GetXRayForPatient] WHERE (([PatientID] = @PatientID) AND ([ImageURL] IS NOT NULL))">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="0" Name="PatientID" SessionField="P_ID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" HeaderText="Request an X-Ray" Width="100%">
                            <PanelCollection>
                                <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" ColCount="2">
                                        <Items>
                                            <dx:LayoutItem Caption="X-Ray Type">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxComboBox ID="ASPxFormLayout2_E1" runat="server" DataSourceID="XRayTypes" TextField="TypeString" ValueField="TypeString">
                                                        </dx:ASPxComboBox>
                                                        <asp:SqlDataSource ID="XRayTypes" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" SelectCommand="SELECT [TypeString] FROM [ImageTypes]"></asp:SqlDataSource>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption=" " RowSpan="3">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxLabel ID="ASPxFormLayout2_E3" runat="server">
                                                        </dx:ASPxLabel>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Note">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="ASPxFormLayout2_E2" runat="server" Width="170px">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption=" ">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxButton ID="ASPxFormLayout2_E4" runat="server" OnClick="ASPxFormLayout2_E4_Click" Text="Submit Request">
                                                        </dx:ASPxButton>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:ASPxFormLayout>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="Phos.">
                <ContentCollection>
                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" DataSourceID="Pieces" KeyFieldName="ID" Width="100%">
                            <Columns>
                                <dx:GridViewDataDateColumn FieldName="Date" ShowInCustomizationForm="True" VisibleIndex="0">
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataTextColumn FieldName="Note" ShowInCustomizationForm="True" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="TypeString" ShowInCustomizationForm="True" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Status" ShowInCustomizationForm="True" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <Settings UseFixedTableLayout="True" />
                            <SettingsText Title="Patient Picecs" />
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="Pieces" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" SelectCommand="SELECT [Date], [Note], [TypeString], [Status], [ID] FROM [GetPiecesForPatient] WHERE ([PatientID] = @PatientID)">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="0" Name="PatientID" SessionField="P_ID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <dx:ASPxRoundPanel ID="ASPxRoundPanel3" runat="server" HeaderText="Request a Piece" Width="100%">
                            <PanelCollection>
                                <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxFormLayout ID="ASPxFormLayout3" runat="server" ColCount="2">
                                        <Items>
                                            <dx:LayoutItem>
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxComboBox ID="ASPxFormLayout3_E1" runat="server" DataSourceID="piecetypes" TextField="TypeString" ValueField="TypeString">
                                                        </dx:ASPxComboBox>
                                                        <asp:SqlDataSource ID="piecetypes" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" SelectCommand="SELECT [TypeString] FROM [PieceTypes]"></asp:SqlDataSource>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption=" " RowSpan="3">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxLabel ID="ASPxFormLayout3_E2" runat="server" Text=" ">
                                                        </dx:ASPxLabel>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Note">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="ASPxFormLayout3_E3" runat="server" Width="170px">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="  ">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxButton ID="ASPxFormLayout3_E4" runat="server" OnClick="ASPxFormLayout3_E4_Click" Text="Submit Request">
                                                        </dx:ASPxButton>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:ASPxFormLayout>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>
                    </dx:SplitterContentControl>
</ContentCollection>
            </dx:SplitterPane>
        </Panes>
    </dx:ASPxSplitter>
&nbsp;
</asp:Content>