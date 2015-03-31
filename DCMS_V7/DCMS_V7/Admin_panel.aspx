<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Admin_panel.aspx.cs" Inherits="DCMS_V7.Admin_panel" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="2" RenderMode="Lightweight" Width="100%">
    <TabPages>
        <dx:TabPage Text="Modify/Delete SystemUser">
            <ContentCollection>
                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="GetAllSysUsers" KeyFieldName="ID" Width="100%">
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                <EditButton Visible="True">
                                </EditButton>
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="UserName" ShowInCustomizationForm="True" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Password" ShowInCustomizationForm="True" VisibleIndex="3">
                                <PropertiesTextEdit Password="True">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PhoneNumber" ShowInCustomizationForm="True" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="EmailAddress" ShowInCustomizationForm="True" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Address" ShowInCustomizationForm="True" VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataCheckColumn FieldName="Admin" ShowInCustomizationForm="True" VisibleIndex="7">
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn FieldName="Ban" ShowInCustomizationForm="True" VisibleIndex="8">
                            </dx:GridViewDataCheckColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Settings ShowFilterRow="True" ShowTitlePanel="True" />
                        <SettingsText Title="Login Information" />
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="GetAllSysUsers" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" DeleteCommand="DELETE FROM [SysUser] WHERE [ID] = @ID" InsertCommand="INSERT INTO [SysUser] ([ID], [UserName], [Password], [PhoneNumber], [EmailAddress], [Address], [Admin], [Ban]) VALUES (@ID, @UserName, @Password, @PhoneNumber, @EmailAddress, @Address, @Admin, @Ban)" SelectCommand="SELECT [ID], [UserName], [Password], [PhoneNumber], [EmailAddress], [Address], [Admin], [Ban] FROM [SysUser] ORDER BY [UserName], [Admin] DESC, [Ban] DESC" UpdateCommand="UPDATE [SysUser] SET [UserName] = @UserName, [Password] = @Password, [PhoneNumber] = @PhoneNumber, [EmailAddress] = @EmailAddress, [Address] = @Address, [Admin] = @Admin, [Ban] = @Ban WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                            <asp:Parameter Name="UserName" Type="String" />
                            <asp:Parameter Name="Password" Type="String" />
                            <asp:Parameter Name="PhoneNumber" Type="String" />
                            <asp:Parameter Name="EmailAddress" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="Admin" Type="Boolean" />
                            <asp:Parameter Name="Ban" Type="Boolean" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="UserName" Type="String" />
                            <asp:Parameter Name="Password" Type="String" />
                            <asp:Parameter Name="PhoneNumber" Type="String" />
                            <asp:Parameter Name="EmailAddress" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="Admin" Type="Boolean" />
                            <asp:Parameter Name="Ban" Type="Boolean" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="Delete Selected User" Width="197px">
                    </dx:ASPxButton>
                    <br />
                    <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="GetAllDoctors" KeyFieldName="ID" Width="100%">
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                <EditButton Visible="True">
                                </EditButton>
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="FirstName" ShowInCustomizationForm="True" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="LastName" ShowInCustomizationForm="True" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn Caption="Date of Birth" FieldName="DoB" ShowInCustomizationForm="True" VisibleIndex="4">
                            </dx:GridViewDataDateColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Settings ShowFilterRow="True" ShowTitlePanel="True" />
                        <SettingsText Title="Doctors' Information" />
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="GetAllDoctors" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" DeleteCommand="DELETE FROM [Doctor] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Doctor] ([ID], [FirstName], [LastName], [DoB]) VALUES (@ID, @FirstName, @LastName, @DoB)" SelectCommand="SELECT [ID], [FirstName], [LastName], [DoB] FROM [Doctor] ORDER BY [FirstName], [LastName]" UpdateCommand="UPDATE [Doctor] SET [FirstName] = @FirstName, [LastName] = @LastName, [DoB] = @DoB WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                            <asp:Parameter Name="FirstName" Type="String" />
                            <asp:Parameter Name="LastName" Type="String" />
                            <asp:Parameter DbType="Date" Name="DoB" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="FirstName" Type="String" />
                            <asp:Parameter Name="LastName" Type="String" />
                            <asp:Parameter DbType="Date" Name="DoB" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                    <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" DataSourceID="GetAllLabs" KeyFieldName="ID" Width="100%">
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                <EditButton Visible="True">
                                </EditButton>
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="Name" ShowInCustomizationForm="True" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Settings ShowFilterRow="True" ShowTitlePanel="True" />
                        <SettingsText Title="Labs' Information" />
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="GetAllLabs" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" DeleteCommand="DELETE FROM [Lab] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Lab] ([Name], [ID]) VALUES (@Name, @ID)" SelectCommand="SELECT [Name], [ID] FROM [Lab] ORDER BY [Name], [ID]" UpdateCommand="UPDATE [Lab] SET [Name] = @Name WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
        <dx:TabPage Text="New Doctor Form">
            <ContentCollection>
                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server">
                        <Items>
                            <dx:LayoutItem Caption="User Name">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E1" runat="server" Width="170px">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Password">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E2" runat="server" Password="True" Width="170px">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="First Name">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E9" runat="server" Width="170px">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Last Name">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E10" runat="server" Width="170px">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Specility">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxComboBox ID="ASPxFormLayout1_E3" runat="server" DataSourceID="GetAllDoctorSpecilities" TextField="SpecialtyTitle" ValueField="SpecialtyTitle">
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="GetAllDoctorSpecilities" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" SelectCommand="SELECT DISTINCT [SpecialtyTitle] FROM [Specialty] ORDER BY [SpecialtyTitle]"></asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Phone Number">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E4" runat="server" Width="170px">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="E-mail">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E5" runat="server" Width="170px">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Country">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxComboBox ID="ASPxFormLayout1_E8" runat="server" DataSourceID="GetAllCountries" OnSelectedIndexChanged="ASPxFormLayout1_E8_SelectedIndexChanged" TextField="Name" ValueField="Name">
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="GetAllCountries" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" SelectCommand="SELECT [Name] FROM [Country] ORDER BY [Name]"></asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="City">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxComboBox ID="ASPxFormLayout1_E7" runat="server" DataSourceID="GetAllCities" TextField="Name" ValueField="Name">
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="GetAllCities" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" SelectCommand="SELECT [Name] FROM [City] WHERE ([CountryID] = @CountryID)">
                                            <SelectParameters>
                                                <asp:SessionParameter DefaultValue="1" Name="CountryID" SessionField="C_ID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Address">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E6" runat="server" Width="170px">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Date of birth">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxCalendar ID="ASPxFormLayout1_E11" runat="server">
                                        </dx:ASPxCalendar>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption=" ">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxButton ID="ASPxFormLayout1_E12" runat="server" OnClick="ASPxFormLayout1_E12_Click" Text="Add Doctor">
                                        </dx:ASPxButton>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:ASPxFormLayout>
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
        <dx:TabPage Text="New Lab Form">
            <ContentCollection>
                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server">
                        <Items>
                            <dx:LayoutItem Caption="User Name">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="ASPxFormLayout2_E3" runat="server" Width="170px">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Lab Type">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxComboBox ID="ASPxFormLayout2_E7" runat="server" >
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="X-Ray" Value="X-Ray" />
                                                <dx:ListEditItem Text="Prosthetist" Value="Prosthetist" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Password">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="ASPxFormLayout2_E2" runat="server" Width="170px" Password="True">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Country">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxComboBox ID="ASPxFormLayout2_E9" runat="server" DataSourceID="GetCountries" OnSelectedIndexChanged="ASPxFormLayout2_E9_SelectedIndexChanged" TextField="Name" ValueField="Name">
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="GetCountries" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" SelectCommand="SELECT [Name] FROM [Country]"></asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="City">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxComboBox ID="ASPxFormLayout2_E8" runat="server" DataSourceID="GetCities" TextField="Name" ValueField="Name">
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="GetCities" runat="server" ConnectionString="<%$ ConnectionStrings:C__PROGRAM_FILES_MICROSOFT_SQL_SERVER_MSSQL11_SQLEXPRESS_MSSQL_DATA_DCMS_MDFConnectionString %>" SelectCommand="SELECT [Name] FROM [City] WHERE ([CountryID] = @CountryID)">
                                            <SelectParameters>
                                                <asp:SessionParameter DefaultValue="1" Name="CountryID" SessionField="C_ID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Phone Number">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="ASPxFormLayout2_E1" runat="server" Width="170px">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="E-Mail">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="ASPxFormLayout2_E4" runat="server" Width="170px">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Lab Name">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="ASPxFormLayout2_E6" runat="server" Width="170px">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Address">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxTextBox ID="ASPxFormLayout2_E5" runat="server" Width="170px">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption=" ">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxButton ID="ASPxFormLayout2_E10" runat="server" OnClick="ASPxFormLayout2_E10_Click" Text="Add Lab">
                                        </dx:ASPxButton>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:ASPxFormLayout>
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
    </TabPages>
</dx:ASPxPageControl>
</asp:Content>